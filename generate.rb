#!/usr/bin/env ruby
require_relative "engine"

cfg = Redirectorizer::Config.new
cfg.instance_eval(File.read(File.join(__dir__, "rules.rb")))
print Redirectorizer::Generator.new(cfg.rules).to_nginx_conf
