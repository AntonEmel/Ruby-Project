@authorization
Feature: Gmail authorization functionality

  Scenario: User with correct creds can login to Gmail
    Given user goes to Gmail
    When they enter email "ololo.gm.1" and password "A1234sdf"
    Then Gmail home page should appears

  Scenario: Failed test
    Given user goes to Gmail
    And failed test

  Scenario Outline: User with incorrect creds can't login to Gmail
    Given user goes to Gmail
    When they enter email "<email>" and password "<pass>"
    Then error message "The email and password you entered don't match." appears
    Examples:
      |   email  |  pass  |
      |ololo.gm.2|  123   |
      |ololo.gm.1|  123   |