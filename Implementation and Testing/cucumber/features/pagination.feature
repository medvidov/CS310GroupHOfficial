Feature: Pagination
    Ensure pagination feature is present and works correctly

Background:
    Given I am on the Search Page
    And I search for "coffee"
    And I enter 10 into the number box
    And I clicked the Feed Me! button
    
Scenario: Pagination CSS Features
    Then I should see buttons for restaurant pagination
    And I should see buttons for recipe pagination
    And I should see the first five items
    And I should see the first five items

Scenario Outline: Switch pages next and previous
    When I click "Next" on list <list>
    Then I should be on page "2" of list <list>
    And I should see the next five items
    When I click "Previous" on list <list>
    Then I should be on page "1" of list <list>
    And I should see the first five items in list <list>
    When I click "Last" on list <list>
    Then I should be on page "4" of list <list>
    And I should only see five page buttons
    When I click "First" on list <list>
    Then I should be on page "1" of list <list>

    Examples:
    | list |
    | "resPagination" |
    | "recPagination" |