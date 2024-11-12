Language: Brazilian Portuguese
*** Settings ***
Resource    ${ROOT}/resource/main.robot
Suite Setup     Definir payload padrão do endpoint    BODY_PATH=${BODY_PATH}

*** Variables ***
${BODY_PATH}    ${EXECDIR}/resource/data/input/cancellation_POST_CARD.json
${BODY_PATH_PIX}    ${EXECDIR}/resource/data/input/cancellation_POST_PIX.json

*** Test Cases ***
TC1: Validar Cancelamento Enviando "transactionType" Vazio
    [Tags]    cancellation_card
    Dado que altero o valor do campo transactionType do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC2: Validar Cancelamento Enviando "transactionType" Diferente Do Esperado
    [Tags]    cancellation_card
    Dado que altero o valor do campo transactionType do BODY para teste
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC3: Validar Cancelamento Enviando "transactionType" Numérico
    [Tags]    cancellation_card
    Dado que altero o valor do campo transactionType do BODY para 10
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC4: Validar Cancelamento Enviando "provider" Vazio
    [Tags]    cancellation_card
    Dado que altero o valor do campo provider do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC5: Validar Cancelamento Enviando "provider" Numérico
    [Tags]    cancellation_card
    Dado que altero o valor do campo provider do BODY para 12
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC6: Validar Cancelamento Enviando "merchantId" Vazio
    [Tags]    cancellation_card
    Dado que altero o valor do campo merchantId do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC7: Validar Cancelamento Enviando "merchantId" Alfabético
    [Tags]    cancellation_card
    Dado que altero o valor do campo merchantId do BODY para teste
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC8: Validar Cancelamento Enviando "cardNumber" Vazio
    [Tags]    cancellation_card
    Dado que altero o valor do campo cardNumber do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC9: Validar Cancelamento Enviando "authorizationCode" Vazio
    [Tags]    cancellation_card
    Dado que altero o valor do campo authorizationCode do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC10: Validar Cancelamento Enviando "transactionDate" Vazio
    [Tags]    cancellation_card
    Dado que altero o valor do campo transactionDate do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC11: Validar Cancelamento Enviando "transactionDate" Alfabético
    [Tags]    cancellation_card
    Dado que altero o valor do campo transactionDate do BODY para teste
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC12: Validar Cancelamento Enviando "transactionDate" Com Uma Data Futura
    [Tags]    cancellation_card
    Dado que altero o valor do campo transactionDate do BODY para 2024-10-19
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 200

TC13: Validar Cancelamento Enviando "transactionDate" Com Uma Data Passada
    [Tags]    cancellation_card
    Dado que altero o valor do campo transactionDate do BODY para 2023-10-19
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC14: Validar Cancelamento Enviando "transactionAmount" Vazio
    [Tags]    cancellation_card
    Dado que altero o valor do campo transactionAmount do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC15: Validar Cancelamento Enviando "transactionAmount" Alfabético
    [Tags]    cancellation_card
    Dado que altero o valor do campo transactionAmount do BODY para teste
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC16: Validar Cancelamento Enviando "availableAmount" Vazio
    [Tags]    cancellation_card
    Dado que altero o valor do campo availableAmount do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC17: Validar Cancelamento Enviando "availableAmount" Com Valor A Mais Do Que Disponível
    [Tags]    cancellation_card
    Dado que altero o valor do campo availableAmount do BODY para 100000.00
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC18: Validar Cancelamento Enviando "availableAmount" Alfabético
    [Tags]    cancellation_card
    Dado que altero o valor do campo availableAmount do BODY para teste
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC19: Validar Cancelamento Enviando "cancellationAmount" Vazio
    [Tags]    cancellation_card
    Dado que altero o valor do campo cancellationAmount do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC20: Validar Cancelamento Enviando "cancellationAmount" Com Valor A Mais Do Que Disponível
    [Tags]    cancellation_card
    Dado que altero o valor do campo cancellationAmount do BODY para 500000.00
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC21: Validar Cancelamento Enviando "cancellationAmount" Alfabético
    [Tags]    cancellation_card
    Dado que altero o valor do campo cancellationAmount do BODY para teste
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC22: Validar Cancelamento Enviando "transactionStatusId" Vazio
    [Tags]    cancellation_card
    Dado que altero o valor do campo transactionStatusId do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC23: Validar Cancelamento Enviando "transactionStatusId" Com Status Diferente De (2)
    [Tags]    cancellation_card
    Dado que altero o valor do campo transactionStatusId do BODY para 4
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC24: Validar Cancelamento Enviando "transactionStatusId" Alfabético
    [Tags]    cancellation_card
    Dado que altero o valor do campo transactionStatusId do BODY para teste
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC25: Validar Cancelamento Enviando "nsu" Vazio
    [Tags]    cancellation_card
    Dado que altero o valor do campo nsu do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC26: Validar Cancelamento Enviando "nsu" Alfabético
    [Tags]    cancellation_card
    Dado que altero o valor do campo nsu do BODY para teste
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC27: Validar Cancelamento Enviando "nsuHost" Vazio
    [Tags]    cancellation_card
    Dado que altero o valor do campo nsuHost do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC28: Validar Cancelamento Enviando "nsuHost" Alfabético
    [Tags]    cancellation_card
    Dado que altero o valor do campo nsuHost do BODY para teste
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC29: Validar Cancelamento Enviando "transactionGroup" Vazio
    [Tags]    cancellation_card
    Dado que altero o valor do campo transactionGroup do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC30: Validar Cancelamento Enviando "depositDate" Vazio
    [Tags]    cancellation_card
    Dado que altero o valor do campo depositDate do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC31: Validar Cancelamento Enviando "depositDate" Alfabético
    [Tags]    cancellation_card
    Dado que altero o valor do campo depositDate do BODY para teste
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC32: Validar Cancelamento Enviando "saleId" Vazio
    [Tags]    cancellation_card
    Dado que altero o valor do campo saleId do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC33: Validar Cancelamento Enviando "tid" Vazio
    [Tags]    cancellation_card
    Dado que altero o valor do campo tid do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

