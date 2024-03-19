Feature: Tests for Alerts page

# ?? replace ----  delay(5000)   ----
Background: Access the website 
  * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"]}
    Given driver 'http://www.bing.com'
    And driver.maximize()
    And delay(5000)
    When input("#sb_form_q",'https://demoqa.com/alerts')
    And delay(5000)
    * input("#sb_form_q",Key.ENTER)
    And delay(5000)
    Then click("//*[@id='b_results']/li[1]/h2/a")
    And delay(5000)
    And match driver.url == 'https://demoqa.com/alerts' 


   Scenario: Click on first alert and third alert
    And click("#alertButton")
    And delay(5000)
    Then print driver.dialog
    And dialog(true)
    And delay(3000)
    And click("#confirmButton")
    And delay(5000)
    Then print driver.dialog
    And dialog(true)
    And delay(3000)
    And karate.log("====>",driver.dialog )
  
 
    Scenario: Click on fourth alert
    And click("#promtButton")
    And delay(5000)
    * print driver.dialog
    Then dialog(true, 'text test')
    And delay(3000)
    * print driver.text("#promptResult")
    Then assert driver.text("#promptResult").contains("You entered text test")
 
 
 
 
 

 #Scenario: Click on first alert and third alert
    #* configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"]}
    #Given driver 'https://the-internet.herokuapp.com/javascript_alerts'
    #And maximize()
    #And delay(5000)
    #And match driver.url == 'https://the-internet.herokuapp.com/javascript_alerts' 
#
    #And click("//*[@id='content']/div/ul/li[1]/button")
    #Then print driver.dialog
    #And match driver.dialog == "I am a JS Alert"
    #And dialog(true)
    #Then delay(5000)
    
    
    
 
    
 







