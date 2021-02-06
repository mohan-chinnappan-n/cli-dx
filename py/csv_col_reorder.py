### csv_col_reorder.py
# Reorders a given CSV with the requested columns

# Example usage:
# python csv_col_reorder.py in.csv cols.txt out.csv

# - mohan chinnappan


import csv
import argparse

parser = argparse.ArgumentParser(description='Reorder columns in the given CSV file')
parser.add_argument('infile', metavar='i', type=str, help='Input CSV File')
parser.add_argument('colsfile', metavar='c', type=str, help='File with the columns needed')
parser.add_argument('outfile', metavar='o', type=str, help='Output CSV File')

# read args
args = parser.parse_args()
inputFile = args.infile
colsFile = args.colsfile
outFile = args.outfile

# let us read the cols needed info
with open(colsFile, 'r') as cf:
    colData = cf.read().strip() 
    fieldnames =  colData.split(",")
with open(inputFile, 'r') as infile, open(outFile, 'w') as outfile:
    writer = csv.DictWriter(outfile, fieldnames=fieldnames)
    writer.writeheader()
    for row in csv.DictReader(infile):
        writer.writerow(row)
