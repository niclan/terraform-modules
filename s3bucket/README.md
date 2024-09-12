# s3bucket

Simple module to create a generic s3 bucket with CDN in north America and Europe.

## Usage

```hcl
module "bucket" {
  source = TBD

  name = "my-bucket-uuxuyekoz2Ge"
  billed-service = "operations-storage"
  region = "eu-north-1"  # Default
}
```

The billed-service attribute is used to set a `billed-service` tag which my employer uses to allocate cost.

More fun usage:

```hcl
variable "buckets" {
  type = map(string)
  default = {
    "static-frontend-assets" = "frontend-team"
    "vector-storage" = "ai-team"
    "model-storage" = "ai-team"
  }
}

modules "buckets"  {
  source = TBD

  for_each = var.buckets

  name = each.key
  billed-service = each.value
}
```
