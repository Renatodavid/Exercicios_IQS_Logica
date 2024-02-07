### Page Object Model (POM) ###
&{LOGIN_PAGE}
...    UsernameInput=id:user-name
...    PassowordInput=xpath://input[@name='password']
...    LoginButton=css:[class=btn_action]
*** Settings ***
Library    SeleniumLibrary
*** Variables ***
### Dados de configuração ###
${URL}        https://www.saucedemo.com/v1/
${BROWSER}    chrome
### Page Object Model (POM) ###
&{LOGIN_PAGE}
...    UsernameInput=id:user-name
...    PassowordInput=xpath://input[@name='password']
...    LoginButton=css:[class=btn_action]
*** Keywords ***
Realizar login
    Input Text       ${LOGIN_PAGE.UsernameInput}    standard_user
    Input Text       ${LOGIN_PAGE.PassowordInput}    secret_sauce
    Click Element    ${LOGIN_PAGE.LoginButton}

*** Test Cases ***
teste3
    Open Browser    url=${URL}    browser=${BROWSER}
    Maximize Browser Window
    Realizar login
    Close Browser