import pandas as pd
import sys, getopt

def main(argv):
    msg = '''
               Join 2 CSV files (inner, left, right, outer)  
               ------------------- 
               joincsv.py -f <firstFile> -s <secondFile> -d <fieldDelimiter)  -j <joinType -o <on> -r <outputFile>

               python3 joincsv.py -f f1.csv -s f2.csv  -j inner -d '|' -o 'key' -r result.psv 
             ''' 
    try:
        opts, args = getopt.getopt(argv, shortopts="hf:s:d:j:o:r:", longopts=["ffile=","sfile=", "fdelim=", "jointype=",  "on=", "result="])
    except getopt.GetoptError:
      print (msg)
      sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print (msg)
            sys.exit()
        elif opt in ("-f", "--ffile"):
            ffile = arg
        elif opt in ("-s", "--sfile"):
            sfile = arg
        elif opt in ("-j", "--jointype"):
            jointype = arg
        elif opt in ("-d", "--fdelim"):
            fdelim = arg
        elif opt in ("-o", "--on"):
            on = arg
        elif opt in ("-r", "--result"):
            result = arg
        else:
            assert False, "unhandled option"


    fdata = pd.read_csv(ffile, delimiter=fdelim)
    sdata = pd.read_csv(sfile, delimiter=fdelim)

    output = pd.merge(fdata, sdata, on=on, how=jointype)
    outputData = output.to_csv(result, sep=fdelim, index=False)

    print(outputData)




if __name__ == "__main__":
   main(sys.argv[1:])
