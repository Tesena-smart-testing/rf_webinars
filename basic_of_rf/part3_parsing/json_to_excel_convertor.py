
import pandas as pd

json_file = 'output_data.json'
output_file = 'part3_parsing/output_excel/output_excel.xlsx'  

def json_to_excel_convertor(json_file_path, output_file_path):
    pd.read_json(json_file_path).to_excel(output_file_path, engine='openpyxl')  # Specify the writer engine as 'openpyxl'

# json_to_excel_convertor(json_file, output_file)
