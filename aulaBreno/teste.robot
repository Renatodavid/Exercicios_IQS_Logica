*** Settings ***

*** Variables ***
${NOME}            Renato
${IDADE}           36
${PESO}            190
${Altura}          4.20
${ESTADO_CIVIL}    SOLTEIRO

*** Test Cases ***
teste
      
    Log To Console    \nNome: ${NOME} \nIdade: ${IDADE} \nPeso: ${PESO} \nAltura: ${Altura} \nEstado_civil ${ESTADO_CIVIL}