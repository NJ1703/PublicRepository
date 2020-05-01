/***************************************************
* @author    	Neetesh Jain
* @date      	01 May 2020
* @description  Aura Controller class for MostRecentAccountsLC Lightning Component.
***************************************************/
public with sharing class MostRecentAccountsAuraController {
    
    /**
    * Method name   : getRecentAccounts
    * @description  : Method used to get most recently created accounts.
    * @return       : List<Account>
    **/
    @AuraEnabled
    public static List<Account> getRecentAccounts() {
        return [SELECT Id, Name, Type, Phone, Website FROM Account ORDER BY CreatedDate LIMIT 10];
    }
    
}