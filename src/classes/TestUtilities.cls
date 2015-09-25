/**
 * @author:	Temo Munoz
 * @date:	09/23/15
 * @email:	cmunoz@levementum.com
 * @description:	General SFDC Object DML Operations for Test Runs.
 * It only covers required fields. Other fields MUST be updated in the test class.
 */
public class TestUtilities implements ITestUtil
{
    /**
     * @author:	Temo Munoz 
     * @date:	09/23/15
     * @email:	cmunoz@levementum.com
     * @description: Dynamic Opportunity Creation
     */
	public static List<sObject> getSObjects(Integer numElements, String sObjectName)
    {
        List<sObject> sObjects = new List<sObject>();
        try
        {
            Schema.DescribeSObjectResult resultObject = null;
            sObject resultType = null;
            
            // FACTORY STATEMENTS
            if(sObjectName.equalsIgnoreCase('Opportunity')){resultObject = Opportunity.sObjectType.getDescribe(); resultType = new Opportunity();}
            if(sObjectName.equalsIgnoreCase('Account')){resultObject = Account.sObjectType.getDescribe(); resultType = new Account();}
            if(sObjectName.equalsIgnoreCase('Contact')){resultObject = Contact.sObjectType.getDescribe(); resultType = new Contact();}
            
            Map<Schema.SObjectField, Schema.DisplayType> requiredFields = getRequiredFields(resultObject);
            sObject updatedSObjectRequiredFields = updateSObjectRequiredFields(numElements, requiredFields, resultType);
            sObjects.add(updatedSObjectRequiredFields);
            insert sObjects;
        }
        catch(Exception ex)
        {
            system.debug(ex.getMessage() + ' ' + ex.getStackTraceString());
        }
        return sObjects;
    }
    
    /**
     * @author:	Temo Munoz 
     * @date:	09/23/15
     * @email:	cmunoz@levementum.com
     * @description: Generic method for updating required fields for any object specified in the factory statement
     */
    private static sObject updateSObjectRequiredFields(Integer numElements, Map<Schema.SObjectField, Schema.DisplayType> requiredFields, sObject resultType)
    {
        sObject updatedSObject = resultType;
        try
        {           
            for(Integer i = 0; i < numElements; i++)
            {
                for(Schema.SObjectField field : requiredFields.keySet())
                {
                    Schema.DisplayType dataType = requiredFields.get(field);
                    if(dataType != null)
                    {
                        if(dataType == Schema.DisplayType.BOOLEAN){Boolean val = getRandomInt(0, 2) > 1 ? true : false; updatedSObject.put(field.getDescribe().getName(), val);}  
                        if(dataType == Schema.DisplayType.DATE){updatedSObject.put(field.getDescribe().getName(), system.today());}  
                        if(dataType == Schema.DisplayType.DATETIME){updatedSObject.put(field.getDescribe().getName(), system.today());}  
                        if(dataType == Schema.DisplayType.DOUBLE){Double val = getRandomInt(0, 2) > 1 ? 1.0 : -1.0; updatedSObject.put(field.getDescribe().getName(), val);}  
                        if(dataType == Schema.DisplayType.EMAIL){String val = getRandomInt(0, 2) > 1 ? 'test@user.com' : 'test2@user.com'; updatedSObject.put(field.getDescribe().getName(), val);}        
                        if(dataType == Schema.DisplayType.INTEGER){updatedSObject.put(field.getDescribe().getName(), i);}  
                        if(dataType == Schema.DisplayType.PHONE){updatedSObject.put(field.getDescribe().getName(), '111-111-1111');}  
                        if(dataType == Schema.DisplayType.STRING){updatedSObject.put(field.getDescribe().getName(), i + system.currentTimeMillis() + '');}  
                        if(dataType == Schema.DisplayType.PICKLIST)
                        {
                            List<Schema.PicklistEntry> ple = field.getDescribe().getPicklistValues();
                            if(ple.size() > 0)
                            {
                            	updatedSObject.put(field.getDescribe().getName(), ple.get(0).getValue());
                            }
                            else
                            {
                                updatedSObject.put(field.getDescribe().getName(), 'Test');
                            }
                        }  
                    }
                }
            }
        }
        catch(Exception ex)
        {
            system.debug(ex.getMessage() + ' ' + ex.getStackTraceString());
        }
        return updatedSObject;
    }
    
    /**
     * @author:	Temo Munoz 
     * @date:	09/23/15
     * @email:	cmunoz@levementum.com
     * @description: A nillable field can have empty content. If isNillable() is false, then the field is mandatory
     */
    private static Map<Schema.SObjectField, Schema.DisplayType> getRequiredFields(Schema.DescribeSObjectResult resultObject)
    {
        Map<Schema.SObjectField, Schema.DisplayType> requiredFields = new Map<Schema.SObjectField, Schema.DisplayType>();
        try
        {
            Map<String, Schema.SObjectField> fieldsMap = resultObject.fields.getMap();
            for(String fieldName : fieldsMap.keySet())
            { 
                Schema.SObjectField field = fieldsMap.get(fieldName);
                Schema.DescribeFieldResult fieldDescribe = field.getDescribe();            
                Boolean requiredField  = fieldDescribe.isNillable();
                Boolean writableField = fieldDescribe.isUpdateable();

                if(!requiredField && writableField)
                {
                    Schema.DisplayType fieldDataType = field.getDescribe().getType();
                	requiredFields.put(field, fieldDataType);
                }
           }
        }
        catch(Exception ex)
        {
            system.debug(ex.getMessage() + ' ' + ex.getStackTraceString());
        }
        return requiredFields;
    }
    
    /**
     * @author:	Temo Munoz 
     * @date:	09/23/15
     * @email:	cmunoz@levementum.com
     * @description: Gets a random integer number between lower (inclusive) and upper (exclusive)
     */
	public static Integer getRandomInt(Integer lower, Integer upper)
	{
		return Math.round(Math.random() * (upper - lower)) + lower;
	}
}