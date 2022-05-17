locals {
  rules = var.rules != null ? {
    for indx, rule in flatten(var.rules) :
    format("%v-%v-%v-%v-%s",
      rule.type,
      rule.protocol,
      rule.from_port,
      rule.to_port,
      try(rule["description"], null) == null ? md5(format("Managed by Terraform #%d", indx)) : md5(rule.description)
    ) => rule
  } : {}
}

resource "aws_security_group" "main" {
  name = var.name
  description = var.name
  vpc_id = var.vpc_id
  tags = merge(
    var.tags,
    {
      "role" = "security_group"
    },
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "main" {
  for_each = local.rules

  security_group_id = aws_security_group.main.id
  type              = each.value.type
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  description       = lookup(each.value, "description", "Managed by Terraform")
  cidr_blocks      = try(length(lookup(each.value, "cidr_blocks", [])), 0) > 0 ? each.value["cidr_blocks"] : null
}
