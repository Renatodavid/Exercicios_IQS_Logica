*** Settings ***
Library    SeleniumLibrary

Test Setup    Run Keywords
...           Open Browser    url=${URL}       browser=${BROWSER}    AND
...           Maximize Browser Window


*** Variables ***
${URL}    http://sistemas.t2mlab.com:3009/
${BROWSER}    chrome
${USUARIO_VALIDO}    BLCarvalho
${SENHA}    123

&{LOGIN_PAGE}
...    UsernameInput=id:formBasicEmail
...    PasswordInput=id:formBasicPassword
...    LoginButton=css:button[role]


*** Keywords ***

Realizar login com ${username} e ${password}
    Input Text    ${LOGIN_PAGE.UsernameInput}    ${username}
    Input Text    ${LOGIN_PAGE.PasswordInput}    ${password}
    Click Element    ${LOGIN_PAGE.LoginButton}


*** Test Cases ***
TC001 - Colaborador conseguir entrar no Sistema de Comunidade Prática
    Realizar Login com ${USUARIO_VALIDO} e ${SENHA}
    Wait Until Element Is Visible    css:button.MuiButtonBase-root.MuiCardActionArea-root.css-1m5f78l
    Click Element    xpath://*[contains(text(), 'Sistema Comunidade Prática')]    

