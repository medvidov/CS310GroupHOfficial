def full_path(page)
    return "localhost:8080/ImHungry2" + page
end

Given(/^I visit previous query$/) do
	visit full_path('/Search.jsp')
	page.driver.browser.navigate.refresh
	click_button('coffee-10-10.0')
end

Then(/^I should see buttons for pagination$/) do
    expect(page).to have_css('.pagination')
end

Then(/^I should see the first five items$/) do
	#expected restaurants
 	page.should have_content('West Annenberg Cafe')
 	page.should have_content('Joyce J Cammilleri Cafe')
 	page.should have_content('Literatea')
 	page.should have_content('The Coffee Bean & Tea Leaf')
 	page.should have_content('The Cafe Feat Illy')
 	#expected recipes
 	page.should have_content('Chocolate Coffee Kiss')
 	page.should have_content('Irish Coffee')
 	page.should have_content('Flavored Latte')
 	page.should have_content('Simple Coffee Drink')
 	page.should have_content('Cappuccino Cooler')
 	
 	#expected on next page
 	page.should have_no_content('Trojan Grounds')
 	page.should have_no_content('Starbucks')
 	page.should have_no_content('Ground Zero Performance Cafe')
 	page.should have_no_content('Fertitta Cafe')
 	page.should have_no_content('Iced Mochas')
 	page.should have_no_content('Easy Iced Coffee')
 	page.should have_no_content('Cold-Brewed Coffee')
 	page.should have_no_content('Pumpkin Spiced Latte')
 	page.should have_no_content('Bailey\'s Sundae Coffee Drink')
 	
end

When(/^I click "([^"]*)"$/) do |arg1|
    find('li.page-item', :text => arg1).click
end

Then(/^I should be on page "([^"]*)"$/) do |arg1|
	#text = page.find('li#page'+arg1+'.page-item.active').text
    #assert_equal(text, arg1)
    page.has_css?('li#page'+arg1+'.page-item.active')
end

Then(/^I should see the next five items$/) do
	#expected restaurants
	page.should have_content('Trojan Grounds')
 	page.should have_content('Starbucks')
 	page.should have_content('Ground Zero Performance Cafe')
 	page.should have_content('Fertitta Cafe')
 	page.should have_content('The Coffee Bean & Tea Leaf')
 	#expected recipes
 	page.should have_content('Iced Mochas')
 	page.should have_content('Easy Iced Coffee')
 	page.should have_content('Cold-Brewed Coffee')
 	page.should have_content('Pumpkin Spiced Latte')
 	page.should have_content('Bailey\'s Sundae Coffee Drink')
 	
	#expected on previous page
    page.should have_no_content('West Annenberg Cafe')
 	page.should have_no_content('Joyce J Cammilleri Cafe')
 	page.should have_no_content('Literatea')
 	page.should have_no_content('The Cafe Feat Illy')
 	page.should have_no_content('Chocolate Coffee Kiss')
 	page.should have_no_content('Irish Coffee')
 	page.should have_no_content('Flavored Latte')
 	page.should have_no_content('Simple Coffee Drink')
 	page.should have_no_content('Cappuccino Cooler')
end

