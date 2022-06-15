@isTest
private class caseTriggerTest {
    @TestSetup
    static void makeData(){
                Case casoPapa = new Case(Status='Working',Origin='Email');
                insert casoPapa;
                Case casoHijo = new Case(Status='Working',Origin='Phone',ParentId=casoPapa.Id,Description='Caso sin hijos');
                insert casoHijo;
                Case sinHijos = new Case(Status='Escalated',Origin='Web');
                insert sinHijos;
    }
    @isTest
    static void testPositive(){
        List<Case> todosCasos = [SELECT id,Description,ParentId,CaseNumber FROM Case];
        List<Case> nueva = new List<Case>();
        for (Case caso : todosCasos) {
            caso.Description='test';
            nueva.add(caso);
        }
        update nueva;
        System.assertEquals(3,nueva.size(),'esto es la cantidad');
        
    }
    @isTest
    static void testNegative(){
        List<Case> casoSinHijos = [SELECT id,Description,ParentId,CaseNumber FROM Case WHERE ParentId = NULL];
        List<Case> segunda = new List<Case>();
       
        
    for (case c : casoSinHijos) {
            c.Subject='Email';
            segunda.add(c);
    }
    update segunda;
            System.assertEquals(2,segunda.size());
            
    }

}