##################################### testes com body de pix ############################################

TC1: Validar Cancelamento Enviando "transactionType" Vazio
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo transactionType do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC2: Validar Cancelamento Enviando "transactionType" Diferente Do Esperado
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo transactionType do BODY para teste
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC3: Validar Cancelamento Enviando "transactionType" Numérico
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo transactionType do BODY para 10
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC4: Validar Cancelamento Enviando "provider" Vazio
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo provider do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC5: Validar Cancelamento Enviando "provider" Diferente Do Esperado
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo provider do BODY para teste
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC6: Validar Cancelamento Enviando "provider" Numérico
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo provider do BODY para 11
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC7: Validar Cancelamento Enviando "authorizationCode" Vazio
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo authorizationCode do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC8: Validar Cancelamento Enviando "authorizationCode" Diferente Do Esperado
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo authorizationCode do BODY para teste
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC9: Validar Cancelamento Enviando "transactionDate" Vazio
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo transactionDate do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC10: Validar Cancelamento Enviando "transactionDate" Alfabético
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo transactionDate do BODY para date
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC11: Validar Cancelamento Enviando "transactionDate" Com Uma Data Passada
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo transactionDate do BODY para 2023-06-19
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC12: Validar Cancelamento Enviando "transactionAmount" Vazio
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo transactionAmount do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC13: Validar Cancelamento Enviando "transactionAmount" Alfabético
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo transactionAmount do BODY para teste
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC14: Validar Cancelamento Enviando "availableAmount" Vazio
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo availableAmount do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC15: Validar Cancelamento Enviando "availableAmount" Com Valor A Mais Do Que Disponível
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo availableAmount do BODY para 100000.00
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC16: Validar Cancelamento Enviando "availableAmount" Alfabético
    [Tags]   cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo availableAmount do BODY para teste
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC17: Validar Cancelamento Enviando "cancellationAmount" Vazio
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo cancellationAmount do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC18: Validar Cancelamento Enviando "cancellationAmount" Com Valor A Mais Do Que Disponível
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo cancellationAmount do BODY para 500000.00
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC19: Validar Cancelamento Enviando "cancellationAmount" Alfabético
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo cancellationAmount do BODY para teste
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC20: Validar Cancelamento Enviando "transactionStatusId" Vazio
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo transactionStatusId do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC21: Validar Cancelamento Enviando "transactionStatusId" Com Status Diferente De (2)
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo transactionStatusId do BODY para 6
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC22: Validar Cancelamento Enviando "transactionStatusId" Alfabético
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo transactionStatusId do BODY para teste
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC23: Validar Cancelamento Enviando "saleId" Vazio
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo saleId do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC24: Validar Cancelamento Enviando "saleId" Alfabético
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo saleId do BODY para teste
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC25: Validar Cancelamento Enviando "tid" Vazio
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo tid do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC26: Validar Cancelamento Enviando "txId" Vazio
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo txId do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC27: Validar Cancelamento Enviando "e2eId" Vazio
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo e2eId do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400

TC28: Validar Cancelamento Enviando "transactionId" Vazio
    [Tags]    cancellation_pix
    [Setup]    que eu utilize outro body    ${BODY_PATH_PIX}
    Dado que altero o valor do campo transactionId do BODY para ${EMPTY}
    Quando que realizo a requisição do tipo POST para /cancellation
    Então o status code deve ser 400