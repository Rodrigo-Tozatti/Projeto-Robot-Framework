*** Settings ***
Library          SeleniumLibrary
Resource         setup_teardown.robot
Test Setup       Dado que eu acesse o sistema organo
Test Teardown    Fechar o navegador

*** Variables ***
${BOTAO_CARD}    id:form-botao

*** Test Cases ***
Mensagem de erro deve ficar visivel quando os campos obrigatórios não forem preeenchidos
    Dado que eu clique no botão "Criar Card" 
    Então o sistema deve apresentar mensagem de erro nos campos obrigatórios

*** Keywords ***
Dado que eu clique no botão "Criar Card"
    Click Element    ${BOTAO_CARD}

Então o sistema deve apresentar mensagem de erro nos campos obrigatórios
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro
