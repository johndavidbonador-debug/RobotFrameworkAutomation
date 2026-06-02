*** Settings ***
Documentation    All the page objects an keywords of the Landing Page
Library    SeleniumLibrary
Resource    Generic.robot

*** Variables ***
${Shop_page_load}         css:.nav-link
${Error_Message_Login}    css:.alert-danger

*** Keywords ***
Fill the login Form
    [Arguments]    ${username}    ${password}    #This means it requires two values to be present at the start of the test which should be put after the test case name in line 21
    Input Text        id:username    ${username}    #This means that the required value for this one is the username from the argument.
    Input Password    id:password    ${password}    #This means that the required value for this one is the password from the argument.
    Click Button      id:signInBtn    #This is a command for clicking the button indicated in the assigned id from the web.

wait until all elements is located in the page
    Wait Until element passed is located on Page   ${Error_Message_Login}    #This means that the element argument is required in this line, the value of this is in line 22 which will also call the value from resource.

verify error message is correct
   #${result}=  Get Text    ${Error_Message_Login}
   #Should Be Equal As Strings    ${result}    Incorrect username/password.
   Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.    #This is another way to code line 30 and 31.

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