*** Settings ***
Documentation    All the page objects an keywords of the Landing Page
Library    SeleniumLibrary
Resource    Generic.robot
Library    Collections

*** Variables ***
${Shop_page_load}         css:.nav-link
${Error_Message_Login}    css:.alert-danger
${country_location}       //a[text()='India']

*** Keywords ***

Enter the Country and select the terms
    [Arguments]     ${country_name}
    Input Text    country    ${country_name}
    Sleep               5
    Wait Until element passed is located on Page        //a[text()='${country_name}']
    click element       //a[text()='${country_name}']
    Sleep               10
    click element       //label[@for='checkbox2']

Purchase the Product and Confirm the Purchase
    click button    css:.btn-success
    Page Should Contain     Success!