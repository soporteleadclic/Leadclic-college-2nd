trigger DescribeChildCases on Case (before update) {
    List<Case>childCases = new List<Case>();
    String newDescription = '';
    
    // iterate over all cases that have been updated, check if children and update description
    for(Case c : Trigger.New) {
        childCases = [SELECT Id, CaseNumber FROM Case WHERE ParentId =:c.Id];
        if (childCases.isEmpty()) {
           c.Description = 'Caso sin hijos';
        } else {
            for (Case childCase: childCases) {
            newDescription += childCase.CaseNumber;
            newDescription += ',';
        	}
        	c.Description = newDescription;
        }
        
    } 
       
}