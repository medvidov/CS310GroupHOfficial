Then(/^I should see a background image$/) do
    page.should have_css('div.bg')
    bg = page.find('div.bg')
    bg.matches_style?('background-image' => 'url(img/background.jpg)')
end

Then(/^I should see styled font different from default$/) do
    #fontsize1 = find('div.title').native.css_value('font-size')
    fontsize2 = find('body').native.css_value('font-size')
    #expect(fontsize1).not_to eq(16)
    expect(fontsize2).not_to eq(16)
end

Then(/^I should see a navbar$/) do
    page.should have_css('nav')
end

When(/^I click on "([^"]*)"$/) do |string|
    find('h3', :text => string).click
end

Then(/^items should be centered$/) do
    page.should have_css('div.text-center')
end
