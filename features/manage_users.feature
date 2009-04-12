Feature: Manage users
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new user
    Given I am on the new user page
    When I fill in "Name" with "name 1"
    And I fill in "Pasword" with "pasword 1"
    And I fill in "Email" with "email 1"
    And I press "Create"
    Then I should see "name 1"
    And I should see "pasword 1"
    And I should see "email 1"

  Scenario: Delete user
    Given the following users:
      |name|pasword|email|
      |name 1|pasword 1|email 1|
      |name 2|pasword 2|email 2|
      |name 3|pasword 3|email 3|
      |name 4|pasword 4|email 4|
    When I delete the 3rd user
    Then I should see the following users:
      |name|pasword|email|
      |name 1|pasword 1|email 1|
      |name 2|pasword 2|email 2|
      |name 4|pasword 4|email 4|
