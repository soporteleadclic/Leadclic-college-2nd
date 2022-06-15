@isTest
public with sharing class Ejercicio3 {
    @TestSetup
    static void makeData(){//caso padre e insertar
        Case cc = new Case(Status= 'Working', Origin='Phone', Subject ='Caso Padre' ); 
        Case ck = new Case(Origin='Email', Status= 'Working', Subject ='Caso Ind'); 
        insert cc; insert ck;
        List<Case> casos = new List<Case>();//lista e inserto
        for (Integer i = 0; i < 2; i++) {
            casos.add(new Case( Origin='Email', Status= 'Working', ParentId= cc.Id, Subject ='Funciona'));
        }
        insert casos;      
    }
    @isTest
    static void testPadre(){
        Case ejemplo= [SELECT id, Status, Description FROM Case WHERE Subject ='Caso Padre' LIMIT 1];
        ejemplo.Status= 'New';
        Test.startTest();
        update ejemplo;
        Test.stopTest();
        Case pai= [SELECT Description FROM Case WHERE Subject ='Caso Padre' LIMIT 1];
        String estadonuevo = pai.Description;//descripcion a comparar
        String Numerosjuntos= '';//numeros 
        List<Case> casosS = [SELECT CaseNumber FROM Case WHERE Subject ='Funciona'];//casos hijos(caseN)
        for (Case c : casosS) {//escribimos todos los casenumber
            Numerosjuntos= Numerosjuntos+ c.CaseNumber;
        }
        System.assertEquals(Numerosjuntos, estadonuevo, ' caso padre');
        //System.assertEquals('valor esperado', stringrecogido, ' comentario');
    }
    @isTest
    static void testnoPadre(){
        Case hijo= [SELECT id, Origin FROM Case WHERE Subject ='Caso Ind' LIMIT 1];
        hijo.Origin='Phone';
        Test.startTest();
        update hijo;
        Test.stopTest();
        Case upda= [SELECT id, Description FROM Case WHERE Subject ='Caso Ind' LIMIT 1];
        String Orinuevo = upda.Description;
        System.assertEquals('Caso sin hijos', Orinuevo, ' caso Ind');
        //System.assertEquals('valor esperado', stringrecogido, ' comentario');
    }
}
