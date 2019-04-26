def full_path(page)
   return "localhost:8080/ImHungry2" + page
end

Given(/^I am on the search page$/) do
   visit 'http://localhost:8080/ImHungry2/Search.jsp'
end

And(/^I search for chicken$/) do
   fill_in 'query', with: 'chicken'
end

When(/^I visit the grocery list$/) do
  visit 'http://localhost:8080/ImHungry2/Grocery.jsp'
end

And(/^I clicked the "Feed Me!" button$/) do
   find('#searchBtn').click
end

When(/^I click the grocery list button$/) do
 find('#grocery').click
end

Then(/^the page should be blank$/) do

end

Then (/^I should be on that recipes page$/) do
   page.should have_content('Chicken Marsala Over White Rice')
end

And (/^I should see the button to add to the grocery list$/) do
    find('#addGrocery').click
end

When (/^I click Return to Results$/) do
   visit 'http://localhost:8080/ImHungry2/Results.jsp'
end

And (/^I should see the grocery list button$/) do
 #find('#grocery')
end

When (/^I click Grocery List$/) do
 visit 'http://localhost:8080/ImHungry2/Grocery.jsp'
end

Then(/^I should see a recipes groceries$/) do
 page.should have_content('2 cups water')
 page.should have_content('1 tablespoon olive oil')
end

When(/^I click the red "x" next to a grocery item$/) do
    find(:xpath, '//*[@id="delete0"]').click
end

Then(/^that item should be deleted$/) do
	page.should have_no_content('1 cup uncooked white rice')
end

Then(/^that item should still be deleted$/) do
	page.should have_no_content('1 cup uncooked white rice')
end
