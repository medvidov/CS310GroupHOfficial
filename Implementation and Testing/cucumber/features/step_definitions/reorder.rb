And(/^I add "Chicken Marsala Over White Rice" to the "Favorite" page$/) do
    visit('http://localhost:8080/ImHungry2/Recipe.jsp?id=d169c4e4458c57b0c803aaaa474156c0604870d42d4e9dc1119db7e876af7261')
    find('#addTo').click
end

And(/^I add "San Diego Grilled Chicken" to the "Favorite" page$/) do
    visit('http://localhost:8080/ImHungry2/Recipe.jsp?id=6f1f07c97ec2dc5bcb3fd99495d75bb49e5856cc2dc608bfd7e35778c1ddf2c1')
    find('#addTo').click
end

Given(/^I am on the favorites list$/) do
    visit 'http://localhost:8080/ImHungry2/Favorite.jsp'
end

Given(/^I click the up arrow on the second item$/) do
    find_by_id('recipe0UpButton').click
end

Then(/^the second item will now be the first item on the list$/) do
    page.should have_content('Chicken Marsala Over White Rice')
end

Given(/^I click the down arrow on the first item$/) do
    find('recipe0DownButton').click
end

Then(/^the first item will now be the second item on the list$/) do
    page.should have_content('San Diego Grilled Chicken')
end
