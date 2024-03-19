@e2e
Feature: Create a new account, authorise and and check the presence of it into the system

  Background:
    * def baseUrl = 'https://demoqa.com'
    * url baseUrl
    * header Accept = 'application/json'
    * def responseUserFormat = read("../inputData/response/ResponseUserSuccess.json")

  Scenario: Create new account and validate the presence of it
    * print 'Scenario =>', karate.info.scenarioName

    # Extract data from GenerateToken feature
    * def generateToken = call read('../actions/GenerateTokenNewAccount.feature')
    * def userID = generateToken.createUser.userID
    * def token = generateToken.token

    # Set the Authorization header with the token
    * header Authorization = 'Bearer ' + token

    # Replace {UUID} with the userID variable in the path
    * def endpoint = '/Account/v1/User/'
    Given path endpoint, userID
    * print 'Request URL:', baseUrl+endpoint+userID

    When method get
    Then status 200

    #Perform response validations
    * print 'Response Status:', responseStatus
    * print 'Response Body:', response
    * print 'Response Time:', responseTime
    * print response
    * match response == responseUserFormat
    * match $.userId == userID
    * match $.username == generateToken.createUser.requestObject.getUserName()

    #Save data into a file
    * def userName = generateToken.createUser.requestObject.getUserName()
    * def password = generateToken.createUser.requestObject.getPassword()
    * def data = { username: '#(userName)', password: '#(password)', userID: '#(userID)', token: '#(token)' }
    * def path = 'createAccountFeature.json'
    * eval karate.write(data, path)


  Scenario: UI TEST Open browser instance and login with new account created
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"]}
    Given driver 'http://www.bing.com'
    And driver.maximize()
    And delay(1000)
    And input("#sb_form_q",baseUrl+'/login')
    And delay(1000)
    * input("#sb_form_q",Key.ENTER)

    When click("//*[@id='b_results']/li[1]/h2/a")
    And delay(5000)

    Then match driver.title == 'DEMOQA'
    And match driver.url == 'https://demoqa.com/login'


    * def projectDir = karate.properties['user.dir']
    * def filePath = projectDir + '/target/createAccountFeature.json'
    * def jsonContent = read('file:' + filePath)

    * def result = { username: #(jsonContent.username), password: #(jsonContent.password) }
    * print 'Here is userName from the initial scenario : ' + result.username
    * def user = result.username
    * def pass = result.password

    And input("#userName", user)
    And input("#password", pass)

    And delay(5000)
    And click("#login")
  # login validation
#    Then assert driver.text("#userName-value").contains(user)
#    And def userNameMessage = text("#userName-value")
#    * print 'Here is userName UI value : ' +userNameMessage
#    Then match userNameMessage == user

#   logout
#    And click("#submit")
#    And delay(5000)
#    Then assert driver.text("//*[@id='userForm']/div[1]/h5").contains("Login in Book Store")



  Scenario: Delete created user with books
    * def projectDir = karate.properties['user.dir']
    * def filePath = projectDir + '/target/createAccountFeature.json'
    * def jsonContent = read('file:' + filePath)

    * def result = call read('../actions/DeleteAccount.feature') { userID: #(jsonContent.userID), token: #(jsonContent.token) }



  Scenario: UI TEST Open browser instance and login with deleted account
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"]}
    Given driver 'http://www.bing.com'
    And driver.maximize()
    And delay(1000)
    And input("#sb_form_q",baseUrl+'/login')
    And delay(1000)
    * input("#sb_form_q",Key.ENTER)

    When click("//*[@id='b_results']/li[1]/h2/a")

    * def projectDir = karate.properties['user.dir']
    * def filePath = projectDir + '/target/createAccountFeature.json'
    * def jsonContent = read('file:' + filePath)

    * def result = { username: #(jsonContent.username), password: #(jsonContent.password) }
    * print 'Here is userName which has been deleted : ' + result.username
    * def user = result.username
    * def pass = result.password

    And input("#userName", user)
    And input("#password", pass)

    And delay(5000)
    And click("#login")
    And delay(5000)
    Then assert driver.text("#name").contains("Invalid username or password!")
