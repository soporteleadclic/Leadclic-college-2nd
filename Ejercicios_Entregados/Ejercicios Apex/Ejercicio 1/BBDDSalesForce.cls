//Ejercicio 1: BBDD Salesforce y Apex general

public with sharing class BBDDSalesForce {
    public static List<Contact> cuentasRelacionadas(List<Opportunity> opplist) {
        //Crear una lista de Id de cuentas con oportunidades relacionadas y rellenarla
        List<Id> idAccWithOpp = new List<Id>();
        for(Opportunity oppt: [SELECT Account.Id FROM Opportunity WHERE Id IN :opplist]) {
            idAccWithOpp.add(oppt.Account.Id);
        }
        //Crear una lista Id de las cuentas que cumplan la condicion y rellenarla
        List<Id> idAccts = new List<Id>();  
        for (Account accts: [SELECT Id, Name FROM Account  
                            WHERE (Id IN : idAccWithOpp AND Type = 'Other')]) {
            idAccts.add(accts.Id);
        }
        System.debug(idAccts.size() + ' Account(s) returned.');
        //Crear una lista de los contactos de las cuentas extraidas y rellenarla
        List<contact> contactos = new List<Contact>();
        for (Account acctsCont : [SELECT Name, (SELECT LastName, Email FROM Contacts ORDER BY 
                                  CreatedDate ASC LIMIT 50) FROM Account WHERE Id IN:IdAccts]) {
            contactos.addAll(acctsCont.Contacts);
        }
        //Crear una lista de contactos que necesitan actualizar su Email vacio
        List<Contact> listToUpdate = new List<Contact>();
        for(Contact con : contactos) {
            if (con.Email == Null) {
                con.Email = 'SinContacto@example.org';
                //Añadir los contactos a actualizar a la lista.
                listToUpdate.add(con);
            }
        }
        //Actualiza los contactos
        if(listToUpdate.size()>0) {
        update listToUpdate;
        }
        //Devolver la lista de todos los contactos extraidos
        return contactos;                        
    }

}
