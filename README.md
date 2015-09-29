# SFDCTestPatterns
Salesforce Test Class Patterns

This repository provides a techinque for automatically generating values for Contacts, Accounts, and Opportunities in Salesforce when creating test classes.

Furthermore, the repository provides a set of basic testing techinques that can be implemented by developers such as boundary values analysis, strees testing, and equivalence classes.

Required fields are automatically populated. The rest are the developer's responsibility.
Using the Schema object, we can easily obtain the rquired fields in Salesforce.

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
