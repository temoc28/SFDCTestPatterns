/**
 * @author:	Temo Munoz
 * @date:	09/23/15
 * @email:	cmunoz@levementum.com
 * @description:	Product DML Operations
 */
public class ProductDataAccess implements IDataAccess
{
	public List<sObject> getSObjects(Id sObjectId)
    {
        List<sObject> sObjects = new List<sObject>();
        try
        {
            
        }
        catch(Exception ex)
        {
            system.debug(ex.getMessage() + ' ' + ex.getStackTraceString());
        }
        return sObjects;
    }
    
    public List<sObject> getSObjects(String sObjectName)
    {
        List<sObject> sObjects = new List<sObject>();
        try
        {
            
        }
        catch(Exception ex)
        {
            system.debug(ex.getMessage() + ' ' + ex.getStackTraceString());
        }
        return sObjects;
    }
    
    public List<sObject> getSObjects(Set<Id> sObjectIds)
    {
        List<sObject> sObjects = new List<sObject>();
        try
        {
            
        }
        catch(Exception ex)
        {
            system.debug(ex.getMessage() + ' ' + ex.getStackTraceString());
        }
        return sObjects;
    }
    
    public boolean deleteSObjects(Id sObjectId)
    {
        boolean result = false;
        try
        {
            result = true;
        }
        catch(Exception ex)
        {
            system.debug(ex.getMessage() + ' ' + ex.getStackTraceString());
        }
        return result;
    }
    
    public boolean deleteSObjects(String sObjectName)
    {
        boolean result = false;
        try
        {
            result = true;
        }
        catch(Exception ex)
        {
            system.debug(ex.getMessage() + ' ' + ex.getStackTraceString());
        }
        return result;
    }
    
    public boolean deleteSObjects(Set<Id> sObjectIds)
    {
        boolean result = false;
        try
        {
            result = true;
        }
        catch(Exception ex)
        {
            system.debug(ex.getMessage() + ' ' + ex.getStackTraceString());
        }
        return result;
    }
    
    public boolean upsertSObjects(List<sObject> sObjectsToUpsert)
    {
        boolean result = false;
        try
        {
            result = true;
        }
        catch(Exception ex)
        {
            system.debug(ex.getMessage() + ' ' + ex.getStackTraceString());
        }
        return result;
    }
}