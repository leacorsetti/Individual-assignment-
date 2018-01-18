#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Jan 11 14:19:07 2018

@author: leacaterinacorsetti
"""

# Import the JSON and CSV packages
import json
import csv

# Load in the conflict JSON data
with open('conflict_data_full_lined.json') as file:
    data = json.load(file)
    
values = []
for dictionaries in data:
#    print(type(dictionaries['type_of_violence']))
    if dictionaries['type_of_violence']== 2:
        values.append([dictionaries['id'], dictionaries['relid'], dictionaries['year'], 
        dictionaries['type_of_violence'], dictionaries['conflict_name'],
        dictionaries['side_a'], dictionaries['side_b'], dictionaries['latitude'],
        dictionaries['longitude'], dictionaries['region'],
        dictionaries['deaths_a'], dictionaries['deaths_b'], 
        dictionaries['deaths_civilians'], dictionaries['deaths_unknown']])
                  
    
with open('conflict_data_processed.csv', 'w', newline='') as cvsfile:
    csvwriter = csv.writer(cvsfile, delimiter=',', quotechar='"', quoting=csv.QUOTE_NONNUMERIC)
    csvwriter.writerow(['id', 'relid', 'year', 'type_of_violence', 'conflict_name', 
                        'side_a', 'side_b', 'latitude', 'longitude', 'region', 
                        'deaths_a', 'deaths_b', 'deaths_civilians', 'deaths_unknown'])
    csvwriter.writerows(values)
    

# Open the output CSV file we want to write to
#with open('preprocessed_data.csv', 'w', newline='') as file1:
#    csvwriter = csv.writer(file1, delimiter=',', quotechar='"', quoting=csv.QUOTE_NONNUMERIC)
    
#    csvwriter.writerow(['Country', 'Column A', 'Column B', 'Column C', 'etc.'])
    # Actually write the data to the CSV file here.
    # You can use the same csvwriter.writerow command to output the data 
    # as is used above to output the headers