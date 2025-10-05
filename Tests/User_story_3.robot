*** Settings ***
Library    SeleniumLibrary
Library    String
Resource   ../pages/product.robot
Resource   ../conf/Setup_Teardown.robot
Test Setup    Open Chrome Browser
Test Teardown    Close Browser

***Variables***




***Test Cases***
Rechercher un produit en sélectionnant une catégorie incorrecte.
    [Documentation]    Test de recherche d'un produit en sélectionnant une catégorie incorrecte
    [Tags]  RBF008
     
    Given L'utilisateur a sur la page recherche du produit

    AND le produit recherché est affiché 

    When il clique sur le bouton "Add to cart"

    Then le panier affiche "1 item(s)" + le prix du produit

 
 	
Rechercher un produit en sélectionnant une catégorie incorrecte.
    [Documentation]    Test de recherche d'un produit en sélectionnant une catégorie incorrecte
    [Tags]  RBF009
     
    Given L'utilisateur a ajouté deux produits au panier

    When il supprime un des deux produit 

    Then le produit est supprimé du panier instantanément

    And le montant totale est mis à jour



***Keywords***

L'utilisateur a sur la page recherche du produit
    [Documentation]   aller vers la page de recherche et faire une recherche
    go to page search
    Enter name product  iMac
    Selectionne category  27
    Click in btn Search
    Check product is displayed in search results   iMac
    Sleep  5s

le produit recherché est affiché 
    [Documentation]   vérifier que le produit est affiché
    Page Should Contain     iMac

il clique sur le bouton "Add to cart"
    [Documentation]   cliquer sur le bouton "Add to cart"
    SeleniumLibrary.Click Element  xpath=//button[@onclick="cart.add('41', '1');"]
    Sleep  5s
le panier affiche "1 item(s)" + le prix du produit
    [Documentation]   vérifier que le panier affiche "1 item(s)" + le prix du produit
    Page Should Contain     1 item(s) - $122.00
    Sleep  5s

L'utilisateur a ajouté deux produits au panier
    [Documentation]   ajouter deux produits au panier
    go to page search
    Enter name product  iMac
    Selectionne category  27
    Click in btn Search
    Check product is displayed in search results   iMac
    Sleep  5s
    SeleniumLibrary.Click Element  xpath=//button[@onclick="cart.add('41', '1');"]
    go to page search
    Enter name product  MacBook Pro
    Selectionne category  0
    Click in btn Search
    Check product is displayed in search results   MacBook Pro
    Sleep  5s
    SeleniumLibrary.Click Element  xpath=//button[@onclick="cart.add('45', '1');"]
    Sleep  5s   

il supprime un des deux produit
    [Documentation]   supprimer un des deux produit
    SeleniumLibrary.Click Element  xpath=//button[span[@id='cart-total']]
    Sleep  2s
    SeleniumLibrary.Click Element  locator=//button[contains(@class,'btn-danger') and i[@class='fa fa-times']]
    Sleep  6s

le produit est supprimé du panier instantanément
    [Documentation]   vérifier que le produit est supprimé du panier
    Page Should Not Contain     iMac
    Sleep  5s

le montant totale est mis à jour
    [Documentation]   vérifier que le montant totale est mis à jour
    Page Should Contain     1 item(s) - $2,000.00
    Sleep  5s
