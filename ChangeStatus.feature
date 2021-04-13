Feature: Status change
  Scenario: Folder received
    Given customer with its folder
    When the system receives its folder
    Then this folder sould be have status received
  
  Scenario Outline: Folder in awaiting processing
    Given customer with folder received
    When "<time>" pass
    Then status sould be in awaiting processing
  Examples:
    |time|
    | 24h|

  Scenario Outline: Folder in awaiting processing
    Given customer with folder received
    When "<time>" pass
    And it's week-end
    Then status sould be still folder received
  Examples:
    |time|
    | 24h|
  
  Scenario: Folder studied
    Given folder have status in awaiting processing
    When analyst intervenes
    Then status should be folder studied
  
  Background:
    Given folder studied
    
  Scenario: Folder complete
    When all files are valids
    Then status should be folder complete
    And the customer is notified that his file is complete
  
  Scenario: Folder incomplete
    When any file is invalid
    Then status should be folder incomplete
    And the customer is notified which document is incorrect that he must fill in a new document
  
    
  
  
    
    
    
    