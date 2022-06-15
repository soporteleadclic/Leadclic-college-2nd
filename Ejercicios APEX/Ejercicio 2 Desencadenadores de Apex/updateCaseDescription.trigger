/*Crea un trigger para el objeto Case en el que antes de la actualizacion, se actualice el campo Description de cada uno de los elementos que entren en el trigger, la concatenacion de todos los números de caso (CaseNumber) de sus casos hijos.
SI no tiene casos hijos, debe de actualizar el campo descripción con el texto 'Caso sin hijos' 
[CASO]<-----[CASOS HIJOS]
//*Buscar todos los casos y apuntar al ID del Contacto. Si un Contacto tiene varios casos abiertos serán los casos hijos??
*/

trigger updateCaseDescription on Case (before update) {

   List<Case> childrenCases = new List<Case> ([SELECT Id, ContactId, AccountId, ParentId, CaseNumber FROM Case WHERE ParentId IN :Trigger.new]);
    
        for (Case tn : Trigger.New) {
            for (Case cc : childrenCases) {
                if (tn.Id == tn.ParentId) {
                    tn.Description = String.valueOf(cc.CaseNumber);
                }
            }
            if (tn.Description == null) {
                tn.Description = 'Caso sin hijos';
            }
            //childrenCases.add(tn);
        }

        //update childrenCases;


}
