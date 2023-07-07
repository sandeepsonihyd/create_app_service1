resource "azurerm_service_plan" "demo-appservice-plan" {
  for_each = {
    dev = "B1"
    qa = "S1"
    prod = "P1v2"
  }
  name                = "demo-plan-${each.key}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name         = "${each.value}"
}

resource "azurerm_linux_web_app" "demo-appservice" {
  for_each = toset(["dev","qa","prod"])
  name                = "sandeep1-demo-appservice-${each.key}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  service_plan_id = azurerm_service_plan.demo-appservice-plan[each.key].id

  site_config {
    application_stack {
      dotnet_version = "7.0"
    }
    always_on = false
  }
}