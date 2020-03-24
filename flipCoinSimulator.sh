#!/bin/bash -x

declare -A SingletCoinDictionary
headPercentage=0

#Store the singlet combination result
read -p "Enter how many times you want to flip a coin for singlet combination:" FlipCoin

for((counter=1; counter<=FlipCoin; counter++))

do
	result=$((RANDOM%2))
	if [ $result -eq 0 ]
	then
		SingletCoinDictionary[Head]=$((${SingletCoinDictionary[Head]}+1)) 
	else
		SingletCoinDictionary[Tail]=$((${SingletCoinDictionary[Tail]}+1)) 
	fi
done

#To print dictionary output
for output in "${!SingletCoinDictionary[@]}"
do
	echo ""${outut}": "${SingletCoinDictionary[$output]}""
done

#To calculate percentage of singlet combination
headPercentage=`echo " scale = 4 ; (${SingletCoinDictionary[Head]}*100)/$FlipCoin " | bc -l`
tailPercentage=`echo " scale = 4 ; 100-$headPercentage" | bc -l`
echo "Percentage of heads :" $headPercentage
echo "Percentage of tails :" $tailPercentage

