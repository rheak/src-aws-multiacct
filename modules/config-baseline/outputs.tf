output "configuration_recorder_id" {
  description = "The name of the configuration recorder."
  value       = "${aws_config_configuration_recorder.recorder.id}"
}
