variable "bucket_list" {
  type = list
  default  = ["demo-ck-1120720235656", "demo-ck-21120720235656", "demo-ck-31120720235656"]
}
resource "aws_s3_bucket" "demo_bucket" {
  count = length(var.bucket_list)
  bucket = var.bucket_list[count.index]
}

resource "aws_s3_bucket" "demo_bucket" {
  for_each = toset(var.bucket_list)
  bucket = var.name
}

