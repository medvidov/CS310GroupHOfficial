Given(/^I am on the Search page$/) do
    visit 'http://localhost:8080/ImHungry2/Search.jsp'
end

Then(/^I should see a field for radius$/) do
    page.should have_field('radius')
end

Then(/^I should see a label for miles$/) do
    page.should have_content('miles')
end

When(/^I enter (\d+) into the radius box$/) do |arg|
    fill_in 'radius', with: arg
end

When(/^I enter \-(\d+) into the radius box$/) do |arg|
    fill_in 'radius', with: arg
end

Then(/^I should see no change$/) do
    expect(page).to have_current_path(/\/Search(.*)/)
end

When(/^I enter "crawfish" into the search box$/) do
    #fill_in 'query', with: 'crawfish'
  find('#meditarian').click
end

When(/^I enter "hamburger" into the search box$/) do
    fill_in 'query', with: 'hamburger'
end

And(/^I click the "Feed Me!" button$/) do
    find('#searchBtn').click
end

Then(/^I should be on the Results Page$/)do
    page.should have_content('Results for')
end

And(/^I should see Restaurants within radius (\d+)$/) do |arg|
    maxDistance = 11200/1.2/60
    #Need to get an array of the distances somehow
end

When(/^I enter 0.1 into the radius box$/) do
    fill_in 'radius', with: 0.1
end

Then(/^an error message should appear on the results page$/) do
    page.should have_content('No Restaurants within range!')
end
