*** Settings ***
Resource    ../main.robot

*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             //*[@id="form-nome"]
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao

@{selecionar_times}
...      //option[contains(.,'Programação')]
...      //option[contains(.,'Front-End')]
...      //option[contains(.,'Data Science')]
...      //option[contains(.,'Devops')] 
...      //option[contains(.,'UX e Design')]
...      //option[contains(.,'Mobile')]
...      //option[contains(.,'Inovação e Gestão')]
${VALIDACAO}              class:colaborador

*** Keywords ***    
Dado que eu preencha as informações do formulário
    ${nome}          FakerLibrary.First Name
    ${cargo}         FakerLibrary.Job
    ${imagem}        FakerLibrary.Image Url  width=100    height=100

    Input Text       ${CAMPO_NOME}         ${nome}
    Input Text       ${CAMPO_CARGO}        ${cargo}
    Input Text       ${CAMPO_IMAGEM}       ${imagem}
    Click Element    ${CAMPO_TIME}
    Click Element    ${selecionar_times}[0]

E clieque em Criar Card
    Click Element    ${BOTAO_CARD}

Então deve ser criado o Card com as informações preenchidas
    Element Should Be Visible    ${VALIDACAO} 
    Sleep    10s

Então deve criar 03 cards no time esperado
    FOR    ${i}    IN RANGE    1    3
        Dado que eu preencha as informações do formulário
        E clieque em Criar Card
    END
    Sleep    10s

Então criar e identificar um card em cada time disponível
    FOR    ${indice}    ${time}    IN ENUMERATE    @{selecionar_times}
        Dado que eu preencha as informações do formulário
        Click Element    ${time}
        E clieque em Criar Card
    END
    Sleep    10s

Dado que eu clique no botão "Criar Card"
    Click Element    ${BOTAO_CARD}

Então o sistema deve apresentar mensagem de erro nos campos obrigatórios
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro