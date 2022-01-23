# causal-education

This code is what we used for our Constrained Based Causal discovery search on Student Achivements.
This was the final project of the course AI in Education for ETH Zürich. The project was done by Henry Valeyre and Javier Sanguino

The report of the project is can be also found in this repository. The data used has not been uploaded because the Data User 
Agreement signed to obtain the data prohibited it.

To conduct the study we preprocessed the data 

## Preprocessing

It can be found in the "preprocessing" folder.

The file achivements_expectations_query.sql returns the csv file used for the achivements based on expectations study

All the other files are for the part of the project where general variables were linked to educational achivements.

* achivement_generalVariables_queries.sql exported all the raw data from the selected tables to a csv.
* database_to_one_id.py changed the table format as explained in the section 4.2.2 of the report (one row for each id in the table and all waves) 
* preprocessing.py did the actual preprocessing: imput the missing data, reverse it if needed, scale and merged it in categories.

More details can be found in the comments of the files. 

## Causal study

