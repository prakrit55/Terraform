resource "aws_s3_object" "ob1" {
    bucket = "buckets3formyerrrstatedemo"
    key    = "index.html"
    source = "index.html"
    
}