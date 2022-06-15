@isTest
public class TestDescribeChildCases {
   	@testSetup
  	static void dataCreation() {
        //create a parent case
    	Case c1 = New Case();
    	c1.Status = 'New';
    	c1.Origin = 'Phone';
        c1.Subject = 'TestDescribeChildCases ParentCase';
        insert c1;
        
        Case parentCase = new Case();
        parentCase = [SELECT Id
        FROM Case WHERE Subject =: c1.Subject
        ORDER BY CreatedDate DESC LIMIT 1];
        
        //associate children to this newly created parent case
        Case c1Child1 = New Case();
    	c1Child1.Status = 'New';
    	c1Child1.Origin = 'Phone';
        c1Child1.ParentId = parentCase.Id;
        insert c1Child1;
        
        Case c1Child2 = New Case();
    	c1Child2.Status = 'New';
    	c1Child2.Origin = 'Phone';
        c1Child2.ParentId = parentCase.Id;
        insert c1Child2;
        
        // create a case without children
        Case c2 = New Case();
    	c2.Status = 'New';
    	c2.Origin = 'Phone';
        c2.Subject = 'TestDescribeChildCases SingleCase';
        insert c2;
  }
    
	@isTest
    static void testTrigger() {
        // retrieve the test cases, but not the children cases
        Case testDataCaseParent = new Case();
        testDataCaseParent = [SELECT Id
        FROM Case WHERE Subject = 'TestDescribeChildCases ParentCase'
        ORDER BY CreatedDate DESC LIMIT 1];
        
        Case testDataCaseSingle = new Case();
        testDataCaseSingle = [SELECT Id
        FROM Case WHERE Subject = 'TestDescribeChildCases SingleCase'
        ORDER BY CreatedDate DESC LIMIT 1];
        
        // update the cases to fire the DescribeChildCases trigger
        Test.startTest();
        update new Case(Id = testDataCaseParent.Id, Status = 'Open');
        update new Case(Id = testDataCaseSingle.Id, Status = 'Open');
        Test.stopTest();
        
        //get the case with children and see if the description is updated correctly
        testDataCaseParent = [SELECT Id, Description
        FROM Case WHERE Subject = 'TestDescribeChildCases ParentCase'
        ORDER BY CreatedDate DESC LIMIT 1];
        
        //create the concatenation of children like in the trigger
        List<Case>childCases = new List<Case>();
        String description = '';
        childCases = [SELECT Id, CaseNumber FROM Case WHERE ParentId =:testDataCaseParent.Id];
        for (Case childCase: childCases) {
            description += childCase.CaseNumber;
            description += ',';
        	}
        
        System.assertEquals(description, testDataCaseParent.Description, 'Failed: Expected two child cases in description');
        
        // retrieve the single case and see if the description says 'caso sin hijos'
        testDataCaseSingle = [SELECT Id, Description
        FROM Case WHERE Subject = 'TestDescribeChildCases SingleCase'
        ORDER BY CreatedDate DESC LIMIT 1];
        
        System.assertEquals('Caso sin hijos', testDataCaseSingle.Description, 'Failed:Expected description Caso sin hijos');
  }
}