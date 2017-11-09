#!/bin/bash


rm output_h1*.txt

#echo "Right Version" >> output_h1.txt
#head -n 3 ../output/output2.txt >> output_h1.txt
#
#echo "My Test Version" >> output_h1.txt
#head -n 3 output.txt  >> output_h1.txt
#
#vim output_h1.txt

#vimdiff output_t_h1.txt output_r_h1.txt

head -n 1 ../output/output2.txt >> output_h1_r.txt
head -n 1 output.txt  >> output_h1_t.txt
diff output_h1_r.txt output_h1_t.txt
