*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
${OPCAO_PROGRAMACAO}      //option[contains(.,'Programação')]
${OPCAO_FRONT}            //option[contains(.,'Front-End')]
${OPCAO_DADOS}            //option[contains(.,'Data Science')]
${OPCAO_DEVOPS}           //option[contains(.,'Devops')] 
${OPCAO_UX}               //option[contains(.,'UX e Design')]
${OPCAO_MOBILE}           //option[contains(.,'Mobile')]
${OPCAO_INOVACAO}         //option[contains(.,'Inovação e Gestão')]
${VALIDACAO}              class:colaborador

*** Test Cases ***
Verificar se ao preencher as informações do formulário do página de cadastro do Organos é criado o Card corretamente
    Dado que eu acesse o sistema organo
    E preencha as informações do formulário
    E clieque em Criar Card
    Então deve ser criado o Card com as informações preenchidas

*** Keywords ***
Dado que eu acesse o sistema organo
    Open Browser    ${URL}    browser=Chrome

E preencha as informações do formulário
    Input Text       ${CAMPO_NOME}         Rodrigo
    Input Text       ${CAMPO_CARGO}        QA | Analista de testes
    Input Text       ${CAMPO_IMAGEM}       https://picsum.photos/200/300
    Click Element    ${CAMPO_TIME}
    Click Element    ${OPCAO_PROGRAMACAO}

E clieque em Criar Card
    Click Element    ${BOTAO_CARD}

Então deve ser criado o Card com as informações preenchidas
    Element Should Be Visible    ${VALIDACAO} 

