def full_path(page)
  return "localhost:8080/ImHungry2" + page
end

Given(/^I am on the Search Page$/) do
  visit 'http://localhost:8080/ImHungry2/Search.jsp'
end

And(/^I search for "([^"]*)"$/) do |arg|
  fill_in 'query', with: arg
end


And(/^I clicked the Feed Me! button$/) do
  find('#searchBtn').click
end

When(/^I am on the results page$/) do
#page.should have_content('Results for Chicken')
end

And(/^I should see "Panda Express"$/) do
#page.should have_content('Panda Express')
end

And(/^I should see "Lemonade"$/) do
#page.should have_content('Lemonade')
end

And(/^I should see "Seeds Marketplace"$/) do
#page.should have_content('Seeds Marketplace')
end

When(/^I go to Results$/) do
  visit 'http://localhost:8080/ImHungry2/Results.jsp'
  page.driver.browser.navigate.refresh
end

Then(/^I should see my previous queries$/)do
 # page.should have_content('Previous Queries')
end

When(/^I click on "Chicken"$/) do
 # click_button('Chicken')
end

When(/^I should go to the results page$/) do
#page.should have_content('Results for Chicken')
end

Then(/^I should see previous queries in a scroll menu at the bottom$/) do
end

Then(/^I should see a button with label "([^"]*)"$/) do |string|
end

Then(/^I should see image for search "([^"]*)"$/) do |string|
end