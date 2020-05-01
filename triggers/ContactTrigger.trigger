/************************************************
*@author        Neetesh Jain
*@date          01 May 2020
*@description   Trigger on Contact events.
************************************************/
trigger ContactTrigger on Contact (After insert, After delete, After undelete) {
    if(Trigger.IsAfter) {
        if(Trigger.IsInsert || Trigger.IsUndelete) {
            ContactTriggerHandler.countAccountContacts(Trigger.new);
        } else if(Trigger.IsDelete) {
            ContactTriggerHandler.countAccountContacts(Trigger.old);
        }
    }
}