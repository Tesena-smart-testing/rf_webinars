import importlib
# pip install python-stdnum
class ValidaceRodnehoCislaCZSK:
    def __init__(self, lang='cz'):
        self.lang=lang
        self.rc=importlib.import_module('stdnum.'+lang+'.rc')

    def je_rodne_cislo(self, id):
        try:
            self.rc.validate(id)
        except  Exception as chyba:
            return  (False, chyba, id)  #chyba
        cislo_oriznute =  self.rc.compact(id)
        if  self.lang=='cz':
            datum_narozeni =  self.rc.get_birth_date(id)  #SK nepodporuje
            return (True, cislo_oriznute, datum_narozeni)
        else:
            return (True, cislo_oriznute, 'N/A') 

