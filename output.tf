output "app_service_hostnames" {
  #value = azurerm_linux_web_app.demo-appservice[*].default_hostname
  value = [
    for app in azurerm_linux_web_app.demo-appservice : app.default_hostname
  ]
}