*** Settings ***

### BIBLIOTECAS ###
Library         BuiltIn
Library         RequestsLibrary
Library         OperatingSystem
Library         Collections
Library         DateTime
Library         String
Library         JSONLibrary
Library         JsonValidator
Library         ArchiveLibrary
Library         FakerLibrary    locale=pt_BR
Library         ${ROOT}/resource/utils/config_helper.py
Library         ${ROOT}/resource/utils/generate_curl.py

### VARIAVEIS ###
Variables       ${ROOT}/resource/data/headers.yaml
Resource        ${ROOT}/resource/utils/helper.robot
Resource        ${ROOT}/resource/keywords/shared_keywords.robot
Resource        ${ROOT}/resource/keywords/shared_keywords.robot
Resource        ${ROOT}/resource/keywords/cancellation.robot

### REQUESTS ###


### TESTS KW ###
