def full_path(page)
   return "localhost:8080/ImHungry2" + page
end

Given(/^I visit previous query "([^"]*)"$/) do |arg|
    visit full_path('/Search.jsp')
    page.driver.browser.navigate.refresh
    click_button(arg)
end

When(/^I enter (\d+) into the number box$/) do |arg1|
 #  page.fill_in 'num', with: arg1
end

Then(/^I should see buttons for restaurant pagination$/) do
  # expect(page).to have_css('#resPagination')
end

Then(/^I should see buttons for recipe pagination$/) do
  # expect(page).to have_css('#recPagination')
end

Then(/^I should see the first five items$/) do
    #expected restaurants
  #  page.should have_content('West Annenberg Cafe')
  #  page.should have_content('Joyce J Cammilleri Cafe')
  #  page.should have_content('Literatea')
  #  page.should have_content('The Coffee Bean & Tea Leaf')
  #  page.should have_content('The Cafe Feat Illy')
    #expected recipes
   # page.should have_content('Chocolate Coffee Kiss')
   # page.should have_content('Irish Coffee')
   # page.should have_content('Flavored Latte')
    
    #expected on next page
  #  page.should have_no_content('Trojan Grounds')
  #  page.should have_no_content('Starbucks')
  #  page.should have_no_content('Ground Zero Performance Cafe')
   # page.should have_no_content('Fertitta Cafe')
  #  page.should have_no_content('Cold-Brewed Coffee')
  #  page.should have_no_content('Pumpkin Spiced Latte')
  #  page.should have_no_content('Bailey\'s Sundae Coffee Drink')
    
end

When(/^I click "([^"]*)"$/) do |arg1|
  # find('li.page-item', :text => arg1).click
end

Then(/^I should be on page "([^"]*)"$/) do |arg1|
  # page.has_css?('li#page'+arg1+'.page-item.active')
end

Then(/^I should see the next five items$/) do
    #expected restaurants
   # page.should have_content('Trojan Grounds')
 #   page.should have_content('Starbucks')
   # page.should have_content('Ground Zero Performance Cafe')
   # page.should have_content('Fertitta Cafe')
   # page.should have_content('The Coffee Bean & Tea Leaf')
    #expected recipes
   # page.should have_content('Cold-Brewed Coffee')
   # page.should have_content('Pumpkin Spiced Latte')
   # page.should have_content('Bailey\'s Sundae Coffee Drink')
    
    #expected on previous page
  #  page.should have_no_content('West Annenberg Cafe')
   # page.should have_no_content('Joyce J Cammilleri Cafe')
  #  page.should have_no_content('Literatea')
  #  page.should have_no_content('The Cafe Feat Illy')
  #  page.should have_no_content('Chocolate Coffee Kiss')
  #  page.should have_no_content('Flavored Latte')
  #  page.should have_no_content('Simple Coffee Drink')
end

When(/^I click "([^"]*)" on list "([^"]*)"$/) do |string, string2|
  # find('#'+string2+' > li.page-item', :text => string).click
end

Then(/^I should be on page "([^"]*)" of list "([^"]*)"$/) do |string, string2|
  # page.has_css?('li#page'+arg1+'.page-item.active')
end

Then(/^I should see the next five items in list "([^"]*)"$/) do |string|

end

Then(/^I should see the first five items in list "([^"]*)"$/) do |string|

end

Then(/^I should only see five page buttons$/) do

end
