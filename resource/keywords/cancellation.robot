*** Settings ***
Documentation       Conjunto de Keywords
Resource            ${ROOT}/resource/main.robot


*** Keywords ***
que realizo a requisição do tipo POST para /cancellation
    [Documentation]    Keyword responsável por realizar a requisição do tipo POST para o endpoint /cancellation
    ${RESPONSE}    POST
    ...    https://hcancelamento-transacao.produto-financeiro.grupoboticario.digital/cancellation
    ...    json=${BODY}
    ...    expected_status=any
    Set Test Variable    ${RESPONSE}    ${RESPONSE}
