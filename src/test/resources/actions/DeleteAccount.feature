Feature: Delete existing account

  Background:
    * def baseUrl = 'https://demoqa.com'
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Perform a delete in order to remove an existing account
    * print 'Scenario =>', karate.info.scenarioName

    # Set the Authorization header with the token
    * header Authorization = 'Bearer ' + token

    # Replace {UUID} with the userID variable in the path
    * def endpoint = '/Account/v1/User/'
    Given path endpoint, userID
    * print 'Request URL:', baseUrl+endpoint+userID

    When method delete
    Then status 204

    #Perform response validations
    * print 'Response Status:', responseStatus
    * print 'Response Body:', response
    * print 'Response Time:', responseTime
