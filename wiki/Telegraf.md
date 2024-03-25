# Telegraf

Collecting metrics from Azure services and pushes them to Azure Monitor.

Object Model
1. Inputs: These are plugins that collect metrics from the specified sources
2. Processors: These plugins transform, decorate, and/or filter metrics. They can modify the metrics collected by the input plugins before they are sent to the output plugins. For example, a processor could be used to add additional tags to a metric, or to change the format of a metric.
3. Aggregators: These plugins create aggregate metrics (e.g., mean, min, max, quantiles, etc.) from the collected metrics. Aggregator plugins have the ability to buffer and aggregate metric data over the duration of time.
4. Outputs: These are plugins that take the metrics and send them to the specified destination. This could be a database, a file, or a monitoring service like Azure Monitor.