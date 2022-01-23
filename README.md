# causal-education

This code is what we used for our Constrained Based Causal discovery search on Student Achivements.
This was the final project of the course AI in Education for ETH Zürich. The project was done by Henry Valeyre and Javier Sanguino

The report of the project can also be seen in this repository. The data used has not been uploaded because the Data User 
Agreement signed to obtain the data, prohibited it.

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

Once the data was preprocessed, in the Causal_Study report the Causal_Study notebook can be found. The notebook does the following:

* Section 1 which is about Import and setup for the first part with Expectation/German and Mathematics Achievements
* Section 2 which is the PC algorithm with and without background knowledge applied to the Exepectation/German and Mathematics achievements data set
* Section 3 does additional preprocessing for final full dataset where 3 datasets were created for testing but only one is used
* Section 4 is the PC algorithm applied on the full dataset with and without background knowledge
* Section 5 is code that was not done by us but copy of the FCI class of the code from causal-learn python package in order to avoid errors during the use of the class
* Section 6 is the FCI algorithm applied to the full dataset with and without background knowledge

The following parametres were chosen for PC and FCI algorithms:

* Fisher’s Z conditional independence test
* alpha/p_value of 0.01

The following parameters are only for the PC algorithm:

* uc_sepset orientation of unshielded colliders
* priority to existing colliders in uc_priority collider conflict

## Results of Causal Study

Images showing results for the causal study (with and without background knowledge on PC for german, maths achievements, and full dataset, on FCI for full datasets) can be found in the Result_Images folder

