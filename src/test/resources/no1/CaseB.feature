Feature: Prepare the test data

  Scenario: Prepare a POST request for direct json format
    * def myFeature = call read('UserUpdateFeature2.feature') {userName : 'LIzz99988', password : 'Tes89gest%123!A'}
    * def authToken = myFeature.accessToken
    * print 'here is authToken : ' + authToken


