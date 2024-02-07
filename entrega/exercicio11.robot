*** Settings ***

*** Variables ***
${numero}    -5   
*** Test Cases ***
Verificar Sinal do Número

    Run Keyword If    ${numero} > 0   
    ...     Log To Console    O número é positivo
    ...    ELSE IF    ${numero} < 0    
    ...    Log To Console    O número é negativo
    ...    ELSE    Log To Console    O número é zero
