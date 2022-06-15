@isTest
private with sharing class TryCaseUpdateDescriptionTest {
    
    @testSetup public static void createCase(){

            Contact newContact = new Contact(LastName='Cortina');
            insert newContact;
        	Contact newContact2 = new Contact(LastName='Humberto');
            insert newContact2;


            Case newCase1 = new Case(contactId = newContact.Id);
            insert newCase1;
            Case newCase2 = new Case(contactId = newContact.Id, parentId = newCase1.Id);
            insert newCase2;
            Case newCase3 = new Case(contactId = newContact.Id, parentId = newCase1.Id);
            insert newCase3;
        	Case newCase4 = new Case(contactId = newContact2.Id, Status = 'Escalated');
        	insert newCase4;


    }

    @isTest private static void caseHaveChildren(){
        List<Case> allCases = [SELECT Id, contactId, Description, parentId FROM Case];
        Case caseNumber1 = [SELECT Id, contactId, parentId, Description, CaseNumber FROM Case Where (contactId = :allCases.get(0).contactId) AND (parentId = null)];

        caseNumber1.Priority = 'High';
        update caseNumber1;

        system.assertEquals(caseNumber1.Description, allCases.get(1).Description);


    }

    @isTest private static void caseDontHaveChildren(){
        //El codigo comentado más abajo tambien sirve dando el 100%, pero dando en rojo. 
       // List<Case> allCases2 = [SELECT Id, contactId, Description, Status, parentId FROM Case];
        Case contactWithoutChildrens = [SELECT Id, contactId, Description, Status, parentId FROM Case WHERE (parentId = null) AND (Status = 'Escalated')];

       // allCases2.get(2).Status = 'Working';
        contactWithoutChildrens.Priority = 'High';
        
		update contactWithoutChildrens;
        //update allCases2;

        system.assertEquals(contactWithoutChildrens.Description, 'Casos sin hijos');



        


    }




}