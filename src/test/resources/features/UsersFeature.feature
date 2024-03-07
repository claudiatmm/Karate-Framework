Feature: Make different GET requests for users
  
  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  Scenario Outline: Make GET request for a specific user
    Given path '<urlSpecific>'
    And def responseFormat = read("<responseFormat>")
    When method <requestType>
    Then status <responseCode>
    * print response
    * print responseStatus
    * print responseTime
    * print responseHeaders
    * match response.data != null
    * match response.support != null

    Examples:
      | urlSpecific    | requestType | responseCode | responseFormat                                               |
      | /users/2       | GET         | 200          | ../inputData/UsersFeature/Response/ResponseUsersSuccess.json |
      | /users?page=2  | GET         | 200          | ../inputData/UsersFeature/Response/ResponseUsersSuccess.json |
      | /users?page=3  | GET         | 200          | ../inputData/UsersFeature/Response/ResponseUsersSuccess.json |
      | /users?delay=3 | GET         | 200          | ../inputData/UsersFeature/Response/ResponseUsersSuccess.json |


  Scenario Outline: Make invalid GET request for a specific user
    Given path '<urlSpecific>'
    When method <requestType>
    Then status <responseCode>
    * print response
    * print responseStatus
    * print responseTime
    * print responseHeaders
    * match response == {}

    Examples:
      | urlSpecific | requestType | responseCode |
      | /users/23   | GET         | 404          |