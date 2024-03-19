Feature: Make UI search on Bing browser
 
   Scenario: Open browser instance and login with new account created
     * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"]}
     
    Given driver 'http://www.bing.com'
    And driver.maximize()
    And delay(1000)
    And input("#sb_form_q",'https://demoqa.com/login')
    And delay(1000)
    * input("#sb_form_q",Key.ENTER)
    
    When click("//*[@id='b_results']/li[1]/h2/a")
    And delay(5000)

    #get DOM title - not UI page title 
    Then match driver.title == 'DEMOQA' 
    And match driver.url == 'https://demoqa.com/login' 
    And input("#userName", 'Karate UI')
    And input("#password", 'KarateUI')
    And delay(5000)
    And click("#login")
 
    #wait until some text appears
    * waitForText("#name", 'Invalid username or password!')






  #Scenario: Make a search for specific value on Bing
    #* configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"]}
    #Given driver 'http://www.bing.com'
    #And driver.maximize()
    #And delay(5000)
    #Then input("#sb_form_q",'mobile')
    #And delay(8000)
    #* input("#sb_form_q",Key.ENTER)
    #And delay(8000)
    

    #Scenario: Access Amazon website
    #* configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"]}
    #Given driver 'https://www.amazon.com'
    #And driver.maximize()
    #And delay(8000)
