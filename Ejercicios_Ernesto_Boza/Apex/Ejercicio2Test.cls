@isTest 
private class Ejercicio2Test {
    
    @isTest 
    static void TestCaseNumber() {

        Case objectCaseNumber = new Case (Subject = 'test CaseNumber', Status = 'New',Origin = 'Phone');


        insert objectCaseNumber;

        Test.startTest();
        objectCaseNumber.Status = 'Working';
        update objectCaseNumber;
        Test.stopTest();
        
        System.assert(objectCaseNumber.CaseNumber == objectCaseNumber.ParentId);

    }

    @isTest 
    static void TestCaseDescription(){
        Case objectCaseDescription = new Case (Subject = 'test CaseDescription', Status = 'New', Origin = 'Phone', Description = 'test description');

        insert objectCaseDescription;

        Test.startTest();
        objectCaseDescription.Status = 'Working';
        update objectCaseDescription;
        Test.stopTest();

        System.assertEquals(objectCaseDescription.Description = null, null);
        System.assertEquals(objectCaseDescription.Description = objectCaseDescription.Description,objectCaseDescription.Description);

    }
}
