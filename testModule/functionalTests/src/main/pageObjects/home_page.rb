class HomePage < Page

  private
  attr_accessor :test_web_driver

  def initialize(test_web_driver)
    @test_web_driver=test_web_driver
  end

  def is_logo_displayed
    @is_displayed=test_web_driver.is_element_displayed('hplogo')
  end

  def enter_search_param(param)
    element = test_web_driver.find_element(:name, 'q')
    test_web_driver.send_keys(element, param)
  end
end