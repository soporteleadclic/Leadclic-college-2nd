public with sharing class Ejercicio1 {
    public static List<Contact> ListOfContactsFromAccounts(List<Opportunity> Opp) {

        List<Id> Oppt = new List<Id>();

 
        for(Opportunity Opport: Opp) {
            Oppt.add(Opport.accountId);
        }

        List<Account> lisOfCue = [SELECT Id,Name, (SELECT Id,FirstName,Email FROM Contacts) FROM Account WHERE (ID IN:Oppt AND Type = 'Other') ORDER BY CreatedDate DESC LIMIT 50];
        
      
    
        List<Contact> contac = new List<Contact>();
        set <String> EmailC = new set<String>();

        for(Contact Cont : contac){
            Oppt.add(cont.AccountId);
            EmailC.add(cont.Email);
            if(cont.Email == null){
                cont.Email = 'sinContacto@example.org';
            }
        }


        return contac;
    
    }
}
