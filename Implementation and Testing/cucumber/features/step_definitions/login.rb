Given(/^I click the login button$/) do
    find(:xpath, '//*[@id="login"]/div[1]/button').click
end

Given(/^click the Log In button to sign in$/) do
    find(:xpath, '//*[@id="form"]/div[4]/input').click
end

Then(/^I should be redirected to the search page that says Hi + username$/) do
    page.should have_content('Hi Alec!')
end

Given(/^click the Log In button$/) do
    find(:xpath, '//*[@id="form"]/div[4]/input').click
end

Then(/^I should see an error message on the login page$/) do
    page.should have_content('')
end

Then(/^I go back to the search page$/) do
    visit 'http://localhost:8080/ImHungry2/Search.jsp'
end

Then(/^I log out of my account$/) do
    visit 'http://localhost:8080/ImHungry2/Search.jsp'
    find(:xpath, '//*[@id="login"]/div[2]/button').click
end

Then(/^I click the Login button$/) do
    find(:xpath, '//*[@id="login"]/div[1]/button').click
end

Then(/^click the Log In button to sign in$/) do
    find(:xpath, '//*[@id="form"]/div[4]/input').click
end

Then(/^I should be redirected to the search page that says Hi + username$/) do
    visit 'http://localhost:8080/ImHungry2/Search.jsp'
    page.should have_content('Hi Alec!')
end

Given(/^I click the sign up button$/) do
    find(:xpath, '//*[@id="login"]/div[2]/button').click
end

Given(/^click the Sign Up button$/) do
    find(:xpath, '//*[@id="form"]/div[5]/input')
end

Then(/^I should see an error on the sign up page$/) do
    page.should have_content('')
end

Given(/^I enter a new username$/) do
    fill_in 'username', with: 'Alec5'
end

Given(/^I enter a new password and confirm password$/) do
    fill_in 'myInput', with: 'newpassworD1!'
    fill_in 'password2', with: 'newpassworD1!'
end

Given(/^I click sign up$/) do
    find(:xpath, '//*[@id="form"]/div[5]/input')
end

Then(/^I should see the success message$/) do
    page.should have_content('')
end

Given(/^I log in with my new username and password$/) do
    fill_in 'username', with: 'Alec'
    fill_in 'myInput', with: 'HelloBram123!'
end

Given(/^I click the Log In button$/) do
    find(:xpath, '//*[@id="form"]/div[4]/input').click
end

Then(/^I should be successfully logged in$/) do
    visit 'http://localhost:8080/ImHungry2/Search.jsp'
    page.should have_content('Hi Alec!')
end

Then(/^I search for burger$/) do
    fill_in 'query', with: 'burger'
    find('#searchBtn').click
end

Then(/^there should not be a previous query of chicken$/) do
    page.should have_no_content('chicken')
end

Given(/^I return to the search page$/) do
    visit 'http://localhost:8080/ImHungry2/Search.jsp'
end

Given(/^I search for chinese$/) do
    fill_in 'query', with: 'chinese'
    find('#searchBtn').click
end

Then(/^I should see my previous query of chicken$/) do
    page.should have_content('')
end

Given(/^log in with the username "([^"]*)" and password "([^"]*)"$/) do |string, string2|
    fill_in 'username', with: string
    fill_in 'myInput', with: string2
end

Given(/^sign up with the username "([^"]*)" and password "([^"]*)"$/) do |string, string2|
    fill_in 'username', with: string
    fill_in 'myInput', with: string2
    fill_in 'password2', with: string2
end

Then(/^I should see an error on the sign up page saying invalid password$/) do
    page.should have_content('')
end

Then(/^I should see an error on the sign up page saying repeat username$/) do
    page.should have_content('')
end

Then(/^I should be redirected to the search page that says Hi username$/) do
    visit 'http://localhost:8080/ImHungry2/Search.jsp'
    page.should have_content('Hi Alec!')
end

Given(/^sign up with the username "([^"]*)" and a valid password "([^"]*)"$/) do |string, string2|
    fill_in 'username', with: string
    fill_in 'myInput', with: string2
    fill_in 'password2', with: string2
end
