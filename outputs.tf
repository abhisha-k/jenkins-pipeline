output "instance_public_ip" {
  value = aws_instance.nikk_ec2.public_ip
}

output "bucket_name" {
  value = aws_s3_bucket.nikk_bucket.bucket
}

