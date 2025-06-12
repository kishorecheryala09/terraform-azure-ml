provider "azurerm" {
  features {}     
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "mlrg"{
  # Create a resource group for the Azure Machine Learning workspace
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

//create a storage account for the Azure Machine Learning workspace
resource "azurerm_storage_account" "ml_storage" {
  name                     = "kcmlstorage1"
  resource_group_name      = azurerm_resource_group.mlrg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}
# Create a Key Vault for the Azure Machine Learning workspace
resource "azurerm_key_vault" "ml_key_vault" {
  name                = "${var.workspace_name}keyvault"
  location            = var.location
  resource_group_name = azurerm_resource_group.mlrg.name
  tenant_id           = var.tenant_id
  sku_name            = "standard"
    purge_protection_enabled = true
    soft_delete_retention_days = 7
}
# Create an Application Insights resource for the Azure Machine Learning workspace
resource "azurerm_application_insights" "ml_app_insights" {
  name                = "${var.workspace_name}appinsights"
  location            = var.location
  resource_group_name = azurerm_resource_group.mlrg.name
  application_type    = "web"

  tags = var.tags
}
# Create the Azure Machine Learning workspace
resource "azurerm_machine_learning_workspace" "ml_workspace" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = azurerm_resource_group.mlrg.name
  storage_account_id  = azurerm_storage_account.ml_storage.id
  key_vault_id        = azurerm_key_vault.ml_key_vault.id
  application_insights_id = azurerm_application_insights.ml_app_insights.id

  tags = var.tags

  identity {
    type = "SystemAssigned"
  }
}