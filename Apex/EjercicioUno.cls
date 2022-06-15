
public class EjercicioUno {
       public static List<Contact>  respuesta( List<Opportunity> listaOportunidades){
           
        List<id> listaAccountIdOportunity = new List<Id>();


        for (Integer j = 0; j < listaOportunidades.size(); j++) {
            listaAccountIdOportunity.add(listaOportunidades[j].AccountId);
        }
      
        List<Account> listado = [SELECT Id,(SELECT FirstName,id FROM Contacts)FROM Account 
                                WHERE Type ='Other' 
                                AND Id IN :listaAccountIdOportunity];
        
        List<Contact> cont = new List<Contact>();

        cont = [SELECT FirstName,Email
                FROM Contact 
                WHERE AccountID 
                IN :listado 
                ORDER BY CreatedDate DESC LIMIT 50 ];

        // System.debug('listado de contactos'+listado); 
        // System.debug('listado de contactos'+cont); 

        for (Integer i = 0; i <cont.size(); i++) {
            if(cont[i].Email==null || cont[i].Email==''){
                cont[i].Email='sinContacto@example.org';
            }
        }
            update cont;
            return cont;

    }

}



























