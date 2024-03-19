@parallel=false
Feature: Make CRUD requests for users

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'


  Scenario Outline: Make POST requests for a specific user
    Given path '<urlSpecific>'
    * def requestFormat = read("../inputData/CRUDFeature/Request/RequestCreateUsers.json")
    * def responseFormat = read("../inputData/CRUDFeature/Response/ResponseCreateUsers.json")
    * request requestFormat
    * set requestFormat.name = "<nameValue>"
    * set requestFormat.job = "<jobValue>"
    When method <requestType>
    Then status <responseCode>
    * print response
    * print responseStatus
    * print responseTime
    * print responseHeaders
    * match response == responseFormat
    * match $.name == '<nameValue>'
    * match $.job == '<jobValue>'

    Examples:
      | urlSpecific | requestType | nameValue | jobValue           | responseCode |
      | /users      | POST        | Alex      | Trainer-Automation | 201          |
      | /users      | POST        | Alex      | Trainer-Manual     | 201          |
      | /users      | POST        | Alex      | Trainer            | 201          |


  Scenario Outline: Make PUT requests for a specific user
    Given path '<urlSpecific>'
    * def requestFormat = read("../inputData/CRUDFeature/Request/RequestCreateUsers.json")
    * def responseFormat = read("../inputData/CRUDFeature/Response/ResponseUpdateUsers.json")
    * request requestFormat
    * set requestFormat.name = "<nameValue>"
    * set requestFormat.job = "<jobValue>"
    When method <requestType>
    Then status <responseCode>
    * print response
    * print responseStatus
    * print responseTime
    * print responseHeaders
    * match response == responseFormat
    * match $.name == '<nameValue>'
    * match $.job == '<jobValue>'

    Examples:
      | urlSpecific | requestType | nameValue | jobValue           | responseCode |
      | /users/2    | PUT         | Dorha     | Automation-Trainer | 200          |
      | /users/2    | PUT         | Dorha     | Manual-Trainer     | 200          |
      | /users/2    | PUT         | Dorha     | Trainer            | 200          |


  Scenario Outline: Make PATCH requests for a specific user
    Given path '<urlSpecific>'
    * def requestFormat = read("../inputData/CRUDFeature/Request/RequestCreateUsers.json")
    * def responseFormat = read("../inputData/CRUDFeature/Response/ResponseUpdateUsers.json")
    * request requestFormat
    * set requestFormat.name = "<nameValue>"
    When method <requestType>
    Then status <responseCode>
    * print response
    * print responseStatus
    * print responseTime
    * print responseHeaders
    * match response == responseFormat
    * match $.name == '<nameValue>'
    * match $.job == '<jobValue>'

    Examples:
      | urlSpecific | requestType | nameValue | jobValue | responseCode |
      | /users/2    | PATCH       | Dorha     | leader   | 200          |
      | /users/2    | PATCH       | Dorha     | leader   | 200          |
      | /users/2    | PATCH       | Dorha     | leader   | 200          |


  Scenario Outline: Make DELETE requests for a specific user
    Given path '<urlSpecific>'
    When method <requestType>
    Then status <responseCode>
    And match response == ''

    Examples:
      | urlSpecific | requestType | responseCode |
      | /users/2    | DELETE      | 204          |

