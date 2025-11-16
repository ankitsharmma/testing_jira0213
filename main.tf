resource "local_file" "foo" {
  content  = "foo!"
  filename = "${path.module}/foo.bar"
}
data "local_file" "foo" {
  filename = "${path.module}/foo.bar23"
}

resource "aws_s3_object" "shared_zip" {
  bucket  = "my-bucket"
  key     = "my-key112"
  content = data.local_file.foo.content
}