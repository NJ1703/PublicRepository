/***************************************************
* @author    	Neetesh Jain
* @date      	01 May 2020
* @description  Test class for ContactTrigger.
***************************************************/
@isTest
public class ContactTriggerHandlerTest {
    
    @testSetup 
    static void setup() { 
        Account objAcc = new Account(Name = 'Account');
        insert objAcc;
        Contact objCon = new Contact(LastName = objAcc.Name + 'Contact',AccountId = objAcc.Id);
        insert objCon;
    }
    
    @isTest
    private static void testCountAccountContactsCase1() {
        Account objAcc = [SELECT Id FROM Account LIMIT 1];
        Test.startTest();
        Contact objCon = new Contact(LastName = 'New Contact', AccountId = objAcc.Id);
        insert objCon;
        Test.stopTest();
    }
    
    @isTest
    private static void testCountAccountContactsCase2() {
        Contact objCon = [SELECT Id FROM Contact LIMIT 1];
        Test.startTest();
        delete objCon;
        Test.stopTest();
    }

}