require 'rubygems' unless RUBY_VERSION == 1.9
require 'sinatra'
require 'active_record'
require 'base62'
require File.expand_path('application')
require File.expand_path('Link')

run Application
