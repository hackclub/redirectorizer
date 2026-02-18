module Redirectorizer
  Rule = Struct.new(:type, :domain, :destination, :headers, :code, :strip_args, keyword_init: true)

  class Config
    attr_reader :rules

    def initialize
      @rules = []
      @header_stack = [{}]
    end

    def config(&block)
      instance_eval(&block)
    end

    def extra_headers(headers = {}, &block)
      @header_stack.push(@header_stack.last.merge(headers))
      instance_eval(&block)
      @header_stack.pop
    end

    def redirect(domain, to:, code: 301, strip_args: false)
      @rules << Rule.new(
        type: :redirect,
        domain:,
        destination: to,
        headers: @header_stack.last.dup,
        code:,
        strip_args:
      )
    end

    def proxy(domain, to:)
      @rules << Rule.new(
        type: :proxy,
        domain:,
        destination: to,
        headers: @header_stack.last.dup,
        code: nil,
        strip_args: false
      )
    end
  end

  class Generator
    def initialize(rules)
      @rules = rules
    end

    def to_nginx_conf
      lines = []
      lines << PREAMBLE
      lines << 'http {'
      lines << '    access_log /dev/stdout combined;'
      lines << ''
      @rules.each { |rule| lines << server_block(rule) }
      lines << '}'
      lines << ''
      lines.join("\n")
    end

    private

    PREAMBLE = <<~EOC
      user nginx;

      pid /run/nginx.pid;

      worker_processes auto;

      events {
          use                 epoll;
          worker_connections  2048;
          multi_accept        on;
      }

      error_log /dev/stdout error;

    EOC

    def server_block(rule)
      lines = []
      lines << '    server {'
      lines << '        listen 80;'
      lines << "        server_name #{rule.domain};"
      lines << '        add_header Server "redirectorizer";'

      rule.headers.each do |key, value|
        lines << "        add_header #{key} \"#{value}\";"
      end

      case rule.type
      when :redirect
        suffix = rule.strip_args ? '' : '$request_uri'
        lines << "        return #{rule.code} #{rule.destination}#{suffix};"
      when :proxy
        lines << ''
        lines << '        location / {'
        lines << '            resolver 1.1.1.1;'
        lines << "            proxy_pass #{rule.destination}$request_uri;"
        lines << '            proxy_set_header Host $host;'
        lines << '            proxy_set_header X-Real-IP $remote_addr;'
        lines << '            proxy_ssl_server_name on;'
        lines << '        }'
      end

      lines << '    }'
      lines << ''
      lines.join("\n")
    end
  end
end
