trigger DescriptionContactTrigger on Case (before update) {
   
    Map<Id, List<String>> caseNumberParentToChild = new Map<Id, List<String>>();

    for(Case caso :[SELECT Id, ParentId, CaseNumber FROM Case WHERE ParentId IN : Trigger.newMap.keySet()]){
        // Si no están añadidos los casos se incluyen
        if(!caseNumberParentToChild.containsKey(caso.ParentId)){
            caseNumberParentToChild.put(caso.ParentId, new List<String>());
        }
        // Se añade al caso parent
        caseNumberParentToChild.get(caso.ParentId).add(caso.CaseNumber);
    }

    for(Case caso2 : Trigger.New){
       List<String> childCasesNumber = caseNumberParentToChild.get(caso2.Id);
        
        if(childCasesNumber != null){
            caso2.Description = String.join(childCasesNumber, ', ');
        }else{
        // Lista vacía, no hay hijos, asignamos descripción por defecto
        caso2.Description = 'Caso sin hijos';
        }
    }
}