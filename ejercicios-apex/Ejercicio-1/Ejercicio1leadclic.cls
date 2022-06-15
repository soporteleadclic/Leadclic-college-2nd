public with sharing class Ejercicio1leadclic {

    public static Contact[] listacontactos( List<Opportunity> opps ) {
     /*    List<Opportunity> oppscopy = opps.clone();
        
         String oppsids = ''; for(integer x =0;x<oppscopy.size();x++){   if(x>0) oppsids +=',';  oppsids += oppscopy[x].id;}

        List<String> oppsids = new List<String>();
        for (integer x =0;x<oppscopy.size();x++)
        {
           oppsids.add(oppscopy[x].id);
        }
 */

        List<Account> otherAcctsOpps = [Select Id From Account Where Id IN (SELECT AccountId FROM Opportunity WHERE Id IN :opps) AND Type='Other'];
        
        List<Contact> contactsUpdt = [SELECT Id FROM Contact where Account.Id IN :otherAcctsOpps ORDER BY CreatedDate desc LIMIT 50];

        for(Contact contc : contactsUpdt) 
        {
            if (contc.email==null) {
                contc.email = 'sinContacto@example.org';
            }
           
        }
 system.debug('oppscopy');
        system.debug('contactsUpdt');
system.debug('contactsUpdt');
         update contactsUpdt; 


return contactsUpdt;
}

}