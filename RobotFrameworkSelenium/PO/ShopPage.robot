*** Settings ***
Documentation    All the page objects an keywords of the Landing Page
Library    SeleniumLibrary
Resource    Generic.robot
Library    Collections

*** Variables ***
${Shop_page_load}         css:.nav-link
${Error_Message_Login}    css:.alert-danger

*** Keywords ***
wait until all elements is located in the page
    Wait Until element passed is located on Page   ${Shop_page_load}    #This means that the element argument is required in this line, the value of this is in line 22 which will also call the value from resource.


Verify Cards Title in the Shop Page
    @{expectedList} =    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry    #This creates a list with expected values
    ${elements} =    Get Webelements    css:.card-title    #This will get all the product title in the web
    @{actualList} =    Create List    #This will create storage for list actualList
    FOR    ${element}    IN    @{elements}    #This will get all the values from elements
        Log    ${element.text}    #This is used to log the values that element.text is retrieving.
        Append To List    ${actualList}    ${element.text}    #This means that whatever are retrieved in element.text will be stored in actualList.
    END
    Lists Should Be Equal    ${expectedList}    ${actualList}        #This evaluates if expectedList have the same list in element.text

Select the card
    [Arguments]    ${cardName}    #This creates an arguments which will require a value for cardName and indicated in line 24
    ${elements} =    Get Webelements    css:.card-title    #This will get all the product title in the web
    ${index}=    Set Variable    1    #This creates a variable which have a starting value of 1 and represents a value from web
    FOR    ${element}    IN    @{elements}    #This will get all the values from elements
           Exit For Loop If  '${cardName}' == '${element.text}'    #This means that For loop will only end if cardName is equal to element.text
           Log    ${element.text}    #This is to show the value of element.text
           Log    ${cardName}        #This is to show the value of cardName
           ${index}=     Evaluate  ${index} + 1    #While the exit criteria is not yet TRUE this will keep on incrementing.
    END
    Click Button     xpath:(//*[@class='card-footer'])[${index}]/button    #The value of index will be put in here.