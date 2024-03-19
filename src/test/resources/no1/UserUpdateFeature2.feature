@ignore
Feature: Update the user using DemoQa website

  Background:
    * url 'https://demoqa.com'
    * header Accept = 'application/json'


  Scenario: Make POST requests for a new user using direct JSON
    Given path '/Account/v1/User'
    * def parameters =
    """
    {
    userName:'#(userName)',
    password:'#(password)'
    }
    """
    * print 'here it first scenario: ' + parameters.userName + 'and  ' + parameters.password
    And request parameters
    When method POST
    Then status 201
    * print 'here it is the userName and password: ' +userName + ' ' + password
    * print response
    * print responseStatus


  Scenario: Make POST token requests for user using direct JSON
    Given path '/Account/v1/GenerateToken'
    * def parameters =
    """
    {
    userName:'#(userName)',
    password:'#(password)'
    }
    """
    * print 'here is second scenario : ' +parameters.userName + 'and  ' + parameters.password
    And request parameters
    When method POST
    Then status 200
    * print response
    * def accessToken = response.token
    * print 'here is token : ' + accessToken


  Scenario: Make GET account user using direct JSON
#     ?? authToken : null
    Given path '/Account/v1/User/','#(authToken)'
    * print 'here is third scenario : ' + '/Account/v1/User/','#(authToken)'
    When method GET
    Then status 200
    * print response.userId

