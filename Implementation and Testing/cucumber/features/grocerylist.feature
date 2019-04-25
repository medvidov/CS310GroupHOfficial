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
	
Scenario: Delete food from a grocery list
	When I click a recipe
	Then I should be on that recipes page
	And I should see the button to add to the grocery list
	And I should see the grocery list button
	When I visit the grocery list
	When I click the red "x" next to a grocery item
	Then that item should be deleted
	
Scenario: List is maintained
	When I click a recipe
	Then I should be on that recipes page
	And I should see the button to add to the grocery list
	And I should see the grocery list button
	When I visit the grocery list
	Then I should see a recipes groceries
	When I click the red "x" next to a grocery item
	Then that item should be deleted
	When I click Return to Results
	Then I should be on the results page
	And I should see the grocery list button
	When I visit the grocery list
	Then that item should still be deleted
