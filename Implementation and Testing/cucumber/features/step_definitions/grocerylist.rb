def full_path(page)
   return "localhost:8080/ImHungry2" + page
end

Given(/^I am on the search page$/) do
   visit 'http://localhost:8080/ImHungry2/Search.jsp'
end

And(/^I search for chicken$/) do
   fill_in 'query', with: 'chicken'
end

And(/^I want 5 results per page$/) do
    
end

And(/^I want a radius of 10$/) do

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

When(/^I click a recipe$/) do
 #find(:xpath, "//a[@href='/Recipe.jsp?id=7d3245104a40d6ddd17a01d4dbba055f4b39f372de5cf225036ab44993dfbe31']").click
end
Then (/^I should be on that recipes page$/) do
  # page.should have_content('Spicy Thai Basil Chicken (Pad Krapow Gai)')
end

And (/^I should see the button to add to the grocery list$/) do
 #find('#addGrocery').click
end

When (/^I click Return to Results$/) do
   visit 'http://localhost:8080/ImHungry2/Results.jsp'
# find('#results').click
end

Then (/^I should be on the results page$/) do
 #page.should have_content('Results for chicken')
end

And (/^I should see the grocery list button$/) do
 #find('#grocery')
end

When (/^I click Grocery List$/) do
 visit 'http://localhost:8080/ImHungry2/Grocery.jsp'
 #find('#grocery').click
end

Then(/^I should see a recipes groceries$/) do
 #page.should have_content('1/3 cup chicken broth')
 #page.should have_content('1 tablespoon oyster sauce')
end
