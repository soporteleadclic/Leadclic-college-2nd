@isTest
private class DatatestEjercicio2 {

  @testSetup static void makeData() {
    Case tParentCase = new Case(Origin = 'Phone',Status='New', Subject = 'casewithchilds');
    insert tParentCase;
    Case tParentCaseNoChilds = new Case(Origin = 'Phone',Status='New', Subject = 'casewithoutchilds');
    insert tParentCaseNoChilds;

    // Crear casos hijos en comun
    List<Case> tChildCases = new List<Case>();
    for (Integer i = 0; i < 3; i++) {
      tChildCases.add(
        new Case(
          Origin = 'Phone',Status='New',
          Subject = 'Testcase' + i,
          ParentId = tParentCase.Id
        )
      );
    }
    insert tChildCases;
    
  } 


  @isTest static void metodoprueba1() {

    List<String> cNros = new List<String>();
    for(Case c :[SELECT CaseNumber FROM Case WHERE ParentId != null])
{
  
   cNros.add(c.CaseNumber);
}
    Case c = [SELECT id, Description FROM Case WHERE Subject = 'casewithchilds' LIMIT 1];
    c.Status = 'New';  // new value
    c.Origin = 'Web';
    Test.startTest();
    update c;
    Test.stopTest();
    Case cafterupdate = [SELECT id, Description FROM Case WHERE Subject = 'casewithchilds' LIMIT 1];
    String descp1 = cafterupdate.Description;

    System.assertEquals('Hay 3 Casos hijos.' + '\n' + cNros , descp1, 'hay descripcion');
}
@isTest static void metodoprueba2() {
    Case c2 = [SELECT id, Description FROM Case WHERE Subject = 'casewithoutchilds' LIMIT 1];
    c2.Status = 'New';  // new value
    c2.Origin = 'Web';
    Test.startTest();

    update c2;
    Test.stopTest();
    Case c2afterupdate = [SELECT id, Description FROM Case WHERE Subject = 'casewithoutchilds' LIMIT 1];
    String descp2 = c2afterupdate.Description;

    System.assertEquals('Caso sin hijos', descp2, 'no hay descripcion');

}

}
