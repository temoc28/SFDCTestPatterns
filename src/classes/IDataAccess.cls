/**
 * @author:	Temo Munoz
 * @date:	09/23/15
 * @email:	cmunoz@levementum.com
 * @description:	Out-of-the-box implementation for standard Salesforce DML operations
 */
public interface IDataAccess 
{
	List<sObject> getSObjects(Id sObjectId);
    List<sObject> getSObjects(String sObjectName);
    List<sObject> getSObjects(Set<Id> sObjectIds);
    
    boolean deleteSObjects(Id sObjectId);
    boolean deleteSObjects(String sObjectName);
    boolean deleteSObjects(Set<Id> sObjectIds);
    
    boolean upsertSObjects(List<sObject> sObjectsToUpsert);
}