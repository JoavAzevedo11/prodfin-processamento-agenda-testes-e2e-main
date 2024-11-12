*** Settings ***
Resource    ${ROOT}/resource/main.robot

*** Keywords ***
Get Schema Json
    [Documentation]  Keyword responsável por pegar o arquivo "schemas.json"
...  Converte para json e retorna o arquivo formatado.
    [Arguments]    ${text}
    ${file}=    Get File    ${ROOT}/resource/data/schemas/schemas.json
    ${json}=    Evaluate    json.loads($file)                     json
    ${json_schemas}  Get From Dictionary  ${json}  ${text}

    [Return]    ${json_schemas}