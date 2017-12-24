Feature: Shows Jamatkhana for the Correct User
    As an Announcement User
    In order to modify the announcements for my own khane
    I want to be able to log into the correct jamatkhana

    Background:
        Given I am a new user with email "abcd@gmail.com" and jamatkhana "Austin"
        Given I am a new user with email "efgh@gmail.com" and jamatkhana "Alameda"

    Scenario: Shows correct jamatkhana upon login
        When I log in with the email "abcd@gmail.com"
        Then I should see "Austin"

    Scenario: Shows correct jamatkhana upon login, user 2
        When I log in with the email "efgh@gmail.com"
        Then I should see "Alameda"