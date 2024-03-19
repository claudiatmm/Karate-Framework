@e2e
Feature: Create a new account, authorise and and check the presence of it into the system

  Background:
    * def baseUrl = 'https://demoqa.com'
    * url baseUrl
    * header Accept = 'application/json'
    * def requestBooksFormat = read("../inputData/request/AddAccountBooks.json")
    * def responseUserFormat = read("../inputData/response/ResponseAccountBooksSuccess.json")

  Scenario: Create new account and validate the presence of it
    * print 'Scenario =>', karate.info.scenarioName

    # Extract data from GenerateToken feature
    * def generateToken = call read('../actions/GenerateTokenNewAccount.feature')
    * def userID = generateToken.createUser.userID
    * def token = generateToken.token

    # Set the Authorization header with the token
    * header Authorization = 'Bearer ' + token

    # Replace {UUID} with the userID variable in the path
    * def endpoint = '/BookStore/v1/Books'
    Given path endpoint
    * request requestBooksFormat
    * set requestBooksFormat.userId = userID
    * print 'Request URL:', baseUrl+endpoint
    * print 'Request BODY:', requestBooksFormat

    When method post
    Then status 201

    #Perform response validations
    * print 'Response Status:', responseStatus
    * print 'Response Body:', response
    * print 'Response Time:', responseTime
    * print response
    * match response == responseUserFormat
    * match $.books[0].isbn == requestBooksFormat.collectionOfIsbns[0].isbn
    * match $.books[1].isbn == requestBooksFormat.collectionOfIsbns[1].isbn

    #Save data into a file
    * def data = { userID: '#(userID)', token: '#(token)' }
    * def path = 'addBooksAccountFeature.json'
    * eval karate.write(data, path)

  Scenario: Delete created user with books
    * def projectDir = karate.properties['user.dir']
    * def filePath = projectDir + '/target/addBooksAccountFeature.json'
    * def jsonContent = read('file:' + filePath)

    * def result = call read('../actions/DeleteAccount.feature') { userID: #(jsonContent.userID), token: #(jsonContent.token) }
