trigger Ejercicio2 on Case (before update) {
    //mapas
    Map<Id, Case> Mapa = new Map<Id, Case>([SELECT Id, Description, 
    (SELECT ID, CaseNumber FROM Cases ) FROM Case WHERE Id IN :Trigger.new]);
    //actualizamos descripciones sin hijos
    for (Case c : Trigger.new) {
        if(Mapa.get(c.ID).Cases.size()!=0){
            //si al hacer la consulta sale una subconsulta(que tiene hijos) 
            String suma= '';//String de descripcion
            for (Case cass : Mapa.get(c.ID).Cases) {
               suma = suma+cass.CaseNumber; 
            }
            c.Description= suma;
        }else{//el trigger actualiza solo
            c.Description='Caso sin hijos';
        }       
    }
}