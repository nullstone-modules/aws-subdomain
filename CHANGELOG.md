# 0.8.0 (Mar 26, 2026)
* Migrated domain delegator from IAM user to IAM role.
* Migrated from Terraform to OpenTofu.
* Dropped `var.create_vanity` since it's no longer used.

# 0.7.5 (Dec 20, 2024)
* Fix passthrough check when subdomain matches domain.

# 0.7.4 (Dec 14, 2024)
* Pull subdomain info from Nullstone.
* Upgrade terraform providers.
