//Una clase de test para comprobar el correcto funcionamiento del apex desencadenadorbefore
@isTest
public class Desencadenadorapex_Test {
  //generar los registros necesarios para comprobar el funcionamiento correcto del apex
  //se genera un caso padre sin hijos, y otro con hijos
  @testSetup
  static void caseCreation() {
    case a = TestCasee.getCase('CasoSinHijo', true);
    TestCasee.generateCaseWithCases(3, 'Test');
  }
  //Comprobar que el apex hace lo que se espera de ello
  //Tiene que devolver la descripcion correcta de un caso en funcion de si tiene hijos o no
  @isTest
  static void testCasos() {
    List<Case> casos = new List<Case>([SELECT Id, Description FROM Case]);
    update casos; //Actualizar los casos para desencadenar el apex
    Test.startTest(); //Empezar el test
    //crear una mapa de Ids de los casos con hijos relacionados
    Map<Id,Case> casosConHijos = new Map<Id,Case>([SELECT Id,Description,Type, (SELECT Id FROM Cases) 
                                                   FROM Case WHERE Id IN: casos]);
    //iterar todos los casos
    for(Case cas: casos) { 
      //si es un caso sin hijos se obtiene su descripcion y se compara con lo que se espera que contenga
      if(casosConHijos.get(cas.Id).Cases.size()==0) { 
        string descripcion = casosConHijos.get(cas.Id).Description;
        System.assertEquals('Caso sin hijos', descripcion, 'Se esperaba devolver Caso sin hijos');
      }
      //si es un caso con hijos se hace lo mismo pero comparando la longitud de la descripcion 
      //en funcion del numero de hijos aplicando una formula para ello.
      else if(casosConHijos.get(cas.Id).Type == 'Test') {
        Integer longDescripcion = casosConHijos.get(cas.Id).Description.length();
        integer longShould = 8 * 3 + ( 2 * (3-1));
        System.assertEquals(longShould, longDescripcion, 'Se esperaba devolver longitud de Descripcion correcta');
      }
    }
    Test.stopTest(); //terminar el test
  }
}
