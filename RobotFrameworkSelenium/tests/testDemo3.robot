*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    String
Library    Collections
Test Setup    open the browser with the Mortgage payment url    #Test Setup means execute first before going to test cases.
Test Teardown    Close Browser     ##Test Teardown means execute after last step.
Resource    ../PO/Generic.robot


*** Variables ***
${Error_Message_Login}    css:.alert-danger

*** Test Cases ***
Validate Child window Functionality
    Select the link of Child window
    Verify the user is Switched to Child window
    Grab the Email id in the Child window
    Switch to Parent window and enter the Email

*** Keywords ***
Select the link of Child window
    Click Element    css:.blinkingText    #Clicks the element
    Sleep    5

Verify the user is Switched to Child window
    Switch Window    NEW    #This will switch the window with the news one.
    Element Text Should Be    css:h1    DOCUMENTS REQUEST    #This checks if the Text of h1 is same
    
Grab the Email id in the Child window
    ${text}=          Get Text    css:.red
    @{words}=         Split String   ${text}    at    #This splits the sentenced into 2 you need to choose from array 0 or 1
    ${text_split}=    Get From List    ${words}    1    #This selects the splitted text with array 1
    @{words_2}=        Split String    ${text_split}    
    ${email}=    Get From List    ${words_2}    0
    Set Global Variable    ${email}    #This set the variable email to be Global so that you can use it to other Test.
    
Switch to Parent window and enter the Email
    Switch Window      MAIN    #This switch back to the Main window
    Title Should Be    LoginPage Practise | Rahul Shetty Academy    #This verifies the value of the Title page
    Input Text         id:username    ${email}    #It gets the value of email from the global value