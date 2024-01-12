// Apex class to create custom fields on the Account object using Metadata API
public class CreateAccountFields {

    public static void createCustomFields() {
        // Create a new custom field definition
        MetadataService.CustomField customField = new MetadataService.CustomField();
        customField.fullName = 'Account.Custom_Field__c';
        customField.label = 'Custom Field';
        customField.type_x = 'Text';
        customField.length = 255;

        // Add the custom field to the list
        List<MetadataService.SaveResult> results = MetadataService.createMetadata(
            new List<MetadataService.Metadata> { customField }
        );

        // Check the results to ensure successful creation
        for (MetadataService.SaveResult result : results) {
            if (result.success) {
                System.debug('Custom field created successfully: ' + result.fullName);
            } else {
                System.debug('Error creating custom field: ' + result.errors[0].message);
            }
        }
    }
}