##
# The alert channels module outputs an array of channel IDs based on a provided
# list of channel names that already exist within your New Relic account.
#
# Useful with the following resources:
#   - newrelic_alert_policy
#   - newrelic_alert_policy_channel
##

variable "alert_channels" {
  type = list(string)

  # Alert channels (by channel name) that already exist in your account.
  # Replace these with the channel names you would like to use as data sources.
  default = [
    "alerts@company.com",
    "devops@company.com",
    "sysadmins@company.com"
  ]
}

# Retrieves all the channels listed above by name
data "newrelic_alert_channel" "channel" {
  count = length(var.alert_channels)
  name  = var.alert_channels[count.index]
}

# Output the channel IDs for use in resources
output "channel_ids" {
  value = data.newrelic_alert_channel.channel.*.id
}
