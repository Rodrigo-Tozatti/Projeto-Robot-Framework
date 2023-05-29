*** Settings ***
Resource         ../Resources/main.robot
Test Setup       Dado que eu acesse o sistema organo
Test Teardown    Fechar o navegador

*** Test Cases ***
Preencher as informações do formulário da página de cadastro do Organos e criar o Card corretamente
    
    Dado que eu preencha as informações do formulário
    E clieque em Criar Card
    Então deve ser criado o Card com as informações preenchidas


Criar mais de um card em cada time preenchendo os campos corretamente
    Dado que eu preencha as informações do formulário
    E clieque em Criar Card
    Então deve criar 03 cards no time esperado

Criar cards para todos os times disponíves no formulário
    Dado que eu preencha as informações do formulário
    Então criar e identificar um card em cada time disponível



    

