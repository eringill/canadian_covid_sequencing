# Helper functions for loading sequence_data database

#function to map province names to region table primary keys
from pandas.core.frame import DataFrame
import pandas as pd



def map_prov_names(df, col):
    '''
    input: 
    df - dataframe containing names of provinces in one column
    col - name of column containing province names
    
    output:
    datframe where same column contains primary key integers of region table
    instead of province names
    '''

    df.replace({col:{'Alberta': 1, 'British Columbia': 2, 'Manitoba': 3, 'New Brunswick': 4,
            'Newfoundland and Labrador': 5, 'Northwest Territories': 6, 'Nova Scotia': 7, 'Nunavut': 8,
            'Ontario': 9, 'Prince Edward Island': 10, 'Quebec': 11, 'Saskatchewan': 12, 'Yukon': 13, 
            'Canada': 14}}, inplace = True)
    return df

#function to map voc names to voc table primary keys
def map_voc_names(df, col):
    '''
    input:
    df - dataframe containing names of vocs in one column (international designation)
    col - name of column containing voc names
    
    output:
    dataframe where same column contains primary key integers of voc table 
    instead of voc names
    '''

    df.replace({col:{'alpha': 1, 'beta': 2, 'gamma': 3, 'delta': 4}}, inplace = True)
    return df 


