trigger caseTrigger on Case (before update) {

Map<id,String> casosConPadre = new Map<id,String>();
List<String> numerosCasoHijos = new List<String>();

for(Case x : [SELECT CaseNumber FROM Case WHERE ParentId IN :trigger.new]){
        numerosCasoHijos.add(x.CaseNumber);
}
for (Case a : [SELECT id,Description,ParentId,CaseNumber
                FROM Case
                WHERE ParentId 
                IN :trigger.new]) {
                if(a.ParentId!=null){
                        // casosConPadre.put(a.ParentId,a.CaseNumber);
                        casosConPadre.put(a.id,a.ParentId);
                }
        }
for(Case b : trigger.new){
        List<String> valores = new List<String>();
        valores = casosConPadre.values();
        if(valores.size()!=0){
                for (String y : valores) {
                        if(b.id==y){
                        b.Description='Estos son todos sus casos hijos '+numerosCasoHijos;     
                        } 
                }
        }else{
                b.Description='Caso sin hijos';
              }
 }
}
