Files
===

            Ray Tracer from nsl.com
Kray.k      K version
Nray.k      Kona version
            To verify that the results are the same:
            1) Run the Kray.k script with k and save the result to a text file
               rlwrap k ~/nsl/Kray
               "resK.txt" 0: R[3]32
            2) Run the Nray.k script with Kona and save result to a text file
               rlwrap k ~/nsl/Nray
               "resN.txt" 0: R[3]32
            3) check for differences
               diff ~/k/resK.txt ~/kona/resN.txt


bwt.k       Burrows Wheeler Transform
            This script is from Scott Vokes.
            There is only 1 version as it works in both K and in Kona.

