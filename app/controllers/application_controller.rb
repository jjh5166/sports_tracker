class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  require 'date'
  USERNAME = open('lib/assets/.username').first.chomp
  PASSWORD = open('lib/assets/.password').first.chomp
  $msf = MySportsFeeds.new(version="1.2", true)
  $msf.authenticate(USERNAME, PASSWORD)
end
