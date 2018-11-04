script "allOffsets"
function allOffsets D,S,pCase,pWithOverlaps
   -- returns a comma-delimited list of the offsets of D in S
   set the caseSensitive to pCase is true
   put length(D) into dLength
   put numtochar(chartonum(char -1 of D) mod 2 + 1) after S
   if pWithOverlaps then
      repeat with i = 1 to dLength - 1 
         if not (char i + 1 to -1 of D is char 1 to dLength - i of D) then next repeat
         put char -i to -1 of D into OV[i]
         put i & cr after kList
      end repeat
   end if
   set the itemDel to D
   put 1 - dLength into C
   if pWithOverlaps then
      repeat for each item i in S
         repeat for each line K in kList
            if char 1 to K of (i & D) is OV[K] then put (C + K),"" after R
         end repeat
         add length(i) + dLength to C
         put C,"" after R
      end repeat
   else
      repeat for each item i in S
         add length(i) + dLength to C
         put C,"" after R
      end repeat
   end if
   set the itemDel to comma
   repeat until item 1 of R > 0
      delete item 1 of R
   end repeat
   delete item -1 of R
   if R is empty then return 0 else return char 1 to -2 of R
end allOffsets
