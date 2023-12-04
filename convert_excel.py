from pyodm import ODM
import glob
import os

# Assume all of the Excel files are in a top-level directory called 'Excel'
excel_path = './Excel/*.xlsx'
excel_files = glob.glob(excel_path)

# Convert all of the Excel files to CSV, where it is assumed the lab name
# follows the last underscore in the file name
for file in excel_files:
    lab = file.split('_')[-1].split('.')[0]
    print('Converting data for lab "{}"'.format(lab))
    odm = ODM(file)
    odm.filter_dates(start_date='2021-01-01', end_date='2023-03-31')
    odm.export_csvs(os.path.join('CSV', lab))
