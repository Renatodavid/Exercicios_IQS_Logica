*** Settings ***

*** Variables ***
${tempo_em_segundos}    4666  

*** Test Cases ***
Converter Tempo para Formato HH:MM:SS

    ${horas}=    Evaluate    ${tempo_em_segundos} // 3600
    ${tempo_em_segundos}=    Evaluate    ${tempo_em_segundos} % 3600
    ${minutos}=    Evaluate    ${tempo_em_segundos} // 60
    ${segundos}=    Evaluate    ${tempo_em_segundos} % 60

    Log To Console   \n${horas}:${minutos}:${segundos}

