/***************************************************
* @author    	Neetesh Jain
* @date      	01 May 2020
* @description  Test class for MostRecentAccountsAuraController.
***************************************************/
@isTest
public class MostRecentAccountsAuraControllerTest {
    
    @testSetup 
    static void setup() { 
        List<Account> lstAccs = new List<Account>();
        for(Integer i=0; i<3; i++) {
            Account objAcc = new Account(
                Name = 'Account ' + i 
            );
            lstAccs.add(objAcc);
        }
        insert lstAccs;
    }
    
    @isTest
    private static void testCountContacts() {
        Test.startTest();
        List<Account> lstAccounts = MostRecentAccountsAuraController.getRecentAccounts();
        Test.stopTest();
        System.assertEquals(3, lstAccounts.size());
    }

}