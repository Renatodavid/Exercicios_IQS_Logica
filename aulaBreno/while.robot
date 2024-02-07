*** Settings ***

*** Variables ***
${numero_louças}    5

*** Test Cases ***
lava louças
    WHILE    ${numero_louças} > 0
    Log To Console    \nlavei uma louça falta algumas
    ${numero_louças}=    Evaluate    ${numero_louças} - 1
    IF  ${numero_louças} == 0
        Log To Console    acabaram as louças! partiu jogar!
    ELSE
        Log To Console    \nRestam ${numero_louças}    
        
    END
    