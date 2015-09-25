/**
 * @author:	Temo Munoz
 * @date:	09/24/15
 * @email:	cmunoz@levementum.com
 * @description:	Provides a template for basic testing criteria and best practices
 */
public interface ITestRules 
{
    // Basic testing block unit - Meet at least 75%
	void testCodeCoverage();
    
    // Test boundary limits for given ranges in code
    void testBoundaryValues();
    
    // Test similar values without trying to test all of them
    void testEquivalenceClasses();
    
    // Test high-volume data
    void testStressData();
    
    // Test Data we are sure it is going to fail
    void testInvalidData();
}