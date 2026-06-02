*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections
Library    ../customLibraries/Shop.py
Test Setup    open the browser with the Mortgage payment url    #Test Setup means execute first before going to test cases.
#Test Teardown    Close Browser Session     #Test Teardown means execute after last step.
#Suite Setup    This means to run this first
#Suite Teardown      This means to run this last
Resource    ../PO/Generic.robot
Resource    ../PO/LandingPage.robot
Resource    ../PO/ShopPage.robot
Resource    ../PO/CheckoutPage.robot
Resource    ../PO/ConfirmationPage.robot





*** Variables ***
@{listsofProucts}         Blackberry    Nokia Edge
${country_name}           India



*** Test Cases ***
#Validate UnSuccessful Login
#    Fill the login Form    ${user_name}    ${invalid_password}
#    ShopPage.wait until all elements is located in the page
#    LandingPage.verify error message is correct
    
Validate Cards display in the Shopping Page
    [Tags]  Smoke
    LandingPage.Fill The login Form    ${user_name}    ${valid_password}    #The values for user_name and valid_password will be called from resource file.
    ShopPage.wait until all elements is located in the page   #The values for shop_page_load will be called from resource file.
    ShopPage.Verify Cards Title in the Shop Page    #This will call the process from keywords in line 44
    add items to cart and checkout      ${listsofProucts}
    CheckoutPage.Verify items in the Checkout page and proceed
    ConfirmationPage.Enter the Country and select the terms       ${country_name}
    ConfirmationPage.Purchase the Product and Confirm the Purchase

    #Select the card    Nokia Edge    #This will call the process from keywords in line 54 with an expected value of Nokia Edge

#Select the Form and navigate to Child window
#    LandingPage.Fill the Login Details and select User option
