#!/usr/bin/env ruby
require_relative "engine"

cfg = Redirectorizer::Config.new
cfg.instance_eval(File.read(File.join(__dir__, "rules.rb")))
domains = cfg.rules.map(&:domain).uniq

if ARGV.include?("--coolify")
    coolify_domains = domains.reject { |d| d.include?("*") }
    puts (coolify_domains.map{|d| "http://#{d}"} + coolify_domains.map{|d| "https://#{d}"}).join ?,
else
    puts domains
end
