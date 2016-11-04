with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
  
procedure Funct is
  
   Twelve : INTEGER := 12;
   function Square(Val : INTEGER) return INTEGER;
   function Square(Val : INTEGER) return INTEGER is
   begin
      return Val * Val;
   end Square;  
  
begin
   Put("The square of 12 is");
   Put(Square(Twelve), 4);
   New_line;
end Funct;