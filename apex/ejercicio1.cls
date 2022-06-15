public with sharing class ejercicio1 {
    public static List<Contact> contactodentrodecuenta(List<Opportunity> oppo) {       
        //Creamos rrays de idcuenta en opportunidades       
        ID[] acopid = new list<ID>();  
        for (Integer i = 0; i < oppo.size(); i++) {
            acopid.add(oppo[i].AccountID);
        }//soql
        List<Account> cuentas =[SELECT Id FROM Account  WHERE Type LIKE 'Other' AND Id IN :acopid];
        //id de ceuntas limpiamos y lo volvemos a llenar con otros ID
        acopid.clear();
        for (Integer i = 0; i < cuentas.size(); i++) {
            acopid.add(cuentas[i].Id);
        }//soql
        List<Contact> cont =[SELECT FirstName, Email
        FROM Contact WHERE AccountID IN :acopid ORDER BY CreatedDate DESC LIMIT 50 ];
        //lista de actualizacion
        List<Contact> actualizar = new List<Contact>();
        for (Contact updat : cont) {
            if(updat.email== null){
                updat.email='sincontacto@example.org';
                actualizar.add(updat);
            }
        }
        update actualizar; 
        return cont;//actualizamos y devolvemos
    }    
}
