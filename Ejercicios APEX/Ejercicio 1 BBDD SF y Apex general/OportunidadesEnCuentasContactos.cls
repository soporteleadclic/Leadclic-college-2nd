/*
Crea una clase con un método publico y estático que reciba como parámetro una lista de Oportunidades.
El método debe de devolver un listado de contactos de las cuentas relacionadas de tipo "Other" relacionado con las oportunidades que entren en el metodo. De cada cuenta que cumpla el criterio, se deben recoger hasta un máximo de 50 contactos. El criterio de seleccion de estos contactos debe de ser por fecha de creación, recogiendo los más recientes.
De estos contactos, los que no tengan el campo EMail relleno, deberán actualizarse para que tenga el valor sincontacto@example.org
El método debe de seguir las buenas prácticas descritas en el modulo de "fUNDAMENTOS Y BASE DE DATOS DE APEX"

[OPORTUNIDAD]--->[CUENTA]<---[CONTACTO]
*/



public with sharing class OportunidadesEnCuentasContactos {
public void OportunidadesEnCuentasContactos() {

Account[] searchContactsInAccounts = [SELECT Id, Email, FROM Account WHERE Id IN (SELECT AccountId FROM Contact) AND Type='Other' LIMIT 50];

    System.debug(searchContactsInAccounts);
    
List<Contact> updateEmail = new List<Contact>();
for (Contact c : updateEmail) {
    if (c.Email =='') {
        c.Email ='sincontacto@example.org';
        updateEmail.add(c);
    }
    
}
update updateEmail;
}
}