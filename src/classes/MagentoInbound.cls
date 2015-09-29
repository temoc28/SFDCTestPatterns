/**
 * @author:	Temo Munoz
 * @date:	09/22/15
 * @email:	cmunoz@levementum.com
 * @description: Web service inbound request from Magento for Order models
 */
global class MagentoInbound 
{
    /**
 	 * @author:	Temo Munoz
 	 * @date:	09/22/15
 	 * @email:	cmunoz@levementum.com
 	 * @description: Response Model sent back to Magento
 	*/
    global class GeneralResponse
    {
        webservice Integer mageId;
        webservice String sfId;
        webservice String status;
    }
    
    /**
 	 * @author:	Temo Munoz
 	 * @date:	09/22/15
 	 * @email:	cmunoz@levementum.com
 	 * @description: Main Entry Point for Magento Order Requests
 	*/
    webservice static List<GeneralResponse> processMagentoOrderRequest(List<String> customerRequests, List<String> customerAddressRequests,
                                                                       List<String> orderRequests, List<String> orderLineItemRequests,
                                                                       List<String> productRequests)
    {
        List<GeneralResponse> generalResponse = new List<GeneralResponse>();
        try
        {
            system.debug('Customer Request: ' + customerRequests);
            system.debug('Customer Address Request: ' + customerAddressRequests);
            system.debug('Order Request: ' + orderRequests);
            system.debug('Order Line Items Request: ' + orderLineItemRequests);
            system.debug('Product Request: ' + productRequests);
            
            Map<String, String> jsonMapRequest = new Map<String, String>();

            // TODO: Implement logic here
            if(orderRequests != null)
            {
            	for(String str : orderRequests)
            	{
            		IDataAccess dAccess = new OpportunityDataAccess();
	                JSONParser parser = JSON.createParser(str);
	                
	                String fieldName = '';
	                String fieldValue = '';
			        while (parser.nextToken() != null) 
			        {
			            if(parser.getCurrentToken() == JSONToken.VALUE_STRING){jsonMapRequest.put(parser.getCurrentName(), parser.getText());}			            
			            parser.nextToken();			     
			        }
            	}
            	system.debug('TEMO ' + jsonMapRequest);
            	
            	MetadataService.CustomObject customObject = new MetadataService.CustomObject();
				customObject.fullName = 'Test__c';
				customObject.label = 'Test';
				customObject.pluralLabel = 'Tests';
				customObject.nameField = new MetadataService.CustomField();
				customObject.nameField.type_x = 'Text';
				customObject.nameField.label = 'Test Record';
				customObject.deploymentStatus = 'Deployed';
				customObject.sharingModel = 'ReadWrite';
				MetadataService.AsyncResult[] results = service.create(new List<MetadataService.Metadata> { customObject });
            }
            
            GeneralResponse gr = new GeneralResponse();
            gr.mageId = 1;
            gr.sfId = '1';
            
            gr.status = orderRequests == null ? 'Warning: Make sure the Order was populated in Salesforce. Request in Salesforce is empty' : '200 OK'; 
            generalResponse.add(gr);
        }
        catch(Exception ex)
        {
            system.debug(ex.getMessage());
            GeneralResponse gr = new GeneralResponse();
            gr.mageId = 1;
            gr.sfId = '1';
            gr.status = '500 ' + ex.getMessage() + ' ' + ex.getStackTraceString();
            generalResponse.add(gr);
        }
        return generalResponse;
    }
}