terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "netascode/aci"
      version = ">=0.2.0"
    }
  }
}

module "main" {
  source = "../.."

  name = "KEYRING1"
}

data "aci_rest" "pkiKeyRing" {
  dn = "uni/userext/pkiext/keyring-${module.main.name}"

  depends_on = [module.main]
}

resource "test_assertions" "pkiKeyRing" {
  component = "pkiKeyRing"

  equal "name" {
    description = "name"
    got         = data.aci_rest.pkiKeyRing.content.name
    want        = module.main.name
  }
}
