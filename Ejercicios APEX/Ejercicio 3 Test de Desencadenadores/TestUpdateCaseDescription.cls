// EJERCICIO 3. APEX Testing

// Realiza la clase test para el código que has generado en el ejercicio 2 de este módulo. Debe emplearse el método System.AssertsEquals y generar los registros necesarios en un metodo con la notación @testSetup tal y como indica la documentación facilitada. Se debe alcanzar >85% de cobertura.

@isTest
private class TestUpdateCaseDescription {
    
    @isTest 
    static void TestCaseNumber() {
       
        Case objCaseNumber = new Case (Subject ='test CaseNumber', Status ='New', Origin ='Phone');
        
        insert objCaseNumber;
        

        Test.startTest();
        objCaseNumber.Status ='Working';
        update objCaseNumber;   
        Test.stopTest();

        System.assert(objCaseNumber.CaseNumber == objCaseNumber.ParentId, 'This is a child case');
        System.assert(objCaseNumber.CaseNumber == null, '');

    }
    
   
    @isTest 
    static void TestCaseDescription() {
       
        Case objCaseDescription = new Case (Subject ='test CaseDescription', Status ='New', Origin ='Phone', Description ='test description');
        
        insert objCaseDescription;
        

        Test.startTest();
        objCaseDescription.Status ='Working';
        update objCaseDescription;   
        Test.stopTest();

        System.assertEquals(objCaseDescription.Description = null, null);
        System.assertEquals(objCaseDescription.Description = objCaseDescription.Description, objCaseDescription.Description);
		//TODO System.assert(objCaseDescription.Description == objCaseDescription.CaseNumber);
        //Tengo un 71% de cobertura con 5/7 cubiertos. No se me ha ocurrido cómo testear correctamente la parte que me falta 
        // if (tn.Id == tn.ParentId) {
        //  tn.Description = String.valueOf(cc.CaseNumber);

    }

   }