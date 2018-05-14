class TestCaseHelper
  private
  attr_accessor :test_web_driver

  # require File.expand_path("config/environment")
  require 'rubygems'
  require 'selenium'
  require 'selenium-webdriver'
  require 'rspec'
  # Dir["testModule/functionalTests/src/main/pageObjects/*.rb"].each { |filepath| require File.expand_path(filepath) }
  RSpec.configure do |config|
    config.before(:each) do
      @driver = Selenium::WebDriver.for :firefox
      @driver.get "http://google.com"
      @driver.start
      @driver.window_maximize
    end

    config.after(:each) { @driver.stop }
  end

  @test_web_driver = TestWebDriver.new @driver

end