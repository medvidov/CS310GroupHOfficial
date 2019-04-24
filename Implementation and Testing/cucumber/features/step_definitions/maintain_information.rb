Given(/^I log a user$/) do

end

Given(/^I add the first chicken recipe to my grocery list$/) do
   visit 'http://localhost:8080/ImHungry2/Recipe.jsp?id=d169c4e4458c57b0c803aaaa474156c0604870d42d4e9dc1119db7e876af7261'
   find('#addGrocery').click
end

Given(/^I log the user out$/) do

end

Given(/^I close the browser$/) do
   page.execute_script "window.close();"
end

Given(/^I restart the system$/) do
   visit "localhost:8080/ImHungry2/Search.jsp"
end

Given(/^I log the same user back in$/) do
   visit 'http://localhost:8080/ImHungry2/Grocery.jsp'
end

Given(/^I go to the results page$/) do
   visit 'http://localhost:8080/ImHungry2/Results.jsp'
  # fill_in 'query', with: 'burger'
  # find('#searchBtn').click
end

Given(/^I go to the grocery list page$/) do
  visit 'http://localhost:8080/ImHungry2/Grocery.jsp'
  # find('#grocery').click
end

Then(/^I should see the ingredients for the first chicken recipe$/) do
  # page.should have_content('1 cup uncooked white rice')
  # page.should have_content('2 cups water')
  # page.should have_content('1 cup all-purpose flour')
  # page.should have_content('salt to taste')
  # page.should have_content('ground black pepper to taste')
  # page.should have_content('1 pinch dried oregano to taste')
  # page.should have_content('1 pound skinless, boneless chicken cutlets, pounded to 1/4-inch thickness')
  # page.should have_content('1 tablespoon olive oil')
  # page.should have_content('2 tablespoons butter, divided')
  # page.should have_content('1 clove garlic, minced')
  # page.should have_content('1 cup sliced fresh mushrooms')
  # page.should have_content('salt and ground black pepper to taste')
  # page.should have_content('1/2 cup Marsala wine')
  # page.should have_content('1/2 cup chicken stock')
end

Then(/^I should see chicken under the previous queries at the bottom of the results page$/) do
   #page.should have_content('chicken')
end
