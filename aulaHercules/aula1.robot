*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***


*** Test Cases ***
teste 1 
    Open Browser    url=https://www.saucedemo.com/v1/    browser=chrome
    Maximize Browser Window
    Close Browser
