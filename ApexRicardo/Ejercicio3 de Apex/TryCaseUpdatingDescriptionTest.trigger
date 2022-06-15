trigger TryCaseUpdatingDescriptionTest on Case (before update) {
    //hare un mapa primero 
    Map<Id, Case> mapasDeCasos = new Map<Id,Case>([SELECT Id,Description,(SELECT ID,CaseNumber from Cases) FROM Case where Id in :Trigger.new]);
        for(Case caseC: Trigger.new){
            
            //Aqui pregunto si el Id del caso
            if(mapasDeCasos.get(caseC.ID).Cases.size()!= 0){
               //podria hacer un string para la descripcion
               string newDescription;
                
                for(Case c : mapasDeCasos.get(caseC.ID).Cases){
                    newDescription = c.CaseNumber + ' ';
                }
                //Aqui tengo que cambiar la descripcion del caso;
                caseC.description = newDescription;
                
                }else{
                    caseC.Description = 'Casos sin hijos';
                }
            }
        
        
    }