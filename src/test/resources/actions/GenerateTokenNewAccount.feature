Feature: Create user and return necessary data

  Background:
    * def baseUrl = 'https://demoqa.com'
    * url baseUrl
    * header Accept = 'application/json'
    * def responseTokenFormat = read("../inputData/response/ResponseTokenSuccess.json")

  Scenario: Make valid login requests for a specific user
    * print 'Scenario =>', karate.info.scenarioName

    # Perform CreateAccount request to obtain the same requestBody
    * def createUser = call read('../actions/CreateNewAccountValid.feature')
    * def requestBodyData = createUser.requestBodyData

    # Prepare GenerateToken request
    * def endpoint = '/Account/v1/GenerateToken'
    Given path endpoint
    * request requestBodyData
    * print 'Request URL:', baseUrl+endpoint
    * print 'Request BODY:', requestBodyData

    # Perform GenerateToken
    When method post
    Then status 200

    #Validate response info
    * print 'Response Status:', responseStatus
    * print 'Response Body:', response
    * print 'Response Time:', responseTime
    * match response == responseTokenFormat

    #Save info for future actions
    * def token = response.token
