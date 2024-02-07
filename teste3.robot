*** Settings ***

*** Variables ***
${Nome}    Renato

*** Test Cases ***
If Example
    IF  "${Nome}" == "renato"
        Log To Console    Bem vindo     ${Nome}
    ELSE
        Log To Console    Acesso negado!     ${Nome}
    END
    