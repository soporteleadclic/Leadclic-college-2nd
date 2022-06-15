public with sharing class ExerciseOneTry {
    public static List <Contact> contactVerifyWithEmail (List <Opportunity> listOfOpportunities){
        List <ID> listaIdOpp = new List <Id>();
        for(Opportunity opp : listOfOpportunities ){
            listaIdOpp.add(opp.id);
        }
           List<ID> accIds = new List<Id>();
            for(Account acc: [Select ID, (Select ID, name from Opportunities where ID = :listOfOpportunities) from Account where type = 'Other']){
                accIds.add(acc.id);
            }
            
           List<Contact> contactFinded = new List<Contact>();
         //Tengo que lanzar una query para obtener las cuentas con contactos, luego se hace un bucle y se sacan los contactos
         List<Account> acctWithContact = [Select id,name, (Select Name,LastName from contacts ORDER BY CreatedById ASC LIMIT 50) from account where Id = :accIds];
            for(Account acct: acctWithContact){
                contactFinded.add(acct.Contacts);
            }
          
            
            //Realizo otra lista debido que tengo que ver si tienen el campo o no y de alli hacer un upset;
            List<Contact> contactVerifyEmail = new List<Contact>();
            for(Contact contact: contactFinded){
                if(contact.Email == null){
                    Contact contacto = new Contact();
                    contacto.LastName = 'Prueba';
                    contacto.Email = 'sinContacto@example.org';
                    contactVerifyEmail.add(contacto);

                }else{
                    contactVerifyEmail.add(contact);
                }
            
            }
              upsert contactVerifyEmail; 
              return contactVerifyEmail;
        }
}
