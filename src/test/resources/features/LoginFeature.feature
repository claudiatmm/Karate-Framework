Feature: Make login requests with different users

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def requestFormat = read("../inputData/LoginFeature/Request/RequestLogin.json")

  Scenario Outline: Make valid login requests for a specific user
    Given path '<urlSpecific>'
    * def responseFormat = read("../inputData/LoginFeature/Response/ResponseLoginSuccess.json")
    * request requestFormat
    * set requestFormat.email = "<emailValue>"
    * set requestFormat.password = "<passwordValue>"
    When method <requestType>
    Then status <responseCode>
    * print response
    * print responseStatus
    * print responseTime
    * print responseHeaders
    * match response == responseFormat
    * match $.token != null

    Examples:
      | urlSpecific | requestType | emailValue         | passwordValue | responseCode |
      | /login      | POST        | eve.holt@reqres.in | pistol        | 200          |

  Scenario Outline: Make invalid login requests for a specific user
    Given path '<urlSpecific>'
    * def responseFormat = read("../inputData/LoginFeature/Response/ResponseLoginFailure.json")
    * request requestFormat
    * set requestFormat.email = "<emailValue>"
    * set requestFormat.password = "<passwordValue>"
    When method <requestType>
    Then status <responseCode>
    * print response
    * print responseStatus
    * print responseTime
    * print responseHeaders
    * match response == responseFormat
    * match $.error != null

    Examples:
      | urlSpecific | requestType | emailValue         | passwordValue | responseCode |
      | /login      | POST        | eve.holt@reqres.in |               | 400          |