import json


class jsonLibrary(object):
    '''Documentation for jsonLibrary.

        It is used for reading from CSV (comma-separated values) files
        which is used for storing tabular data (numbers and text) in plain text
    '''

    def pretty_print_json(self, input_json, indent=4):
        '''
        This creates a keyword named "pretty print json". This keyword takes one argument, which is a json string. It prints to output log (pretty format)
        '''
        parsed = json.loads(input_json)
        print(json.dumps(parsed, ensure_ascii=False, indent=indent, sort_keys=False))       
        return parsed
