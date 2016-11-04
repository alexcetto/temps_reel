with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure entier1b is
  Index_1 	: INTEGER;
  Index_2	: INTEGER;
  Cat 		: INTEGER :=5;
  Dog		: INTEGER := -20;

begin
  Index_1 := Cat+3;
  Index_2 := Dog-1;

  Put("Index_1 ="); Put(Index_1, 2); New_Line;
  Put("Index_2 ="); Put(Index_2, 1); New_Line;

end entier1b;