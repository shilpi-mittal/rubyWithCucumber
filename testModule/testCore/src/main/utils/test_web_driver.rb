class TestWebDriver
  private
  attr_accessor :driver

  def initialize(web_driver)
    @driver = web_driver
  end

  def navigate_to(url)
    driver.navigate url
  end

  def is_element_displayed(element_id)
    driver.displayed?(:id, element_id)
  end

  def send_keys(element, param)
    element.send_keys param
  end
end