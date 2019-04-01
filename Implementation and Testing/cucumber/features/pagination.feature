Feature: Pagination
	Ensure pagination feature is present and works correctly

Background:
	Given I am on the Search Page
	And I search for "coffee"
	And I enter 10 into the number box
	And I clicked the Feed Me! button
	Given I visit previous query "coffee-10-10.0"
	
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
