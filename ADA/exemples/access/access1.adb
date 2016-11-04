with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Access1 is

   type POINT_SOMEWHERE is access INTEGER;
   Index, Arrow, There : POINT_SOMEWHERE;

begin
   Index := new INTEGER;
   Index.all := 13;
   Put("The value is"); Put(Index.all, 6); New_Line;

   Arrow := new INTEGER;
   Arrow.all := Index.all + 16;
   There := Arrow;
   Put("The values are now"); Put(Index.all, 6); Put(Arrow.all, 6); 
   Put(There.all, 6); New_Line;

   There.all := 21;
   Put("The values are now"); Put(Index.all, 6); Put(Arrow.all, 6); 
   Put(There.all, 6); New_Line;

end Access1;
