*** Settings ***
Library    Dialogs

*** Variables ***
 
${numero}    ${10}
 




*** Test Cases ***
Teste de Sucessor e Antecessor
   
   
    ${sucessor}=    Evaluate    ${numero} + 1
    ${antecessor}=    Evaluate    ${numero} - 1

    Log To Console       O sucessor de ${numero} é ${sucessor}
    Log To Console       O antecessor de ${numero} é ${antecessor}