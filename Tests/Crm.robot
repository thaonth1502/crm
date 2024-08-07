*** Settings ***
Documentation       This is some basic info about the whole suite
Library             SeleniumLibrary

#Run the script:
#robot -d results tests/crm.robot

*** Variables ***


*** Test Cases ***
Should be able to add new customer
    [Documentation]         This is some basic infor about the TEST
    [Tags]                  1006    Smoke   Contacts
    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    # Open the browser
    log                     Starting the test case!
    open browser            https://automationplayground.com/crm/       chrome

    # resize browser window for recording
    # set window position    x=341  y=169
    # set window size         width=1935   height=1090
    maximize browser window

    page should contain      Customers Are Priority One!

    click link              xpath=//a[@id='SignIn']

    page should contain     Login
    input text              id=email-id     email@robotframeworktutorial.com
    input text              id=password     qwe
    click button            id=submit-id
    page should contain     Our Happy Customers

    click link              id=new-customer
    page should contain     Add Customer

    input text              id=EmailAddress         Dao@gmail.com
    input text              id=FirstName            Dao
    input text              id=LastName             Dinh
    input text              id=City                 Atlanta
    select from list by value    id=StateOrRegion       GA
    select radio button         gender    female
    select checkbox             name=promos-name
    click button                Submit
    wait until page contains    Success! New customer added.



    sleep                   3s
    close browser

*** Keywords ***
