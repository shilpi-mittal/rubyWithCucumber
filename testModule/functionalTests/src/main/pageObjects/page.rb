class Page
  private
  attr_accessor :test_web_driver

  def initialize(test_web_driver)
    @test_web_driver=test_web_driver
  end

  def access_home_page
    test_web_driver.navigate_to '/'
    HomePage.new test_web_driver
  end
end