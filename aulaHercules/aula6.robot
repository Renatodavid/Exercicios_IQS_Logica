*** Settings ***
library     SeleniumLibrary
Test Setup       Run Keywords
...              Open Browser    url=${URL}    browser=${BROWSER}    AND
...              Maximize Browser Window
Test Teardown    Close Browser
*** Variables ***
${URL}     https://www.saucedemo.com/v1/
${BROWSER}    chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce
${PASSWORDFALSO}    secret_sauc
### POM - Page Object Model
&{LOGIN_PAGE}
...    UsernameInput=id:user-name
...    PassowordInput=id:password
...    LoginButton=css:[class=btn_action]
*** Keywords *** 
# são funções basicamente

*** Test Cases ***
TC001 - Realizar login com usuário válido
    Open Browser      url=${URL}    browser=${BROWSER}
    Maximize Browser Window
    Input Text        ${LOGIN_PAGE.UsernameInput}    standard_user
    Input Text        ${LOGIN_PAGE.PasswordInput}    secret_sauce
    Click Element     ${LOGIN_PAGE.LoginButton}
    Close Browser

TC002 - Realizar login com usuário inválido
    Open Browser      url=${URL}    browser=${BROWSER}
    Maximize Browser Window
    Input Text        ${LOGIN_PAGE.UsernameInput}    standard_user
    Input Text        ${LOGIN_PAGE.PasswordInput}    secret_sauc
    Click Element     ${LOGIN_PAGE.LoginButton}
    Close Browser
