import sys, glob, os

paths = []

with open(sys.argv[1],'r') as src_file:
  for arg in src_file:
    for result in glob.glob(arg.strip()):
      print(f"{os.getcwd()}/{result}")


