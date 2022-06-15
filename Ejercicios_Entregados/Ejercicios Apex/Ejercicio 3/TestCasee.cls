//Una clase de test para generar casos y casos hijos
@isTest
public class TestCasee {
  //un metodo para crear un caso y devolverlo, se puede insertar o solo devolver 
  //en caso de que el parametro doInsert sea falso
  public static Case getCase(String Subject, Boolean doInsert){
    Case a = new Case(	Subject = 	Subject);
    if(doInsert){
      insert a;
    }
    return a;
  }
  //un método para crear un caso hijo del caso padre y devolverlo, se puede insertar o solo devolver 
  //en caso de que el parametro doInsert sea falso
  public static Case getCaseSon(Id ParentId, String Subject, Boolean doInsert){
    Case c = new Case(Subject = Subject, 	ParentId = 	ParentId);
    if(doInsert){
      insert c;
    }
    return c;
  }
  //Un método para generar un caso padre con un numero determinado de casos hijos
  public static void generateCaseWithCases(Integer numCases, String tipo){
    Case a = getCase('Caso padre', true);
    a.Type=tipo;
    List<Case> casos = new List<Case>();
    for(Integer i = 0; i < numCases; i++){
      String caseSubject = 'Caso hijo ' + i;
      casos.add(getCaseSon(a.id, caseSubject, false));
    }
    insert casos;
  }
}
