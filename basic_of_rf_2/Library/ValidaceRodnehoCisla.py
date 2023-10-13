import stdnum.cz.rc as rc
# pip install python-stdnum

def je_rodne_cislo(id):
    try:
        rc.validate(id)
    except  Exception as chyba:
        return  (False, chyba)  #chyba
    datum_narozeni =  rc.get_birth_date(id)
    cislo_oriznute =  rc.compact(id)
    return (True, cislo_oriznute, datum_narozeni)
