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
            
            // TODO: Implement logic here
            if(orderRequests != null)
            {
                IDataAccess dAccess = new OpportunityDataAccess();
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