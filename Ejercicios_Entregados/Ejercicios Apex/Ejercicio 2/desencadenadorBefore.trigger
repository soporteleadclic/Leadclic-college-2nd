trigger desencadenadorBefore on Case (before update) {

    //Extraer los casos hijos relacionados con los casos del trigger
    Map<Id,Case> casosConHijos = new Map<Id,Case>([SELECT Id, (SELECT Id, CaseNumber FROM Cases) 
                                                 FROM Case WHERE Id IN: Trigger.new]);
    //Iterar todos los casos que desencadenaron el apex
    for(Case casos: Trigger.new) {
        String aux = Null; //Crear un string donde almacenar el campo CaseNumber de los casos hijos 
        if(casosConHijos.get(casos.Id).Cases.size()>0) { //si el caso tiene caso/s hijo/s
            //iterar el/los caso/s hijo/s y obtener el numero del campo CaseNumber
            for(case cas: casosConHijos.get(casos.Id).Cases) 
            {
                if(aux == null) {
                aux = cas.CaseNumber;
                }
                else {
                    aux = aux + ', ' + cas.CaseNumber;
                }
            }
            //modificar la descrpcion del caso padre
            casos.Description = aux;
        }
        //si el caso no tiene hijos se modifica la descripcion indicando que no tiene hijos
        else {
            casos.Description = 'Caso sin hijos';
        }
    }
}