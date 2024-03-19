Feature: Update the user using DemoQa website

  Background:
    * url 'https://demoqa.com'
    * header Accept = 'application/json'


  Scenario Outline: Make POST requests for a new userName
    Given path '<urlSpecific>'
    * def randomParam = "EVE" + Math.floor(Math.random() * 1000) + 1

    * def requestFormat = read("../inputData/CRUDFeatureDemoQa/Request/RequestCreateUser.json")
    * def responseFormat = read("../inputData/CRUDFeatureDemoQa/Response/ResponseCreateUser.json")
    * request requestFormat

    * set requestFormat.userName = randomParam
    * set requestFormat.password = "<passwordUser>"

    * def requestSaveUserName = requestFormat.userName
    * def requestSavePassword = requestFormat.password
    * print 'here it is the userName and password: ' + requestSaveUserName + ' ' + requestSavePassword

    When method <requestType>
    Then status <responseCode>
    * print response
    * print responseStatus

    * print ' here is userName id : ' + response.userID
    * def responseSavedUserID = response.userID
    * print responseSavedUserID

    * match response == responseFormat
    * match $.username == requestSaveUserName
    * match $.userID == responseSavedUserID

#   generate Token
    And path '/Account/v1/GenerateToken'
    * request requestFormat
    * set requestFormat.userName = requestSaveUserName
    * set requestFormat.password = "<passwordUser>"
    And method <requestType>
    And status 200
    * print response
    * def responseUserToken = response.token
    * print 'here is the userName token ' + responseUserToken

#    authorize userName
#    And path '/Account/v1/Authorized'
#    * request requestFormat
#    * set requestFormat.userName = requestSaveUserName
#    * set requestFormat.password = "<passwordUser>"
#    And method <requestType>
#    And status 200
#    * print response
#    * match response == 'true'

    Given path '/Account/v1/User/'+ responseSavedUserID
    * print 'here is the responseSavedUserID : ' + responseSavedUserID
    When method GET
    Then status 401
    * print response


    Examples:
      | urlSpecific     | requestType | userName    | passwordUser | responseCode |
      | Account/v1/User | POST        | randomParam | test123!A    | 201          |






