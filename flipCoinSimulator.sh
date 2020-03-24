#!/bin/bash -x

declare -A SingletCoinDictionary
declare -A DoubletCoinDictionary
declare -A TripletCoinDictionary

#Store the singlet combination result
read -p "Enter how many times you want to flip a coin for singlet combination:" FlipCoin1

for((counter=1; counter<=FlipCoin1; counter++))

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
for output in  "${!SingletCoinDictionary[@]}"
do
	echo ""${outut}": "${SingletCoinDictionary[$output]}""
done

#To calculate percentage of singlet combination
headPercentage=`echo " scale = 4 ; (${SingletCoinDictionary[Head]}*100)/$FlipCoin1 " | bc -l`
tailPercentage=`echo " scale = 4 ; 100-$headPercentage" | bc -l`
echo "Percentage of heads :" $headPercentage
echo "Percentage of tails :" $tailPercentage

#Store the doublet combination result
read -p "Enter how many times you want to flip a coin for doublet combination:" FlipCoin2

for((counter=1; counter<=FlipCoin2; counter++))

do
	result=$((RANDOM%4))
	if [ $result -eq 0 ]
   then
      DoubletCoinDictionary[HeadHead]=$((${DoubletCoinDictionary[HeadHead]}+1))
   elif [ $result -eq 1 ]
	then
      DoubletCoinDictionary[HeadTail]=$((${DoubletCoinDictionary[HeadTail]}+1))
	elif [ $result -eq 2 ]
	then
      DoubletCoinDictionary[TailHead]=$((${DoubletCoinDictionary[TailHead]}+1))
	else
      DoubletCoinDictionary[TailTail]=$((${DoubletCoinDictionary[TailTail]}+1))
	fi
done

#To print doublet dictionary output
for output in "${!DoubletCoinDictionary[@]}"
do
   echo ""${outut}": "${DoubletCoinDictionary[$output]}""
done

#To calculate percentage of doublet combination
PercentageOfHeadHead=`echo " scale = 4 ; (${DoubletCoinDictionary[HeadHead]}*100)/$FlipCoin2" | bc -l`
echo "PercentageOfHeadHead::" $PercentageOfHeadHead
PercentageOfHeadTail=`echo " scale = 4 ; (${DoubletCoinDictionary[HeadTail]}*100)/$FlipCoin2" | bc -l`
echo "PercentageOfHeadTail::" $PercentageOfHeadTail
PercentageOfTailHead=`echo " scale = 4 ; (${DoubletCoinDictionary[TailHead]}*100)/$FlipCoin2" | bc -l`
echo "PercentageOfTailHead::" $PercentageOfTailHead
PercentageOfTailTail=`echo " scale = 4 ; (${DoubletCoinDictionary[TailTail]}*100)/$FlipCoin2" | bc -l`
echo "PercentageOfTailTail::" $PercentageOfTailTail

#Store the triplet combination result
read -p "Enter how many times you want to flip a coin for triplet combination:" FlipCoin3

for((counter=1; counter<=FlipCoin3; counter++))

do
   result=$((RANDOM%8))
   if [ $result -eq 0 ]
   then
      TripletCoinDictionary[HHH]=$((${TripletCoinDictionary[HHH]}+1))
   elif [ $result -eq 1 ]
   then
      TripletCoinDictionary[HHT]=$((${TripletCoinDictionary[HHT]}+1))
   elif [ $result -eq 2 ]
   then
      TripletCoinDictionary[HTH]=$((${TripletCoinDictionary[HTH]}+1))
	elif [ $result -eq 3 ]
   then
      TripletCoinDictionary[HTT]=$((${TripletCoinDictionary[HTT]}+1))
   elif [ $result -eq 4 ]
   then
      TripletCoinDictionary[TTH]=$((${TripletCoinDictionary[TTH]}+1))
   elif [ $result -eq 5 ]
   then
      TripletCoinDictionary[THT]=$((${TripletCoinDictionary[THT]}+1))
	elif [ $result -eq 6 ]
   then
      TripletCoinDictionary[TTH]=$((${TripletCoinDictionary[TTH]}+1))
   else
      TripletCoinDictionary[TTT]=$((${TripletCoinDictionary[TTT]}+1))
   fi
done

#To print triplet dictionary output
for output in "${!TripletCoinDictionary[@]}"
do
   echo ""${outut}": "${TripletCoinDictionary[$output]}""
done

#To print sorting and winning of singlet, doublet and triplet combination 
echo "Singlet combination sorting is:"
for totalNumber in "${!SingletCoinDictionary[@]}"
do
	echo "$totalNumber : ${SingletCoinDictionary["$totalNumber"]}"
done | sort -rn -k3
	echo "Singlet combination of winning::"
for totalNumber in "${!SingletCoinDictionary[@]}"
do
	echo "$totalNumber : ${SingletCoinDictionary["$totalNumber"]}"
done | sort -rn -k3 | head -1

echo "Doublet combination sorting is:"
for totalNumber in "${!DoubletCoinDictionary[@]}"
do
	echo "$totalNumber : ${DoubletCoinDictionary["$totalNumber"]}"
done | sort -rn -k3
	echo "Doublet combination of winning::"
for totalNumber in "${!DoubletCoinDictionary[@]}"
do
	echo "$totalNumber : ${DoubletCoinDictionary["$totalNumber"]}"
done | sort -rn -k3 | head -1

echo "Triplet combination sorting is:"
for totalNumber in "${!TripletCoinDictionary[@]}"
do
	echo "$totalNumber : ${TripletCoinDictionary["$totalNumber"]}"
done | sort -rn -k3
	echo "Triplet combination of winning::"
for totalNumber in "${!TripletCoinDictionary[@]}"
do
	echo "$totalNumber : ${TripletCoinDictionary["$totalNumber"]}"
done | sort -rn -k3 | head -1


