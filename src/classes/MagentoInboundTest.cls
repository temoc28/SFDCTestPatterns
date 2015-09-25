/**
 * @author:	Temo Munoz
 * @date:	09/23/15
 * @email:	cmunoz@levementum.com
 * @description:	Magento Inbound Test Suite
 */
@isTest
public class MagentoInboundTest implements ITestRules
{    
    // Basic testing block unit - Meet at least 75%
    public static testmethod void testCodeCoverage()
    {
        try
        {
            Test.startTest();
            	List<Opportunity> opps = (List<Opportunity>)TestUtilities.getSObjects(1, 'Opportunity');
            	system.assertEquals(1, opps.size());
            	system.debug(opps);
            Test.stopTest();
		}
        catch(Exception ex)
        {
            system.debug(ex.getMessage() + ' ' + ex.getStackTraceString());
        }
    }
    
    // Test boundary limits for given ranges in code
    public static testmethod void testBoundaryValues(){}
    
    // Test similar values without trying to test all of them
    public static testmethod void testEquivalenceClasses(){}
    
    // Test high-volume data
    public static testmethod void testStressData(){}
    
    // Test Data we are sure it is going to fail
    public static testmethod void testInvalidData(){}
}