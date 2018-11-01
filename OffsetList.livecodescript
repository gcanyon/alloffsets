script "OffsetList"
function offsetList D,S,pCase
   -- returns a comma-delimited list of the offsets of D in S
   set the caseSensitive to pCase is true
   set the itemDel to D
   put length(D) into dLength
   put 1 - dLength into C
   repeat for each item i in S
      add length(i) + dLength to C
      put C,"" after R
   end repeat
   set the itemDel to comma
   if char -dLength to -1 of S is D then return char 1 to -2 of R 
   put length(C) + 1 into lenC
   put length(R) into lenR
   if lenC = lenR then return 0
   return char 1 to lenR - lenC - 1 of R
end offsetList