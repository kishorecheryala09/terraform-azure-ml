# Add your variable declarations here

variable "storage_account_id" {
  description = "The ID of the storage account to be used by the Azure Machine Learning workspace."
  type        = string
}
variable "workspace_name" {
  description = "The name of the Azure Machine Learning workspace"
  type        = string
}
variable "location" {
  description = "The Azure region where the Machine Learning workspace will be created."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group where the Azure Machine Learning workspace will be created."
  type        = string
}
variable "key_vault_id" {
  description = "The ID of the Key Vault to be used by the Azure Machine Learning workspace."
  type        = string
}
variable "application_insights_id" {
  description = "The ID of the Application Insights resource to be used by the Azure Machine Learning workspace."
  type        = string
}
variable "tags" {
  description = "A map of tags to assign to the Azure Machine Learning workspace."
  type        = map(string)
  default     = {}
}
variable "tenant_id" {
  description = "The tenant ID for the Azure subscription."
  type        = string
  default     = ""  
}
variable "subscription_id" {
  description = "The subscription ID for the Azure resources."
  type        = string
  default     = ""
  
}