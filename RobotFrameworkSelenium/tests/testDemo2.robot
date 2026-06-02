*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections
Test Setup    open the browser with the Mortgage payment url    #Test Setup means execute first before going to test cases.
#Test Teardown    Close Browser Session     #Test Teardown means execute after last step.
Resource    ../PO/Generic.robot



*** Variables ***
${Error_Message_Login}    css:.alert-danger
${Shop_page_load}         css:.nav-link

*** Test Cases ***
#Validate UnSuccessful Login
#    Fill the login Form    ${user_name}    ${invalid_password}
#    wait until all elements is located in the page    ${Error_Message_Login}
#    verify error message is correct
    
#Validate Cards display in the Shopping Page
#    Fill The login Form    ${user_name}    ${valid_password}    #The values for user_name and valid_password will be called from resource file.
#    wait until all elements is located in the page    ${Shop_page_load}    #The values for shop_page_load will be called from resource file.
#    Verify Cards Title in the Shop Page    #This will call the process from keywords in line 44
#    Select the card    Nokia Edge    #This will call the process from keywords in line 54 with an expected value of Nokia Edge

Select the Form and navigate to Child window
    Fill the Login Details and select User option

*** Keywords ***
Fill the login Form
    [Arguments]    ${username}    ${password}    #This means it requires two values to be present at the start of the test which should be put after the test case name in line 21
    Input Text        id:username    ${username}    #This means that the required value for this one is the username from the argument.
    Input Password    id:password    ${password}    #This means that the required value for this one is the password from the argument.
    Click Button      id:signInBtn    #This is a command for clicking the button indicated in the assigned id from the web.
    
wait until all elements is located in the page
    [Arguments]    ${element}    #This creates an argument that will require a value for element.
    Wait Until Element Is Visible    ${element}    #This means that the element argument is required in this line, the value of this is in line 22 which will also call the value from resource.
    

verify error message is correct
   #${result}=  Get Text    ${Error_Message_Login}
   #Should Be Equal As Strings    ${result}    Incorrect username/password.
   Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.    #This is another way to code line 30 and 31.


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

Fill the Login Details and select User option
    Input Text        id:username    rahulshettyacademy    #This means that the required value for this one is the username from the argument.
    Input Password    id:password    learning    #This means that the required value for this one is the password from the argument.
    Click Element     css:input[value='user']    #This clicks the radio button
    Wait Until Element Is Visible   css:.modal-body    #This will wait for the prompt to appear in web.
    Click Button         id:okayBtn    #This clicks the button on prompt from web
    Click Button         id:okayBtn    #This clicks the button on prompt from web
    Wait Until Element Is Not Visible     css:.modal-body    #This will wait for the prompt to close in web.
    Select From List By Value    css:select.form-control    teach    #This selects from the dropdown.
    Select Checkbox    terms    #This click the checkbox.
    Checkbox Should Be Selected    terms    #This checks if the checkbox is checked.