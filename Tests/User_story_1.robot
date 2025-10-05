*** Settings ***
Library    SeleniumLibrary
Library    String
Resource   ../pages/Register.robot
Resource   ../pages/Login.robot
Resource   ../conf/Setup_Teardown.robot
Test Setup    Open Chrome Browser
Test Teardown    Close Browser

***Variables***




***Test Cases***
Inscription d'un nouvel utilisateur
    [Documentation]    Test d'inscription d'un nouvel utilisateur
    [Tags]  RBF001
    Given L'utilisateur est sur la page d'inscription

    When il remplit tous les champs du formulaire

    And il clique sur le bouton "continuer"

    Then le compte de l'utilisateur est créé avec succès

Se connecter avec des identifiants valide
    [Documentation]    Test de connexion avec des identifiants valides
    [Tags]  RBF002
    Given L'utilisateur est sur la page de login

    When il entre un email et un password valide

    And clique sur le bouton "Login"

    Then l'utilisateur est bien connecté 

Se connecter avec des identifiants invalide
    [Documentation]    Test de connexion avec des identifiants invalides
    [Tags]  RBF003
    Given L'utilisateur est sur la page de login

    When il entre un email et un password invalide

    And clique sur le bouton "Login"

    Then un message d'erreur "Warning: No match" s'affiche

    And l'utilisateur n'est pas connecté


***Keywords***


L'utilisateur est sur la page d'inscription
    [Documentation]   aller vers la page d'inscription
    SeleniumLibrary.Click Element    xpath=//span[text()='My Account']
    Sleep  5s
    SeleniumLibrary.Click Element    xpath=//a[text()='Register']
    SeleniumLibrary.Wait Until Page Contains Element  locator=//*[@id="content"]/h1  timeout=5s  error=None

L'utilisateur est sur la page de login
    [Documentation]   aller vers la page de login
    Acceder Page Login 

il entre un email et un password valide
    [Documentation]   saisir email et password valide
    Login Account  12E2dazdz@fgmail.com  Password123

il entre un email et un password invalide
    [Documentation]   saisir email et password invalide
    Login Account   12E2dz@fgmail.com  Passwordzda1234

clique sur le bouton "Login"

    Click Button login

un message d'erreur "Warning: No match" s'affiche
    [Documentation]   vérifier l'affichage du message d'erreur
    Page Should Contain    Warning: No match for E-Mail Address and/or Password.

l'utilisateur n'est pas connecté
    [Documentation]   vérifier que l'utilisateur n'est pas connecté
    ${Url_login_echec}=    Get Location
    Should Not Contain    ${Url_login_echec}    contains=account/login    L'utilisateur est connecté


l'utilisateur est bien connecté 
    [Documentation]   vérifier que l'utilisateur est connecté
    ${Url_login_succes}=    Get Location
    Should Contain    ${Url_login_succes}    account    L'utilisateur n'est pas connecté

il remplit tous les champs du formulaire
   
    Saisir formulaire d'inscription    John    Doe    1234567890    Password123    Password123

il clique sur le bouton "continuer"
    [Documentation]   cliquer sur le bouton continuer
    SeleniumLibrary.Click Button    xpath=//input[@value='Continue']
    Sleep  5s


le compte de l'utilisateur est créé avec succès
    [Documentation]   vérifier que le compte est créé avec succès  
    ${Url_register_succes}=    Get Location
    Should Contain    ${Url_register_succes}    success    Le compte n'a pas été créé avec succès

