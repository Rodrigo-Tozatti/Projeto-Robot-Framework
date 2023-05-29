*** Settings ***
Resource    ../main.robot

*** Keywords ***
Dado que eu acesse o sistema organo
    Open Browser    http://localhost:3000/    browser=Chrome

Fechar o navegador
    Close Browser