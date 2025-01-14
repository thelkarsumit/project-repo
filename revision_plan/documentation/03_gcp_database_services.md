# GCP Database Services

## 1. Overview of GCP Database Services

Google Cloud offers several database services to meet different use cases, including relational, non-relational, and in-memory data stores. The key database services are:

**Cloud SQL:** Managed relational database (supports MySQL, PostgreSQL, and SQL Server).
**Cloud Spanner:** Globally distributed, horizontally scalable relational database.
**Cloud Bigtable:** NoSQL database for large analytical and operational workloads.
**Firestore:** NoSQL document database for mobile, web, and serverless apps.
**Cloud Datastore:** NoSQL database for application development (similar to Firestore).
**Cloud Memorystore:** Fully managed in-memory data store for Redis and Memcached.
**BigQuery:** Fully managed, serverless data warehouse for analytics.


## 2. Comparison of Database Services

| **Feature**              | **Cloud SQL**                        | **Cloud Spanner**                    | **Cloud Bigtable**                    | **Firestore**                     | **Cloud Datastore**               |
|--------------------------|--------------------------------------|--------------------------------------|--------------------------------------|-----------------------------------|-----------------------------------|
| **Type**                 | Relational                           | Relational                           | NoSQL (Wide-Column)                  | NoSQL (Document)                  | NoSQL (Entity-Group)              |
| **Use Case**             | Web applications, transactional apps | Global, high-availability apps       | Analytical and operational workloads | Mobile and web apps, serverless   | Mobile apps, small to medium scale |
| **Scalability**          | Vertical                             | Horizontal                           | Horizontal                           | Horizontal                        | Horizontal                        |
| **Consistency**          | Strong consistency                   | Strong consistency (global)          | Eventually consistent                | Eventual consistency              | Eventual consistency              |
| **Managed Service**      | Yes                                  | Yes                                  | Yes                                  | Yes                               | Yes                               |
| **Pricing Model**        | Pay-per-use                          | Pay-per-use                          | Pay-per-use                          | Pay-per-use                       | Pay-per-use                       |
| **Multi-Region Support** | No                                   | Yes                                  | Yes                                  | Yes                               | Yes                               |
| **SQL Support**          | Yes                                  | Yes                                  | No                                   | No                                | No                                |

## 3. Relational vs Non-Relational Databases

| **Feature**              | **Relational Databases**                    | **Non-Relational Databases**               |
|--------------------------|---------------------------------------------|--------------------------------------------|
| **Data Model**           | Structured (tables with rows and columns)   | Flexible (key-value, document, graph, etc.)|
| **Schema**               | Fixed schema                               | Schema-less or dynamic schema             |
| **Scalability**          | Vertical scaling                           | Horizontal scaling                        |
| **Consistency**          | Strong consistency (ACID compliance)        | Eventual consistency (BASE model)          |
| **Transactions**         | Supports multi-row transactions (ACID)     | Limited support for transactions          |
| **Query Language**       | SQL (Structured Query Language)             | No standard query language (depends on DB) |
| **Use Cases**            | Applications with structured data and complex queries | Large-scale applications with unstructured data or flexible schema |
| **Example Databases**    | MySQL, PostgreSQL, Oracle, MS SQL Server    | MongoDB, Cassandra, CouchDB, Firebase      |

![Analytical  vs Transactional Workload](../images/Structured%20or%20semi-structured%20data%20image1.png)

![Dataflow in Analytical  vs Transactional Workload](../images/Structured%20or%20semi-structured%20data%20image2.png)