Feature: Make different GET requests for resources
  
  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'


  Scenario Outline: Make valid GET request for a specific resource
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
      | urlSpecific | requestType | responseCode | responseFormat                                                     |
      | /unknown/2  | GET         | 200          | ../inputData/ResourceFeature/Response/ResponseResourceSuccess.json |
      | /unknown    | GET         | 200          | ../inputData/ResourceFeature/Response/ResponseResourceSuccess.json |


  Scenario Outline: Make invalid GET request for a specific resource
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
      | /unknown/23 | GET         | 404          |