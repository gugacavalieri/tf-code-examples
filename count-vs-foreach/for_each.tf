locals {
  for_each = {
    rules = [
      "allow-#1",
      "allow-#2",
      "allow-#3",
    ]
  }
}

resource "null_resource" "security_group_rules_for_each" {
  for_each = toset(local.for_each.rules)

  triggers = {
    index = each.key
    value = each.value
  }
}
