*** Settings ***
Documentation       Arquivo para manter as keywords que são reutilizadas
Resource            ${ROOT}/resource/main.robot


*** Keywords ***
Definir payload padrão do endpoint
    [Arguments]    &{kwargs}
    FOR    ${key}    ${value}    IN    &{kwargs}
        IF    $key == "BODY_PATH"
            ${BODY}=    Load Json From File    ${BODY_PATH}
            Set Suite Variable    ${BODY}
        ELSE
            Set Suite Variable    ${${key}}    ${value}
        END
    END
que eu utilize outro body
    [Arguments]    ${BODY_PATH}    
     ${BODY}=    Load Json From File    ${BODY_PATH}
     Set Test Variable    ${BODY}

o response body deve conter os valores esperados para o teste ${TEST_TAG}
    ${expected_values}=    Load Json From File    ${EXECDIR}/resources/data/output/${TEST_TAG}.json
    Should Contain Subdictionaries    ${RESPONSE.json()}    ${expected_values}

o response header deve conter os valores esperados para o teste ${TEST_TAG}
    ${expected_values}=    Load Json From File    ${EXECDIR}/resources/data/output/${TEST_TAG}.json
    Should Contain Subdictionaries    ${RESPONSE.json()}    ${expected_values}

o status code deve ser ${status_code}
    Should be equal as integers    ${RESPONSE.status_code}    ${status_code}

que altero o valor do campo ${field} do ${payload_reference} para ${new_value}
    IF    $payload_reference == "BODY"
        ${new_variable}=    Update Value To Json
        ...    ${${payload_reference}}
        ...    ${field}
        ...    ${new_value}
    ELSE IF    $payload_reference == "Path Parameter"
        Set Test Variable    ${payload_reference}    ${field}
        Set Test Variable    ${new_variable}    ${new_value}
    ELSE
        ${new_variable}=    Set To Dictionary
        ...    ${${payload_reference}}
        ...    ${field}
        ...    ${new_value}
    END
    Set Test Variable    ${${payload_reference}}    ${new_variable}

Should Contain Subdictionaries
    [Arguments]    ${parent_dict}    ${subdicts_list}
    FOR    ${subdict}    IN    @{subdicts_list}
        ${json_path}=    Set Variable    ${subdict["field"]}
        ${value_to_compare}=    Set Variable    ${subdict["value"]}
        ${value_from_response}=    Get Value From Json    ${parent_dict}    ${json_path}
        Should Be Equal As Strings    ${value_from_response}[0]    ${value_to_compare}
    END
