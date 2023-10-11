import datetime
import prettyjsonprinter

def je_datum(date_string):
    try:
        datetime.datetime.strptime(date_string, format)
        return(True,"It is a date")
        print("This is the correct date string format.")
    except ValueError:
        print("This is the incorrect date string format. It should be YYYY-MM-DD")
        return(False,"It is not a date")
    
def je_prestupny(date_string, format):
    print("Hello")
    return(True, "je prestupny")