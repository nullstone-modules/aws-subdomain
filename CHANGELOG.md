# 0.8.2 (Apr 24, 2026)
* Fixed configuration of aws `domain` provider with assume role duration.

# 0.8.1 (Apr 24, 2026)
* Fixed usage of `try` when looking up domain outputs.

# 0.8.0 (Mar 26, 2026)
* Migrated domain delegator from IAM user to IAM role.
* Migrated from Terraform to OpenTofu.
* Dropped `var.create_vanity` since it's no longer used.

# 0.7.5 (Dec 20, 2024)
* Fix passthrough check when subdomain matches domain.

# 0.7.4 (Dec 14, 2024)
* Pull subdomain info from Nullstone.
* Upgrade terraform providers.
