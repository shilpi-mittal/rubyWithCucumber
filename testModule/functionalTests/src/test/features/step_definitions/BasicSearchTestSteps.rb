class BasicSearchTestSteps < TestCaseHelper

Given(/^I access home page$/) do
  page = Page.new test_web_driver
  page.access_home_page
end

Then(/^I verify logo is displayed$/) do
  home_page = HomePage.new test_web_driver
  verify{assert(home_page.is_logo_displayed)}
end

When(/^I enter search parameter "([^"]*)"$/) do |param|
  home_page = HomePage.new test_web_driver
  home_page.enter_search_param(param)
end

end
