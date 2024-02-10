*** Settings ***
Library    SeleniumLibrary

Test Setup    Run Keywords
...           Open Browser    url=${URL}       browser=${BROWSER}    AND
...           Maximize Browser Window


*** Variables ***
${URL}    https://moodle.ifrs.edu.br/login/index.php
${BROWSER}    chrome
${USUARIO_VALIDO}    renatodavid811
${SENHA}    sff1jsff1j@R

&{LOGIN_PAGE}
...    UsernameInput=id:username
...    PasswordInput=id:password
...    LoginButton=id:loginbtn


*** Keywords ***

Realizar login com ${username} e ${password}
    Input Text    ${LOGIN_PAGE.UsernameInput}    ${username}
    Input Text    ${LOGIN_PAGE.PasswordInput}    ${password}
    Click Element    ${LOGIN_PAGE.loginbtn}


*** Test Cases ***
TC001 - Colaborador conseguir entrar no Sistema de Comunidade Prática
    Realizar Login com ${USUARIO_VALIDO} e ${SENHA}
   # Wait Until Element Is Visible    css:button.MuiButtonBase-root.MuiCardActionArea-root.css-1m5f78l
    #Click Element    xpath://*[contains(text(), 'Sistema Comunidade Prática')]    

