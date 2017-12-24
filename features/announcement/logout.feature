Feature: Allow Announcement User to Logout
    As an Announcement User
    In order to maintain control over my account
    I want to be able to log out of my account

    Background:
        Given I am a new, authenticated user

    Scenario: Logs out successfully
        Then I should see "Austin"
        When I press "Log out"
        Then I should not see "Austin"
        Then I should see "Log in"