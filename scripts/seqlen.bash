#!/bin/bash
awk '/^>/ { if (seqlen) {
              print seqlen
              }
            print

            seqtotal+=seqlen
            seqlen=0
            seq+=1
            next
            }
    {
    seqlen += length($0)
    }     
    END{print seqlen
        print seq" sequences, total length " seqtotal+seqlen
    }' $1
