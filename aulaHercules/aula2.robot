*** Settings ***
Library    SeleniumLibrary
*** Variables ***
### Dados de configuração ###
${URL}        https://www.saucedemo.com/v1/
${BROWSER}    chrome
*** Keywords ***

*** Test Cases ***
teste2
    Open Browser    url=${URL}    browser=${BROWSER}
    Maximize Browser Window
  Input Text        id:user-name    standard_user
    Input Text        id:password    secret_sauce
    Click Element      id:login-button