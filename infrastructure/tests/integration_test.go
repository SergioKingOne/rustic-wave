package tests

import (
	"fmt"
	"os"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func init() {
	// Load .env file from project root
	if err := loadEnvFile("../../.env"); err != nil {
		fmt.Printf("Error loading .env file: %v\n", err)
	}
}

func loadEnvFile(path string) error {
	envFile, err := os.ReadFile(path)
	if err != nil {
		return fmt.Errorf("error reading .env file: %v", err)
	}

	lines := strings.Split(string(envFile), "\n")
	for _, line := range lines {
		line = strings.TrimSpace(line)
		if line == "" || strings.HasPrefix(line, "#") {
			continue
		}

		parts := strings.SplitN(line, "=", 2)
		if len(parts) != 2 {
			continue
		}

		key := strings.TrimSpace(parts[0])
		value := strings.TrimSpace(parts[1])
		os.Setenv(key, value)
	}

	return nil
}

func TestInfrastructure(t *testing.T) {
	t.Parallel()

	// Load and validate env variables
	envVars := map[string]string{
		"AWS_ACCESS_KEY_ID":     os.Getenv("AWS_ACCESS_KEY_ID"),
		"AWS_SECRET_ACCESS_KEY": os.Getenv("AWS_SECRET_ACCESS_KEY"),
		"AWS_REGION":           os.Getenv("AWS_REGION"),
		"BUCKET_NAME":          os.Getenv("BUCKET_NAME"),
	}

	// Validate all required variables are set
	for name, value := range envVars {
		if value == "" {
			t.Fatalf("%s environment variable must be set", name)
		}
	}

	terraformOptions := &terraform.Options{
		TerraformDir: "../",
		Vars: map[string]interface{}{
			"environment":           "dev",
			"aws_region":           envVars["AWS_REGION"],
			"bucket_name":          envVars["BUCKET_NAME"],
			"aws_access_key_id":    envVars["AWS_ACCESS_KEY_ID"],
			"aws_secret_access_key": envVars["AWS_SECRET_ACCESS_KEY"],
			"domain_name":          "sergio-dev-projects.click",
			"hosted_zone_id":       os.Getenv("HOSTED_ZONE_ID"),
		},
		EnvVars: map[string]string{
			"AWS_ACCESS_KEY_ID":     envVars["AWS_ACCESS_KEY_ID"],
			"AWS_SECRET_ACCESS_KEY": envVars["AWS_SECRET_ACCESS_KEY"],
			"AWS_REGION":           envVars["AWS_REGION"],
		},
	}

	terraform.InitAndApply(t, terraformOptions)

	bucket := terraform.Output(t, terraformOptions, "storage_bucket")
	assert.Contains(t, bucket, envVars["BUCKET_NAME"])

	cdnDomain := terraform.Output(t, terraformOptions, "cdn_domain")
	assert.NotEmpty(t, cdnDomain)

	dnsRecord := terraform.Output(t, terraformOptions, "dns_record")
	assert.Equal(t, "sergio-dev-projects.click", dnsRecord)
}
