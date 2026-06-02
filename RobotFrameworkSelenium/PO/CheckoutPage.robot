*** Settings ***
Documentation    All the page objects an keywords of the Landing Page
Library    SeleniumLibrary
Resource    Generic.robot
Library    Collections

*** Variables ***
${Shop_page_load}         css:.nav-link
${Error_Message_Login}    css:.alert-danger

*** Keywords ***

Verify items in the Checkout page and proceed
    click element   css:.btn-success
