*** Settings ***
Documentation    This is to parameterize the test cases
Library    SeleniumLibrary
Test Teardown    Close Browser     ##Test Teardown means execute after last step.
Test Template   Validate UnSuccessful Login     #instead of putting this into the test cases section we put it here in the Test Template

*** Variables ***
${Error_Message_Login}    css:.alert-danger

*** Test Cases ***  username        password        #Example of how to parameterize the test cases
Invalid username    testfail        learning        #first test case
Invalid password    rahulshetty     testfail1       #second test case
Special characters  @#$             learning        #third test case

*** Keywords ***
Validate UnSuccessful Login
    [Arguments]     ${username}     ${password}
    open the browser with the Mortgage payment url
    Fill the login Form     ${username}     ${password}
    wait until it checks and display error message
    verify error message is correct

open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    [Arguments]    ${username}    ${password}    #This means it requires two values to be present at the start of the test which should be put after the test case name in line 21
    Input Text        id:username    ${username}    #This means that the required value for this one is the username from the argument.
    Input Password    id:password    ${password}    #This means that the required value for this one is the password from the argument.
    Click Button      id:signInBtn    #This is a command for clicking the button indicated in the assigned id from the web.

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}

verify error message is correct
   ##${result}=  Get Text    ${Error_Message_Login}
   ##Should Be Equal As Strings    ${result}    Incorrect username/password.
   Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.    #This is another way to code line 30 and 31.
