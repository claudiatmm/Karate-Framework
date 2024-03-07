Feature: Update the user using DemoQa website

  Background:
    * url 'https://demoqa.com'
    * header Accept = 'application/json'




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


