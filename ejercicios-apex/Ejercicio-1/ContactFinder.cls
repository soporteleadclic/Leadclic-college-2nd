public with sharing class ContactFinder {
    public static List<Contact> findContacts(List<Opportunity> opportunityList) {
        
        Set<Id> oppIds= new Set<Id>();   
        for (Opportunity oppty: opportunityList)
        {   
            oppIds.add(oppty.Id);     
        }
        
        List<Account> accountIds = new List<Account>();
        List<Contact> contactList = new List<Contact>();
        List<Contact> allContacts = new List<Contact>();
        
        accountIds = [SELECT Id, Name FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity WHERE Id IN :oppIds) AND Account.Type = 'Other'];
       //Find contacts
        for (Account ac: accountIds)
        {
            contactList = [SELECT Id, Name, Phone, Email, CreatedDate
                           FROM Contact 
                           WHERE AccountId =: ac.Id
                           ORDER BY CreatedDate DESC
                           LIMIT 50];
            allContacts.addAll(contactList);
        }
	
        //Update emails
        for (Contact ct : allContacts) {
            if (ct.Email == ' ' || ct.Email == null) {
          		ct.Email = 'sinContacto@example.org';
            } 
      }
        
        update allContacts;
        
        //System.debug(allContacts.size() + ' contacts found.');      
        
        return allContacts;
    
    }
}