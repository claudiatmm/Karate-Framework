Feature: Update the user using DemoQa website

  Background:
    * url 'https://demoqa.com'
    * header Accept = 'application/json'



#  Scenario Outline: Make POST requests for a new userName
#    Given path '<urlSpecific>'
##    * def getRandomValue = function(){return Math.floor((100)* Math.random());}
##    * def randomParam = Math.floor(Math.random() * 1000) + 1
##    * def randomValue = randomParam + 'EvaMara'
#
#    * def requestFormat = read("../inputData/CRUDFeatureDemoQa/Request/RequestCreateUser.json")
#    * def responseFormat = read("../inputData/CRUDFeatureDemoQa/Response/ResponseCreateUser.json")
#    * request requestFormat
#    * set requestFormat.userName = "<userName>"
#    * set requestFormat.password = "<passwordUser>"
#
#    * def requestSaveUserName = requestFormat.userName
#    * def requestSavePassword = requestFormat.password
#    * print 'here it is the userName and password: ' + requestSaveUserName + ' ' + requestSavePassword
#
#    When method <requestType>
#    Then status <responseCode>
#    * print response
#    * print responseStatus
#
#    * print response.userID + ' here is userName id'
#    * def responseSavedUserID = response.userID
#    * print responseSavedUserID
#
#    * match response == responseFormat
#    * match $.username == '<userName>'
#    * match $.userID == responseSavedUserID
#
##   generate Token
#    And path '/Account/v1/GenerateToken'
#    * request requestFormat
#    * set requestFormat.userName = "<userName>"
#    * set requestFormat.password = "<passwordUser>"
#    And method <requestType>
#    And status 200
#    * print response
#    * def responseUserToken = response.token
#    * print 'here is the userName token ' + responseUserToken
#
##    authorize userName
#    And path '/Account/v1/Authorized'
#    * request requestFormat
#    * set requestFormat.userName = "<userName>"
#    * set requestFormat.password = "<passwordUser>"
#    And method <requestType>
#    And status 200
#    * print response
#    * match response == 'true'
#
#    Given path '/Account/v1/User/'+ responseSavedUserID
#    When method GET
#    Then status 401
#    * print response
#
#
#    Examples:
#      | urlSpecific     | requestType | userName      | passwordUser | responseCode |
#      | Account/v1/User | POST        | EvaMariaElena | test123!A    | 201          |


  Scenario Outline: Make POST requests for a new user
    Given path '<urlSpecific>'
    * def requestFormat = read("../inputData/CRUDFeatureDemoQa/Request/RequestCreateUser.json")
    * def responseFormat = read("../inputData/CRUDFeatureDemoQa/Response/ResponseCreateUser.json")
    * request requestFormat

    * set requestFormat.userName = "<userName>"
    * def userName = requestFormat.userName

    * set requestFormat.password = "<passwordUser>"
    * def passwordUser = requestFormat.password

    * call read {paramA: '#(userName)', paramB: '#(passwordUser)' }

#    * def requestSaveUserName = requestFormat.userName
#    * def requestSavePassword = requestFormat.password
#    * print 'here it is the userName and password: ' + requestSaveUserName + ' ' + requestSavePassword

    When method <requestType>
    Then status <responseCode>
    * print response
    * print responseStatus

#    * print response.userID + ' here is userName id'
#    * def responseSavedUserID = response.userID
#    * print responseSavedUserID
#    * match response == responseFormat
#    * match $.username == '<userName>'
#    * match $.userID == responseSavedUserID
    Examples:
      | urlSpecific     | requestType | userName   | passwordUser | responseCode |
      | Account/v1/User | POST        | CltAlina19 | test123!A    | 201          |


  Scenario: Generate token for the user
    Given path '/Account/v1/GenerateToken'
    * def requestFormat = read("../inputData/CRUDFeatureDemoQa/Request/RequestCreateUser.json")
    * request requestFormat
    * def userName = "#(paramA)"
    * def passwordUser = "#(paramB)"
    * print userName





#    * set requestFormat.userName = requestSaveUserName
#    * set requestFormat.password = requestSavePassword
#    When method POST
#    Then status 200
#    * print response
#    * def responseUserToken = response.token
#    * print 'here is the userName token ' + responseUserToken

#  Scenario: Authorize the userName
#    Given path '/Account/v1/Authorized'
#    * request requestFormat
#    * set requestFormat.userName = "<userName>"
#    * set requestFormat.password = "<passwordUser>"
#    When method <requestType>
#    Then status 200
#    * print response
#    * match response == 'true'
#
#    Given path '/Account/v1/User/'+ responseUserToken
#    When method GET
#    Then status 401
#    * print response


