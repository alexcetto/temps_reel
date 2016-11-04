with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure entier2 is
  Index_1 	: INTEGER;
  DOZEN 	: constant INTEGER := 12;
  type MY_INT_TYPE is range 0..10000;
  My_Int	: MY_INT_TYPE;
  package My_Int_IO is new Ada.Text_IO.Integer_IO(MY_INT_TYPE);
  use My_Int_IO;
  subtype SUB_INT is INTEGER RANGE 12..144;
  Thing 	: SUB_INT;

begin
  Thing := 6*3;
  Put("Thing = "); Put(Thing);New_Line;
  Index_1 := 12*DOZEN;
  Put("Index_1 = "); Put(Index_1);New_Line;
  My_Int := 1234;
  Put("My_Int = "); Put(My_Int); New_Line;
end entier2;