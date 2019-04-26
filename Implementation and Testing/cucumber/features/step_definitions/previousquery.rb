def full_path(page)
  return "localhost:8080/ImHungry2" + page
end

Given(/^I am on the Search Page$/) do
  visit 'http://localhost:8080/ImHungry2/Search.jsp'
end

And(/^I search for "([^"]*)"$/) do |arg|
  fill_in 'query', with: arg
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

When(/^I go to Results$/) do
  visit 'http://localhost:8080/ImHungry2/Results.jsp'
  page.driver.browser.navigate.refresh
end

When(/^I should go to the results page$/) do
    expect(page).to have_current_path(/\/Results.jsp(.*)/)
end

Then(/^I should see previous queries in a scroll menu at the bottom$/) do
    page.should have_content('Previous Queries')
end

Then(/^I should see a button with label "([^"]*)"$/) do |string|
page.should have_content(string)
end

Then(/^I should see "([^"]*)" pq listed first$/) do |arg|
first('h4.card-title').assert_text(arg)
end

Then(/^I should see all images from collage$/) do
    expect(page).to have_css("img[src*='https://www.maangchi.com/wp-content/uploads/2018/02/roasted-chicken-1.jpg']")
    expect(page).to have_css("img[src*='https://static01.nyt.com/images/2018/10/18/dining/ch-maple-roast-chicken-horizontal/ch-maple-roast-chicken-horizontal-threeByTwoMediumAt2X-v2.jpg']")
    expect(page).to have_css("img[src*='https://images-gmi-pmc.edge-generalmills.com/7ed1e04a-7ac6-4ca2-aa74-6c0938069062.jpg']")
    expect(page).to have_css("img[src*='https://www.yellowblissroad.com/wp-content/uploads/2015/07/lemon-chicken-fb.jpg']")
    expect(page).to have_css("img[src*='https://media.socastsrm.com/wordpress/wp-content/blogs.dir/1294/files/2019/03/CHicken.jpg']")
    expect(page).to have_css("img[src*='https://bmexdi064h-flywheel.netdna-ssl.com/wp-content/uploads/2018/01/Baked-Bone-In-Chicken-Breasts-foodiecrush.com-019.jpg']")
    expect(page).to have_css("img[src*='https://www.cookingclassy.com/wp-content/uploads/2018/10/roast-chicken-1.jpg']")
    expect(page).to have_css("img[src*='https://cf-images.us-east-1.prod.boltdns.net/v1/static/1033249144001/7cf82a4e-acc7-463f-850f-c4b334434a01/5ae8e8b6-2114-44a6-9267-b60eee6168a5/1280x720/match/image.jpg']")
    expect(page).to have_css("img[src*='https://cdn.apartmenttherapy.info/image/fetch/f_auto,q_auto:eco/https://storage.googleapis.com/gen-atmedia/3/2014/09/64e872a051ef678757dd5534fae158e41d754b28.jpeg']")
    expect(page).to have_css("img[src*='https://cms.splendidtable.org/sites/default/files/styles/w2000/public/one-pot-tarragon-chicken-mushrooms-rice_c_Helen-Cathcart-LEDE.jpg?itok=pLJb-Gp1']")
end
