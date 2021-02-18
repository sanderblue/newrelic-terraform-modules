## Module Usage

Example using `newrelic_alert_policy_channel` resource
```hcl
module "alert_channels" {
  source = "./alert_channels"
}

resource "newrelic_alert_policy_channel" "synthetic" {
  policy_id   = <your policy id>
  channel_ids = module.your_module_name.channel_ids
}
```
