Feature: Grocery List

Background: 
	Given I am on the search page
	And I search for chicken
	
Scenario: No food is in the grocery list
	When I visit the grocery list
	Then the page should be blank
	
Scenario: Add food to grocery list
	When I click a recipe
	Then I should be on that recipes page
	And I should see the button to add to the grocery list
	When I click Return to Results
	Then I should be on the results page
	And I should see the grocery list button
	When I visit the grocery list
	Then I should see a recipes groceries
