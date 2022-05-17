resource "aws_iam_role" "main" {
  name               = var.name
  assume_role_policy = data.template_file.assume_role.rendered
  path               = var.path
}

data "template_file" "assume_role" {
  template = file("${path.module}/resources/templates/assume_role_policy.tpl")

  vars = {
    service = var.service
  }
}

resource "aws_iam_role_policy" "main" {
  count = length(var.policies_file)
  name  = element(var.policies_file, count.index)
  role  = aws_iam_role.main.id
  policy = file(
    format(
      "%s%s%s",
      "./resources/policies/",
      element(var.policies_file, count.index),
      ".json",
    ),
  )
}

resource "aws_iam_role_policy_attachment" "main" {
  count      = length(var.aws_policies)
  role       = aws_iam_role.main.name
  policy_arn = element(var.aws_policies, count.index)
}

