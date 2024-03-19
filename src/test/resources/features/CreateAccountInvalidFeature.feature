@e2e
Feature: Create new account using post request but with invalid test data

  Background:
    * def baseUrl = 'https://demoqa.com'
    * url baseUrl
    * header Accept = 'application/json'
    * def requestAccountFormat = read("../inputData/request/AccountCreate.json")
    * def responseAccountFormat = read("../inputData/response/ResponseAccountFailed.json")

  Scenario: Make the post request in order to create a new account but with invalid test data
    * print 'Scenario =>', karate.info.scenarioName

    # Prepare requestObject for CreateAccount request
    * def endpoint = '/Account/v1/User'
    Given path endpoint
    * request requestAccountFormat
    * set requestAccountFormat.password = 'TestCafe'
    * print 'Request URL:', baseUrl+endpoint
    * print 'Request BODY:', requestAccountFormat

    #Perform CreateAccount request
    When method post
    Then status 400

    #Validate response info
    * print 'Response Status:', responseStatus
    * print 'Response Body:', response
    * print 'Response Time:', responseTime
    * match response == responseAccountFormat
