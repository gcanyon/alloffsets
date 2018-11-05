script "allOffsets"
function allOffsets D,S,pCase,pNoOverlaps
   -- returns a comma-delimited list of the offsets of D in S
   set the caseSensitive to pCase is true
   put length(D) into dLength
   put pNoOverlaps and dLength > 1 into pNoOverlaps
   put numtochar(chartonum(char -1 of D) mod 2 + 1) after S
   if not pNoOverlaps then
      repeat with i = 1 to dLength - 1 
         if not (char i + 1 to -1 of D is char 1 to dLength - i of D) then next repeat
         put char -i to -1 of D into OV[i]
         put i & cr after kList
      end repeat
   end if
   set the itemDel to D
   put 1 - dLength into C
   if pNoOverlaps or kList is empty then
      repeat for each item i in S
         add length(i) + dLength to C
         put C,"" after R
      end repeat
   else
      repeat for each item i in S
         repeat for each line K in kList
            if i & D begins with OV[K] then put (C + K),"" after R
         end repeat
         add length(i) + dLength to C
         put C,"" after R
      end repeat
      set the itemDel to comma
      repeat with i = 1 to dLength
         if item i of R > 0 then exit repeat
      end repeat
      delete item 1 to i - 1 of R
   end if
   if R begins with C then return 0 
   return char 1 to -3 - length(C) of R
end allOffsets