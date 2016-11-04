with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure entier4 is
  subtype SUB_INT is INTEGER range 12..144;
  Thing 	: SUB_INT;

begin
  Thing := 6*3;
  Put("Thing = "); Put(Thing);New_Line;
  Put("plus petite valeur de SUB_INT : "); Put(SUB_INT'FIRST);New_Line;
  Put("plus grande valeur de SUB_INT : "); Put(SUB_INT'LAST);New_Line;
end entier4;