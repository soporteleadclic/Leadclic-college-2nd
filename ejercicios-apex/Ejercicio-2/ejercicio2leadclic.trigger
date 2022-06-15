trigger ejercicio2leadclic on Case (before update) {
    
  Map<Id, AggregateResult> contadHijos = new Map<Id, AggregateResult>([
    Select ParentId Id, count(Id) sum From Case Where ParentId in :Trigger.new
    Group By ParentId]);

    
    List<String> CNros = new List<String>();
    for(Case c :[SELECT CaseNumber FROM Case WHERE ParentId IN :Trigger.new])
{
  
   CNros.add(c.CaseNumber);
}

  for(Case padre: Trigger.new) {
    AggregateResult ch = contadHijos.get(padre.Id);

    if(ch == null) {
      padre.Description = 'Caso sin hijos';
    } else {
      padre.Description = 'Hay '+ch.get('sum') + ' Casos hijos.' + '\n' + CNros;
    }
  }
}