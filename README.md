# SFDCTestPatterns

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Salesforce Test Class Patterns

This repository provides a techinque for automatically generating values for Contacts, Accounts, and Opportunities in Salesforce when creating test classes.

Furthermore, the repository provides a set of basic testing techinques that can be implemented by developers such as boundary values analysis, strees testing, and equivalence classes.

Required fields are automatically populated. The rest are the developer's responsibility.
Using the Schema object, we can easily obtain the required fields in Salesforce.

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
