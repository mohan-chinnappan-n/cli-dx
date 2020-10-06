import csv
import sys, getopt

def main(argv):
    inputfile = ''
    outputfile = ''
    msg = '''
               PSV to CSV converter 
               ------------------- 
               psv2csv.py -i <inputfile> -o <outputfile>
             ''' 
    try:
        opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
    except getopt.GetoptError:
      print (msg)
      sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print (msg)
            sys.exit()
        elif opt in ("-i", "--ifile"):
            inputfile = arg
        elif opt in ("-o", "--ofile"):
            outputfile = arg

    with open(inputfile) as fin, open(outputfile, 'w') as fout:
        reader = csv.DictReader(fin, delimiter='|')
        writer = csv.DictWriter(fout, reader.fieldnames)
        writer.writeheader()
        writer.writerows(reader)


if __name__ == "__main__":
   main(sys.argv[1:])


