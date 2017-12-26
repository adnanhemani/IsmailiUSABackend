Feature: Announcement User wants to change an announcement
    As an Announcement User
    In order to correct an announcement
    I want to be able to edit an announcement

    Background:
        Given I am a new, authenticated user
        Given I have an announcement with title "Title1" and body "Body"
        Given I have an announcement with title "Title2" and body "Body2"
        Given I am on the announcement_index page

    Scenario: Announcement User successfully edits announcement without Event
        Then I should see "Title1"
        When I click edit on announcement "Title1"
        Then I should see "Title1" in an input box
        Then I should not see "Title2" in an input box
        When I fill in "Title" with "Title1-changed"
        When I fill in "Body" with "Body1-changed"
        When I press "Update Announcement"
        Then I should be on the announcement_index page
        Then I should see "Title1-changed"
        Then I should see "Body1-changed"

    Scenario: Announcement User isn't able to successfully edit announcement
        Then I should see "Title1"
        When I click edit on announcement "Title1"
        Then I should see "Title1" in an input box
        Then I should not see "Title2" in an input box
        When I fill in "Title" with ""
        When I press "Update Announcement"
        Then I should see "Form is invalid"
    
    Scenario: Announcement User tries to access an announcement which is not from their jamatkhana
        Given I am a new user with email "1234@gmail.com" and jamatkhana "New York"
        When I press "Log out"
        And I log in with the email "1234@gmail.com"
        When I follow the url "/announcement/1/edit"
        Then I should see "This page is not for your jamatkhana."
        When I press "Back to Announcements"
        Then I should be on the announcement_index page

