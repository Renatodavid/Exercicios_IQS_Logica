*** Settings ***

Documentation    IQS - Automação FrontEnd (WEB)
...
...              Exemplo de automação com Robot Framework e Selenium.

Library    SeleniumLibrary

Test Setup       Run Keywords
...              Open Browser    url=${URL}    browser=${BROWSER}    AND
...              Maximize Browser Window

Test Teardown    Close Browser

*** Variables ***

### Dados de configuração ###

${URL}        https://www.saucedemo.com/v1/
${BROWSER}    chrome

### Massa de teste ###

${USUARIO_VALIDO}       standard_user
${USUARIO_BLOQUEADO}    locked_out_user
${SENHA}                secret_sauce

### Page Object Model (POM) ###

&{LOGIN_PAGE}
...    UsernameInput=id:user-name
...    PassowordInput=id:password
...    LoginButton=id:login-button
...    ErrorMessage=css:[data-test=error]

*** Keywords ***

### Ações ###

Realizar login com ${username} e ${password}
    Input Text       ${LOGIN_PAGE.UsernameInput}    ${username}
    Input Text       ${LOGIN_PAGE.PassowordInput}    ${password}
    Click Element    ${LOGIN_PAGE.LoginButton}

### Verificações ###

Verificar se conseguiu realizar o login corretamente
    ${url}=    Get Location
    Should Contain    ${url}    /inventory.html

Verificar se não foi possivel realizar o login
    ${mensagem_obtida}=    Get Text    locator=${LOGIN_PAGE.ErrorMessage}
    ${mensagem_esperada}=    Set Variable    Epic sadface: Sorry, this user has been locked out.
    Should Be Equal    ${mensagem_obtida}    ${mensagem_esperada}

*** Test Cases ***

TC001 - Realizar login com usuário válido
    [Tags]    FLUXO-POSITIVO    REQ001
    Realizar login com ${USUARIO_VALIDO} e ${SENHA}
    Verificar se conseguiu realizar o login corretamente

TC002 - Realizar login com usuário bloqueado
    [Tags]    FLUXO-NEGATIVO    REQ002
    Realizar login com ${USUARIO_BLOQUEADO} e ${SENHA}
    Verificar se não foi possivel realizar o login
