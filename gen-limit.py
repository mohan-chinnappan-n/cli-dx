with open('limits.cls.txt', 'r') as reader:
    for line in reader.readlines():
        tline = line.strip()
        print ("Integer my{} = Limits.{}(); System.debug('{}: ' + my{} ); ".format(tline, tline, tline, tline));
