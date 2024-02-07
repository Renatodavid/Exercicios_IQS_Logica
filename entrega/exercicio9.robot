#Fazer um algoritmo que a partir da distância percorrida em km e o 
# total gasto de combustível, no final  exiba o consumo médio do carro. 

*** Settings ***

*** Variables ***

${distancia_percorrida_km}    300   # em quilômetros
${total_combustivel_l}    50    # em litros

*** Test Cases ***
Calcular Consumo Médio do Carro
  
    # Calculando o consumo médio do carro
    ${consumo_medio}=    Evaluate    ${distancia_percorrida_km} // ${total_combustivel_l}

    # Exibindo o consumo médio do carro
    Log To Console    \nO consumo médio do carro é de: ${consumo_medio} km/l
