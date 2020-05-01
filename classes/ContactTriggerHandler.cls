/***************************************************
* @author    	Neetesh Jain
* @date      	01 May 2020
* @description  Handler class for ContactTrigger.
***************************************************/
public class ContactTriggerHandler {

     /**
    * Method name   : countAccountContacts
    * @description  : Method used to count related contacts for an account.
    * @return       : void
    * @param        : List<Contact>
    **/
    public static void countAccountContacts(List<Contact> lstContacts) {
        Set<Id> setAccountIds = new Set<Id>();
        List<Account> lstRelatedAccount = new List<Account>();
        List<Account> lstAccountToUpdate = new List<Account>();
        
        for(Contact objCon : lstContacts) {
            if(objCon.AccountId != null) {
                setAccountIds.add(objCon.AccountId);
            }
        }
        
        if(!setAccountIds.isEmpty()) {
            lstRelatedAccount = [SELECT Id, Number_of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN:setAccountIds];
        }
        
        if(!lstRelatedAccount.isEmpty()) {
            for(Account objAcc : lstRelatedAccount) {
                objAcc.Number_of_Contacts__c = objAcc.Contacts.size();
                lstAccountToUpdate.add(objAcc);
            }
        }
        
        if(!lstAccountToUpdate.isEmpty()) {
            try {
                update lstAccountToUpdate;
            } catch(System.Exception exp) {
                System.debug('System Exception --'+exp);
            }
        } 
    }
    
}