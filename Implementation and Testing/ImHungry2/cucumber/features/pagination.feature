Feature: Pagination
	Ensure pagination feature is present and works correctly

Background:
	Given I visit previous query
	
Scenario: Pagination CSS Features
	Then I should see buttons for pagination
	And I should see the first five items

Scenario: Switch pages next and previous
	When I click "Next" 
	Then I should be on page "2"
	And I should see the next five items 
	When I click "Previous"
	Then I should be on page "1"
	And I should see the first five items
