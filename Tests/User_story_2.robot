*** Settings ***
Library    SeleniumLibrary
Library    String
Resource   ../pages/Product.robot
Resource   ../conf/Setup_Teardown.robot
Test Setup    Open Chrome Browser
Test Teardown    Close Browser

***Variables***
${Url}   https://tutorialsninja.com/demo




***Test Cases***
 
Verifier la naviguation à la page "Search" depuis
    [Documentation]    Test de naviguation à la page "Search" depuis la page d'accueil
    [Tags]  RBF004
     
    Given L'utilisateur est sur la page d'accueil

    When il clique sur l'icône de recherche

    Then l'utilisateur est redirigé vers la page "Search"

    And l'url de le page contient le nom "/Search"

Rechercher un produit en sélectionnant la catégorie qui lui correspond.
    [Documentation]    Test de recherche d'un produit en sélectionnant la catégorie qui lui correspond
    [Tags]  RBF005
     
    Given L'utilisateur est sur la page de recherche 

    When il entre le nom du produit 

    And sélectionne sa catégorie
    
    And clique sur le bouton "Search"

    Then le produit est bien affiché sur les résultats de la recherche

Rechercher un produit en sélectionnant une catégorie incorrecte.
    [Documentation]    Test de recherche d'un produit en sélectionnant une catégorie incorrecte
    [Tags]  RBF006
     
    Given L'utilisateur est sur la page de recherche 
    
    When il entre le nom du produit
    
    And sélectionne une catégorie incorrecte

    And clique sur le bouton "Search"

    Then le produit n'est pas affiché
    
    And un texte "There is no product that matches the search criteria."


 
Vérifier l'affichage des produits recherchés avec la vue "List" et la vue "Grid"
    [Documentation]    Test de l'affichage des produits recherchés avec la vue "List" et la vue "Grid"
    [Tags]  RBF007
     
    Given L'utilisateur a fait la recherche avec un nom de produit

    When il entre le nom du produit Mac

    AND la page affiche les nombres de produits sous la vue "Grid"

    When il modifie la vue d'affichage des produits affichés pour la vue "List"

    Then les mêmes produits sont affichés


***Keywords***

L'utilisateur est sur la page d'accueil 
    [Documentation]   aller vers la page d'accueil
    SeleniumLibrary.Go To    ${Url}
    Sleep  5s

il clique sur l'icône de recherche
    [Documentation]    click sur l'icone de recherche
    SeleniumLibrary.Click Element    locator=//i[@class='fa fa-search']
    Sleep  5s

l'utilisateur est redirigé vers la page "Search"
    [Documentation]   vérifier la redirection vers la page "Search"
    #Vérifier que l'utilisateur est redirigé vers la page "Search"
    Wait Until Page Contains Element    xpath=//h1[normalize-space(text())='Search']    5s

l'url de le page contient le nom "/Search"
    [Documentation]   Vérifier que l'url contient le nom "/search"
    #Vérifier que l'url contient le nom "/search"
     ${current_url}=    Get Location
    Should Contain    ${current_url}    route=product/search    L'utilisateur n'est pas sur la page Search

L'utilisateur est sur la page de recherche 

    go to page search

L'utilisateur a fait la recherche avec un nom de produit
   
    go to page search
    
il entre le nom du produit Mac
    [Documentation]  saisir le nom du produit avec Var Mac
    Enter name product  Mac
    Click in btn Search
    Sleep  5s

la page affiche les nombres de produits sous la vue "Grid"
    [Documentation]   vérifier que la page affiche les nombres de produits sous la vue "Grid"
    Page Should Contain Element    xpath=//i[@class='fa fa-th']
    Sleep  5s

il modifie la vue d'affichage des produits affichés pour la vue "List"
    [Documentation]   modifier la vue d'affichage des produits affichés pour la vue "List"
    SeleniumLibrary.Click Element    xpath=//i[@class='fa fa-th-list']
    Sleep  5s

les mêmes produits sont affichés
    [Documentation]    Vérifie que tous les produits attendus sont toujours visibles
    @{EXPECTED_PRODUCTS}=    Create List    iMac    MacBook    MacBook Air    MacBook Pro
    FOR    ${product}    IN    @{EXPECTED_PRODUCTS}
        Page Should Contain    ${product}
    END
    


il entre le nom du produit

   Enter name product

sélectionne sa catégorie
    [Documentation]   sélectionner la catégorie du produit 
    
    Selectionne category  27

sélectionne une catégorie incorrecte
    [Documentation]   sélectionner une catégorie incorrecte
    
    Selectionne category  47

clique sur le bouton "Search"
    [Documentation]   cliquer sur le bouton Search
    Click in btn Search

le produit n'est pas affiché
    [Documentation]   vérifier que le produit n'est pas affiché dans les résultats de la
    SeleniumLibrary.Capture Page Screenshot  filename=selenium-screenshot-{no_product}.png

un texte "There is no product that matches the search criteria."
   [Documentation]   Vérifier que le produit n'est pas affiché dans les résultats de la recherche
    Check product is displayed in search results  There is no product that matches the search criteria.


le produit est bien affiché sur les résultats de la recherche
    [Documentation]   vérifier que le produit est affiché dans les résultats de la recherche
    Check product is displayed in search results   Just when you thought iMac had everything, now there´s even more.
