trigger Ejercicio2 on Case (before update) {
    List<Case> Hijos = new List<Case> ([SELECT Id, CaseNumber, ParentId FROM Case WHERE ParentId IN :Trigger.new]);
    
    
    for(Case a : Trigger.New) {
        for(Case c : Hijos){
            if(a.Id == c.ParentId){
                a.Description = ' ' + String.valueOf(c.CaseNumber);
            }
        }
        if(a.Description == null){
            a.Description = 'Caso sin hijos';
        }
}
//update Hijos;
}