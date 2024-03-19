Feature: Create new account using post request

  Background:
    * def baseUrl = 'https://demoqa.com'
    * url baseUrl
    * header Accept = 'application/json'
    * def responseAccountFormat = read("../inputData/response/ResponseAccountSuccess.json")

  Scenario: Make the post request in order to create a new account
    * print 'Scenario =>', karate.info.scenarioName

    # Prepare requestObject for CreateAccount request
    * def endpoint = '/Account/v1/User'
    Given path endpoint
    * def RequestObject = Java.type('objectData.RequestObject')
    * def requestObject = RequestObject.prepareRequestObject('ACCOUNT_CREATE_FORMAT')
    * def requestData = karate.toJson(requestObject)
    * request requestData
    * print 'Request URL:', baseUrl+endpoint
    * print 'Request BODY:', requestData

    #Perform CreateAccount request
    When method post
    Then status 201

    #Validate response info
    * print 'Response Status:', responseStatus
    * print 'Response Body:', response
    * print 'Response Time:', responseTime
    * match response == responseAccountFormat
    * match $.username == requestObject.getUserName()

    #Save info for future actions
    * def userID = response.userID
    * def requestBodyData = requestData
    * def requestObject = requestObject
