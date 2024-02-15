# Backup-APIM.ps1
This script will backup the specified Azure API Management service to the specified Azure Storage Account blob container.


## Inputs
- environment - AzureCloud, AzureUSGovernment, or AzureChinaCloud. Assumes AzureCloud is not provided.
- subscriptionId - The Azure subscription ID
- apiManagementName - Name of the API Management service
- apiManagementResourceGroup - Name of the resource group containing the API Management service
- storageAccountName - Name of the storage account
- storageResourceGroup - Name of the resource group containing the storage account
- containerName - Name of the blob storage container
- blobName - Name of the blob that will store the backup file