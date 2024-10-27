package tests

import (
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestInfrastructure(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "../",
		Vars: map[string]interface{}{
			"environment":       "dev",
			"aws_region":        "us-east-1",
			"storage_bucket_name": "rustc-wave-dev-storage",
			"domain_name":       "dev.example.com",
			"certificate_arn":   "arn:aws:acm:us-east-1:123456789012:certificate/your-cert-id",
			"hosted_zone_id":    "Z3P5QSUBK4POTI",
		},
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	bucket := terraform.Output(t, terraformOptions, "storage_bucket_name")
	assert.Contains(t, bucket, "rustc-wave-dev-storage")

	cdnDomain := terraform.Output(t, terraformOptions, "cdn_domain")
	assert.NotEmpty(t, cdnDomain)
}
