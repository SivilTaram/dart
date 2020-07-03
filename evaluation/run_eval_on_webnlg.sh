#! /bin/bash
. vars
echo "team $TEAM"
echo "TEST_TARGETS_REF0 $TEST_TARGETS_REF0"
echo "OUTPUT_FILE $OUTPUT_FILE"
#################### Table 4 ##########################
#TEST_TARGETS_REF0=/home/lily/ch956/eval/test-webnlg-all-notdelex.lex
export $TEAM
# Assume /home/lily/xarutang/yale/dtt/results has correct input, delexicalization, and in the correct order

### train on WebNLG only ###
#OUTPUT_FILE=/home/lily/xarutang/yale/dtt/results/relexicalised_webnlg_only.txt
cp $OUTPUT_FILE ./webnlg-automatic-evaluation/submissions/$TEAM.txt
# BLEU all
#./multi-bleu.perl ${TEST_TARGETS_REF0} < ${OUTPUT_FILE} > bleu.txt
#tail -10 bleu.txt
source /home/lily/ch956/expenv/bin/activate
cd webnlg-automatic-evaluation/
python evaluation.py $TEAM
. bleu_eval_3ref.sh #TODO: replace team name inside(or write to a variable file for it to read?)
echo "ALL:"; cat eval/bleu3ref-$TEAM\_all-cat.txt 
# BLEU seen
echo "SEEN:";cat eval/bleu3ref-$TEAM\_old-cat.txt
# BLEU unseen
echo "UNSEEN:"; cat eval/bleu3ref-$TEAM\_new-cat.txt
cd ..
# METEOR all

#python prepare_files.py ${OUTPUT_FILE} ${TEST_TARGETS_REF0}

cd meteor-1.5/ 
../webnlg-automatic-evaluation/meteor_eval.sh #TODO:
#java -Xmx2G -jar meteor-1.5.jar ${OUTPUT_FILE} ../all-notdelex-refs-meteor.txt -l en -norm -r 8 > ../meteor.txt
#cd ..; tail -10 meteor.txt
cd ..
echo "ALL:"; cat webnlg-automatic-evaluation/eval/meteor-$TEAM-all-cat.txt | tail -10
# METEOR seen
echo "SEEN:"; cat webnlg-automatic-evaluation/eval/meteor-$TEAM-old-cat.txt | tail -10
# METEOR unseen
echo "UNSEEN:"; cat webnlg-automatic-evaluation/eval/meteor-$TEAM-new-cat.txt | tail -10

# TER all
cd tercom-0.7.25/
../webnlg-automatic-evaluation/ter_eval.sh #TODO:
#java -jar tercom.7.25.jar -h ../relexicalised_predictions-ter.txt -r ../all-notdelex-refs-ter.txt > ../ter.txt
#cd ../; tail -10 ter.txt
cd ..
echo "ALL:"; cat webnlg-automatic-evaluation/eval/ter3ref-$TEAM-all-cat.txt | tail -10
# TER seen
echo "SEEN:"; cat webnlg-automatic-evaluation/eval/ter3ref-$TEAM-old-cat.txt | tail -10
# TER unseen
echo "UNSEEN:"; cat webnlg-automatic-evaluation/eval/ter3ref-$TEAM-new-cat.txt | tail -10

### ablation exp1 ###
OUTPUT_FILE=/home/lily/xarutang/yale/dtt/results/relexicalised_exp1.txt
# BLEU all
./multi-bleu.perl ${TEST_TARGETS_REF0} < ${OUTPUT_FILE}
# BLEU seen
# BLEU unseen

# METEOR all
# METEOR seen
# METEOR unseen

# TER all
# TER seen
# TER unseen

### ablation exp2 ###
OUTPUT_FILE=/home/lily/xarutang/yale/dtt/results/relexicalised_exp2.txt
# BLEU all
./multi-bleu.perl ${TEST_TARGETS_REF0} < ${OUTPUT_FILE}
# BLEU seen
# BLEU unseen

# METEOR all
# METEOR seen
# METEOR unseen

# TER all
# TER seen
# TER unseen


### ablation exp3 ###
OUTPUT_FILE=/home/lily/xarutang/yale/dtt/results/relexicalised_exp3.txt
# BLEU all
# ./multi-bleu.perl ${TEST_TARGETS_REF0} < ${OUTPUT_FILE}
# BLEU seen
# BLEU unseen

# METEOR all
# METEOR seen
# METEOR unseen

# TER all
# TER seen
# TER unseen
