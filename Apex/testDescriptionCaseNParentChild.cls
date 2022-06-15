@isTest
private class testDescriptionCaseNParentChild {

    @isTest
    static void creaCasos() {

        test.startTest();

        Case casoPadreConHijos = new Case();
        casoPadreConHijos.Status = 'New';
        casoPadreConHijos.Origin = 'Phone';
        casoPadreConHijos.subject = 'Parent Test';
        insert casoPadreConHijos;
 
        Case hijo1 = new Case();
        hijo1.Status = 'New'; 
        hijo1.Origin = 'Phone'; 
        hijo1.ParentId = casoPadreConHijos.Id;
        hijo1.Description = 'hijo1';
        hijo1.subject = 'Child 1 Test';
        insert hijo1;

        Case hijo2 = new Case();
        hijo2.Status = 'New'; 
        hijo2.Origin = 'Phone'; 
        hijo2.ParentId = casoPadreConHijos.Id;
        hijo2.Description = 'hijo2';
        hijo2.subject = 'Child 2 Test';
        insert hijo2;
      
        List<Case> casosHijo = new List<Case>();
        List<Case> casosPadre = new List<Case>();

        // Removing null cases
        casosPadre.remove(null);
        casosHijo.remove(null);
        
        for(Case c : [SELECT Id, CaseNumber, Description FROM Case WHERE ParentId = null]) {
            casosPadre.add(c);
        }
        update casosPadre;   
        
        for(Case c : [SELECT Id, CaseNumber, Description FROM Case WHERE ParentId != null]) {
            casosHijo.add(c);
        }
        update casosHijo;
        
        for(Case caso : casosHijo){
        System.assertEquals('Caso sin hijos', caso.Description);
        }
        
	    test.stopTest();
    }

}