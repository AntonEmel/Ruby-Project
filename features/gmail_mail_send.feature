@mail
Feature: Mail send functionality

  Scenario: User can send email
    Given user goes to Gmail
    And login to it like "ololo.gm.1"
    When user send email to "ololo.gm.2"
    Then popup with message "Письмо отправлено" should appears
    And user "ololo.gm.2" with password "A1234sdf" should got email from "ololo.gm.1"

  Scenario: User can get email
    Given to  user "ololo.gm.1" was sent email from "ololo.gm.2" with password "A1234sdf"
    When user goes to Gmail
    And login to it like "ololo.gm.1"
    Then user should got email from "ololo.gm.2"
