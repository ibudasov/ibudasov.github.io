# Databricks

There is a good free course available on the website.

## Features
- It is a large database.
- Enables Machine Learning.
- Uses delta-format for data structuring. 
- Not limited by size.

## Data Structure (Catalog)
- Catalog
- Schemas
  - Bronze - Read only, ingested data.
  - Silver - Allows write operations. Enables joining schemas. 
  - Gold - Allows writing.
- Tables
  - Lineage - Indicates where the table is used.
- Columns

## SQL Editor
- Supports standard SQL.
- Allows creation of visualizations, similar to PowerBI, such as bar charts.
- Includes an AI assistant which can create a query for you.

## SQL Warehouse
- Where the data is stored. Might incur costs if too many heavy queries are executed.
- Allows viewing the timeline of execution.

## Workspace
- Allows saving named queries.
- Shows query history, including execution time.
- Notebooks 
  - Used for the silver layer.
  - Records what you have done automatically, without needing to save.
  - Supports Scala, Python, or SQL.
  - Displays query results.
  - Can perform aggregations.
  - Allows creation of visualizations.
  - Enables creation of a `view` from a query. These are not the same as Postgres views. Data is copied to the view when the view is created.
    - Queries for the views are stored in repositories.
    - There is a CI/CD process, which runs these queries, creating views, when you need it, or in a scheduled way. 
    - The views are not updated automatically when there is new data.
    - This is why there are jobs for updating views.
    - Supports `{env}` variables.

## Dashboards
- Uses SQL.
- Includes an AI assistant.
- Allows creation of legends.
- Supports adding text explanations.
- Features a drag-n-drop editor for the UI.
- Allows publishing and setting access permissions.
- Mostly useful for personal analysis.