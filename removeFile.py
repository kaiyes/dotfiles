#!/usr/bin/python
import os
import glob
import fnmatch

# get a recursive list of file paths that matches pattern including sub directories
fileList = glob.glob('/Users/x/Desktop/course/AWS/*.vtt')

# Iterate over the list of filepaths & remove each file.
for rootDir, subdirs, filenames in os.walk('/Users/x/Desktop/course/AWS/'):
    # Find the files that matches the given patterm
    for filename in fnmatch.filter(filenames, '*.vtt'):
        try:
            print(filename)
            os.remove(os.path.join(rootDir, filename))
        except OSError:
            print("Error while deleting file")
