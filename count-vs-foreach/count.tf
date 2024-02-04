locals {
    count = {
        rules = [
          "allow-#1",
          "allow-#2",
          "allow-#3",
        ]
    }
}

resource "null_resource" "security_group_rules_count" {
  count = length(local.count.rules)

  triggers = {
    index = count.index
    value = local.count.rules[count.index]
  }
}
