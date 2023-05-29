*** Settings ***
Resource         ../Resources/main.robot
Test Setup       Dado que eu acesse o sistema organo
Test Teardown    Fechar o navegador

*** Variables ***
${BOTAO_CARD}    id:form-botao

*** Test Cases ***
Mensagem de erro deve ficar visivel quando os campos obrigatórios não forem preeenchidos
    Dado que eu clique no botão "Criar Card" 
    Então o sistema deve apresentar mensagem de erro nos campos obrigatórios

