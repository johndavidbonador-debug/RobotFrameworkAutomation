*** Settings ***
Documentation    A resource file with the reusable keywords and variables can be used all over the project.
#run in command this "robot ." to run all test cases in the folder in sequence
#to run test cases in a single robot file and folder parallel using "Pabot" download this in interpreter. use "pabot ." in terminal.
#"pabot --testlevelslit testdemo6.robot" use this to trigger test parralelly in a file.
#To run specific test case, use the command "robot -t "NAME_OF_TESTCASE" testDemo2" or ""robot -t "NAME_OF_TESTCASE""
#To run test case with specific word in the entire folder "robot -t "Validate*" ."
#If you want to run test cases with TAGS use "robot --include TAG_NAME" or "robot --include TAG_NAME .".  to put tag include [Tags]     NAME_OF_TAG  under test case name
#If you want to run multiple tags use "robot --include TAG_NAME"OR"TAG_NAME2" or "robot --exclude TAG_NAME"OR"TAG_NAME2"
#If you want to run all the failed tests use "robot --rerunfailed output.xml
#To set variable using terminal "robot --variable browser_name:Chrome"
...    The system specific keywords created here form our own
...    domain specific language. They utilize keywords provided by the imported SeleniumLibrary
...    //*[@class="card-footer']) for searching wild card in css
Library    SeleniumLibrary

*** Variables ***
${user_name}            rahulshettyacademy    #This set the value for user_name
${invalid_password}     12345678              #This set the value for invalid_password
${valid_password}       Learning@830$3mK2     #This set the value for valid_password
${url}                  https://rahulshettyacademy.com/loginpagePractise/    #This set the value for url

*** Keywords ***
open the browser with the Mortgage payment url
    Open Browser    browser=Edge    options=add_experimental_option("detach", True)
    Maximize Browser Window
    #Create Webdriver    Chrome    #This set the webdriver to which you want your test to use web.
    Go To    ${url}               #This calls the global variable url

Close Browser Session
    Close Browser                #Close the browser
    
    
Wait Until element passed is located on Page
    [Arguments]     ${page_locator}
    Wait Until ELement is Visible   ${page_locator}


    #run in command this "robot ." to run all test cases in the folder in sequence
    #to run test cases in a single robot file and folder parallel using "Pabot" download this in interpreter. use "pabot ." in terminal.
    #"pabot --testlevelslit testdemo6.robot" use this to trigger test parralelly in a file.

