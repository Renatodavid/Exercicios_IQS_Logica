*** Settings ***

*** Variables ***

${horas_normais}    1760
${horas_extras}    400

*** Test Cases ***

Calcular Salário Anual
   
    ${salario_normais}=    Evaluate    ${horas_normais} * 10
    ${salario_extras}=    Evaluate    ${horas_extras} * 15
    ${salario_anual}=    Evaluate    ${salario_normais} + ${salario_extras}
    Log To Console   \nSeu salário anual é de: R$ ${salario_anual}
