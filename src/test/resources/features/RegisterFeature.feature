Feature: Make register requests with different users

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def requestFormat = read("../inputData/RegisterFeature/Request/RequestRegister.json")


  Scenario Outline: Make valid register requests for a specific user
    Given path '<urlSpecific>'
    * def responseFormat = read("../inputData/RegisterFeature/Response/ResponseRegisterSuccess.json")
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
    * match $.id != null
    * match $.token != null

    Examples:
      | urlSpecific | requestType | emailValue         | passwordValue | responseCode |
      | /register   | POST        | eve.holt@reqres.in | pistol        | 200          |


  Scenario Outline: Make invalid register requests for a specific user
    Given path '<urlSpecific>'
    * def responseFormat = read("../inputData/RegisterFeature/Response/ResponseRegisterFailure.json")
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
      | /register   | POST        | eve.holt@reqres.in |               | 400          |