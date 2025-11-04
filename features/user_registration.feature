Feature: User registration and login with Context7

  Background:
    Given Context7 is initialized

  Scenario: User successfully registers and logs in
    When the user submits valid registration details
    Then the user should be created in the system
    And Context7 should update the context for the new user

    When the user logs in with valid credentials
    Then the user should see their profile page
    And Context7 should reflect the active user context
