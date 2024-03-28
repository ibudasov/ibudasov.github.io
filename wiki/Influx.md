# Influx

## Object model
Tags:
- Tags are indexed string values meant for discrete sets of values.
- They are ideal for metadata and are commonly used to differentiate data sources.
- Tags can be queried in a WHERE clause and are useful for grouping values with GROUP BY.
- Use tags when you have a bounded set of tag values and need such functionality1.
- For example, if you’re tracking sensor data from different devices, you might use tags to represent the device type, location, or version.

Fields:
- Fields represent the actual data values associated with a measurement.
- Unlike tags, fields are not indexed and are not suitable for grouping or filtering.
- Fields are where you store the numeric or textual data you want to analyze.
- For instance, if you’re measuring temperature, humidity, or voltage, these values would be stored as fields.

Measurements:
- Measurements are like tables in a relational database.
- They group related data points together.
- Each measurement can have tags and fields associated with it.
- For example, if you’re collecting temperature data, your measurement might be named “temperature” and have tags like “sensor_id” and fields like “value” and “unit.”

## InfluxQL

Similar on the first look to SQL, but don't get confused by that. 

Spend some time on reading this: 

https://docs.influxdata.com/influxdb/v2/query-data/influxql

