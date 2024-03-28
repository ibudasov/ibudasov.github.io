# Influx

## InfluxDB is an open-source time series database (TSDB) 

### Purpose and Use Cases:
Storage and Retrieval: InfluxDB is designed for the storage and retrieval of time series data.

Fields of Application: 
- Operations Monitoring: Tracking system performance, resource utilization, and other operational metrics.
- Application Metrics: Collecting and analyzing metrics related to software applications.
- Internet of Things (IoT): Storing data from IoT devices and sensors.
- Real-Time Analytics: Processing and querying data in real time.

### Features:
- Time Series Data Model: InfluxDB organizes data into time series, making it efficient for handling timestamped data.
- High Performance: It is optimized for high write and query performance.
- Retention Policies: Allows you to define how long data should be retained.
- SQL-Like Query Language: Supports a SQL-like query language for data retrieval.
- Support for Graphite: InfluxDB can process data from Graphite, a popular monitoring tool.

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

