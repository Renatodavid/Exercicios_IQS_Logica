*** Settings ***

*** Variables ***

${ano_nascimento}    1987
${ano_futuro}        2090

*** Test Cases ***
Calcula Idade Futura
    ${resultado}    Evaluate    ${ano_futuro} - ${ano_nascimento}
    Log To Console    \nSua idade em ${ano_futuro} será de ${resultado} anos.