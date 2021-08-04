# canadian_covid_sequencing

Data Source
-----------
The data for this project is compiled from multiple sources:
- sequencing number reports collected by the National Microbiology Laboratory of Canada
- variant of concern (VOC) data collected from the [CTV news website](https://www.ctvnews.ca/health/coronavirus/tracking-variants-of-the-novel-coronavirus-in-canada-1.5296141) (CTV news attends press conferences for regional public health authorities and extracts numbers from briefings released by these authorities)
- case number data downloaded from the [Government of Canada Infobase](https://health-infobase.canada.ca/) 


Motivation
----------
The lack of open data sharing in Canada is a known issue (both on a provincial and national scale). The COVID-19 pandemic has brought this problem into the spotlight as qualified researchers are unable to access they data they need to perform their work. By bringing together basic data from multiple sources (that is otherwise unaccessible in a single location), normalizing it and making it publicly accessible, I am attempting to contribute to open data sharing in my country.

**The following data are available on a weekly basis for each region of Canada:** 
- cumulative number of cases attributed to each VOC (alpha, beta, gamma, delta)
- cumulative number of sequences generated that pass local QC standards
- cumulative number of sequences generated that fail local QC standards
- cumulative number of sequences uploaded to [GISIAD](https://www.gisaid.org/)
- cumulative number of sequences uploaded to the [VirusSeq Data Portal](https://virusseq-dataportal.ca/)
- number of cases
 
The database is housed on [AWS RDS](https://aws.amazon.com/rds/postgresql/). 

Updating the database is not currently automated, as the data sources include excel spreadsheets with comments and webpages with changing formats. However, I am working toward this goal.

Required Libraries
------------------
- you don't need any libraries installed to access the data in the database, but you will need a postgres client such as [pgAdmin](http://www.pgadmin.org/)
- Instructions for connecting to the database can be found [here](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ConnectToPostgreSQLInstance.html)

Login Information
-----------------
**Username:** read_only
**Password:** ZjQXhW9Vdjr4t5
**Host:** sequence-data.cygoeoaa27gf.us-east-2.rds.amazonaws.com
**Port:** 5432

Database Schema
---------------
![database schema](/schema.png)

