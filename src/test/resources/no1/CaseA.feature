Feature: Update the user using DemoQa website

  Background:
    * url 'https://demoqa.com'
    * header Accept = 'application/json'

# scenarios call base on tag
 @tag1
  Scenario: Prepare a POST request in json format
    * def randomParam = "EVE" + Math.floor(Math.random() * 1000) + 1
    * def requestFormat = read("../inputData/CRUDFeatureDemoQa/Request/RequestCreateUser.json")
    * request requestFormat
    * set requestFormat.userName = randomParam
    * set requestFormat.password = 'test123!ABC'

    * print 'here it is the userName : ' + requestFormat.userName


 @tag2
  Scenario Outline: Send a POST request
    Given path '<urlSpecific>'
   * def initialUserData = call read('CaseA.feature@tag1')

   * print 'here it is the userName and password 2: ' + initialUserData.userName + ' ' + initialUserData.password

   * def responseFormat = read("../inputData/CRUDFeatureDemoQa/Response/ResponseCreateUser.json")
    When method <requestType>
    Then status <responseCode>
    * print response

    Examples:
      | urlSpecific     | requestType |  |  | responseCode |
      | Account/v1/User | POST        |  |  | 201          |


