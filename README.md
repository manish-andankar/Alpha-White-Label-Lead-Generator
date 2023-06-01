# TLG2: GCP Cloud Spanner database for White Label Lead Generator App.
## Solution Description: Alpha White Label Lead Generator
### Industry: Fin-Tech

This is **Part-2** of *Through the Looking Glass*, that contains working and deployable code and final software package for GCP BigQuery database deployed on GCP.

### Tech Stack
The Alpha White Label Lead Generation APIs utilizes the following technologies and frameworks:
- **GCP Cloud Spanner Database**: Cloud Spanner is a globally distributed relational database service designed for scalability and strong consistency. It offers horizontally scalable SQL-like queries and supports ACID transactions across regions and continents. Cloud Spanner provides high availability with automatic replication, and it is a good choice for globally distributed applications that require strong consistency and scalability. Visit [https://cloud.google.com/api-gateway](https://cloud.google.com/spanner/) to learn more.
- **Spanner Dialect - GoogleSQL/PostgreSQL**: Helps run code as FaaS in a serverless environment. You may [choose](https://cloud.google.com/spanner/docs/postgresql-interface#choose) either [GoogleSQL dialect](https://cloud.google.com/spanner/docs/reference/standard-sql/overview) or [PostgreSQL dialect](https://cloud.google.com/spanner/docs/reference/postgresql/overview). Watch [Get Started With Cloud Spanner](https://www.youtube.com/watch?v=rG3n3YHNZIQ) or [Developing on PostgreSQL for Cloud Spanner](https://www.youtube.com/watch?v=W7R6db_sa0M) to learn more.
- GitHub: A web-based platform for version control and collaboration that allows developers to host and review code, manage projects, and build software alongside millions of other developers.

### Requirement Specifications:
- [ ] Design Table called "Users" with following schema: 
  - USER_ID (UUID, AUTO_GENERATED) *The userid is a universally unique identifier: Visit https://www.uuidgenerator.net/ to learn more about uuid.*
  - First_Name (TEXT, REQUIRED)
  - Last_Name (TEXT, REQUIRED)
  - Email (EMAIL, REQUIRED)
  - Country_Code (TEXT, OPTIONAL)
  - Country_Name (TEXT, OPTIONAL)
  - Mobile_Number (TEXT, OPTIONAL)
  - Twitter_Handle (TEXT, REQUIRED if Is_OptIn_For_Updates field is TRUE)
  - Discord_Handle (TEXT, REQUIRED if Is_OptIn_For_Updates field is TRUE)
  - Is_OptIn_For_Updates (BOOLEAN, DEFAULT=FALSE)
  - Solana_Address (TEXT, REQUIRED)
- [ ] Deploy "Users" table to GCP Cloud Spanner Database with the Database Name "White_Label_Lead_Generator_Database" with appropriate compute capacity in US reagion.
- [ ] Publish relevant details of the deployed database that will allow GCP Serverless APIs to transact with the Database.

### Solution Constraints:
- Use Cloud Spanner Database and PostgreSQL approach ONLY.
- Performance: Response time, Resource Utilization, No Errors or Warnings.
- Security, Backup and Restore considerations.
- Data encryption at rest.

### Tools to use/avoid
  - use: PostgreSQL Interface
  - use: Terraform or GCP Deployment Manager to create Infrastructure as Code (IaC).
  - use: Best practices and Recommendations for Cloud Spanner from GCP.

### Test Cases
Use PostgreSQL Interface to test the following
| Test No | Test Name | Test Description | Test Data |  Test Steps | Expected Results |
| ----------- | ----------- |----------- | ----------- | ----------- | ----------- |
| 1 | Create User | Create User | Use sample data for user information  | Insert User record using relevant script. Visit https://cloud.google.com/spanner/docs/create-query-database-console to learn more.   | User record is inserted successfully. Execute SELECT query to retrieve the user information with Generated UserId |
| 2 | Update User | Update User | Use sample data for user information  | Update Existing User record using relevant script. Visit https://cloud.google.com/spanner/docs/create-query-database-console to learn more.   | User record is updated successfully. Execute SELECT query to retrieve the updated user information |

### Deliverables
- Infrastructure as Code (IaC): Cloud Spanner database schema and configuration for "White_Label_Lead_Generator_Database" using infrastructure as code tools like Terraform or Deployment Manager.
- Completed database scripts and IaC file(s) checked in to the repository under the folder *deliverables* within the *unique folder* that indicates your contribution. The *unique folder* is the *parent* folder for all deliverables.
- Deployment instructions for with supporting materials and assets in the *deployment guide* folder.
- Documentation & Video Demo under the folder *documentation* within the *unique folder*.
