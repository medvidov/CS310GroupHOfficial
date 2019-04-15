Feature: Set radius 

Background:
	Given I am on the search page
	
Scenario: Radius search included  
	Then I should see a field for radius
	And I should see a label for miles

Scenario Outline: Text box does not allow integers below 1
	When I enter <radius> into the radius box
	Then I should see no change

	Examples:
		| radius |
		| 0 |
		| -1 |
		| -5 |
		| -20 |
		| -100 |

Scenario Outline: Search for valid radius
	When I enter "hamburger" into the search box
	And I enter <radius> into the radius box
	And I click the "Feed Me!" button 
	Then I should be on the Results Page
	And I should see Restaurants within radius <radius>

	Examples:
		| radius |
		| 1 |
		| 10 |
		
Scenario: Radius is too small to have any restaurant results
	When I enter "crawfish" into the search box
	And I enter 0.1 into the radius box
	And I click the "Feed Me!" button
	Then an error message should appear on the results page
