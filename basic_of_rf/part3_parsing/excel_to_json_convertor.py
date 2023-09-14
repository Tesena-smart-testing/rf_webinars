import pandas as pd
import json
from datetime import datetime



def excel_to_json_convertor(excel_file_path, sheet_name="Hárok1", output_file_path="part3_parsing/output_json/output_data.json"):
    # Read the Excel file
    excel_data_df = pd.read_excel(excel_file_path, sheet_name=sheet_name)

    # Convert the Excel data to a list of dictionaries
    data = excel_data_df.to_dict(orient='records')

    # Convert datetime objects to strings
    for item in data:
        for key, value in item.items():
            if isinstance(value, datetime):
                item[key] = value.strftime('%d/%m/%Y')

    # Write the JSON to a file
    with open(output_file_path, "w") as outfile:
        json.dump(data, outfile)
    return data



# excel_to_json_convertor(path)

