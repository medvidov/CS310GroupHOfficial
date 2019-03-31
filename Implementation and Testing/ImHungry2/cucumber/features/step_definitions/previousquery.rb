def full_path(page)
   return "localhost:8080/ImHungry2" + page
end

Given(/^I am on the Search Page$/) do
   visit 'http://localhost:8080/ImHungry2/Search.jsp'
end

And(/^I search for Chicken$/) do
   fill_in 'query', with: 'Chicken'
end

And(/^I want 5 results$/) do

end

And(/^I want radius 10$/) do

end

And(/^I clicked the Feed Me! button$/) do
   find('#searchBtn').click
end

When(/^I am on the results page$/) do
 page.should have_content('Results for Chicken')
end

And(/^I should see "Panda Express"$/) do
 page.should have_content('Panda Express')
end

And(/^I should see "Lemonade"$/) do
 page.should have_content('Lemonade')
end

And(/^I should see "Seeds Marketplace"$/) do
 page.should have_content('Seeds Marketplace')
end

When(/^I search again$/) do
   find('#toSearch').click
end

Then(/^I should see my previous queries$/)do
   page.should have_content('Previous Queries:')
end

When(/^I click on "chicken-5-10.0"$/) do
    page.driver.browser.navigate.refresh
   click_button('chicken-5-10.0')
end

When(/^I should go to the results page$/) do
 page.should have_content('Results for Chicken')
end
