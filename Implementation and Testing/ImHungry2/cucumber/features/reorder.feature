Feature: Reorder any of the three predetermined lists 

Background: 
	Given I click a previous query

Scenario Outline: Adding to lists and checking reordering
	And I add <item1> to the <page> page
	And I click the "Return to Results" button
	And I add <item2> to the <page> page
	And I click the "Return to Results" button
	And I add <item3> to the <page> page 
	And I click the "Return to Results" button
	And I visit the favorites page
	When I drag <item3> to the top
	Then I should see <item3> listed first
	And I should see <item1> listed second
	And I should see <item2> listed third
	When I drag <item2> to the middle
	Then I should see <item3> listed first
	And I should see <item2> listed second
	And I should see <item1> listed third
	
	Examples:
	| item1 | item2 | item3 | page |
	| "West Annenberg Cafe" | "Literatea" | "Irish Coffee" | "Favorite" |
	| "West Annenberg Cafe" | "Literatea" | "Irish Coffee" | "Do Not Show" |
	| "West Annenberg Cafe" | "Literatea" | "Irish Coffee" | "To Explore" |