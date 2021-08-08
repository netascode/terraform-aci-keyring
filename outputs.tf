output "dn" {
  value       = aci_rest.pkiKeyRing.id
  description = "Distinguished name of `pkiKeyRing` object."
}

output "name" {
  value       = aci_rest.pkiKeyRing.content.name
  description = "Keyring name."
}
