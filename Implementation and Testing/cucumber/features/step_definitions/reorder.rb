And(/^I click previous query "([^"]*)"$/) do |arg|
    click_on(arg)
end

And(/^I add to the "Favorite" page$/) do
    find('#addTo').click
    click_on('Favorite List')
end

Given(/^I am on the favorites list$/) do
   find('#navbarDropdownMenuLink').click
   click_on('Favorite List')
end

Given(/^I click the up arrow on the second item$/) do
   find('#restaurant0UpButton').click
end

Then(/^the second item will now be the first item on the list$/) do
   page.should have_content('Panda Express')
end

Given(/^I click the down arrow on the first item$/) do
   find('#restaurant0DownButton').click
end

Then(/^the first item will now be the second item on the list$/) do
   page.should have_content('Panda Express')
end
