#===============================================================================
# Microsoft FastTrack for Azure
# Backup an Azure API Management instance
#===============================================================================
# Copyright © Microsoft Corporation.  All rights reserved.
# THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY
# OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT
# LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
# FITNESS FOR A PARTICULAR PURPOSE.
#===============================================================================
param(
    [Parameter(Mandatory)]$environment,
    [Parameter(Mandatory)]$subscriptionId,
    [Parameter(Mandatory)]$apiManagementName,
    [Parameter(Mandatory)]$apiManagementResourceGroup,
    [Parameter(Mandatory)]$storageAccountName,
    [Parameter(Mandatory)]$storageResourceGroup,
    [Parameter(Mandatory)]$containerName,
    [Parameter(Mandatory)]$blobName
)

if ($environment -eq '' -or $environment.ToLower() -eq 'azurecloud') {
    Connect-AzAccount
}
elseif ($environment.ToLower() -eq 'azureusgovernment') {
    Connect-AzAccount -Environment AzureUSGovernment
}
elseif ($environment.ToLower() -eq 'azurechinacloud') {
    Connect-AzAccount -Environment AzureChinaCloud
}
Set-AzContext -Subscription $subscriptionId

$storageKey = (Get-AzStorageAccountKey -ResourceGroupName $storageResourceGroup -StorageAccountName $storageAccountName)[0].Value
$storageContext = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageKey

Backup-AzApiManagement -ResourceGroupName $apiManagementResourceGroup -Name $apiManagementName -StorageContext $storageContext -TargetContainerName $containerName -TargetBlobName $blobName