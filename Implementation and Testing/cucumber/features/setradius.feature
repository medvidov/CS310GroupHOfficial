<<<<<<< HEAD
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
=======
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
>>>>>>> 3794f866bd08e609dac54ec23a79e7dda23ffd2a
