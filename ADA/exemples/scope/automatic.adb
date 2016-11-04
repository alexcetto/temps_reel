with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Automatic is
   foo : INTEGER;
begin
   for Index in 1..10 loop
      Put("The value of Index is");
      Put(Index, 3);
      Mon_bloc :
      declare
         START : INTEGER := Index;
         STOP  : INTEGER := START + 5;
         Count_Stuff : INTEGER;
      begin
         Count_Stuff := START + STOP + Index + 222;
         Put(" --->");
         for Index in START..STOP loop
            Put(Index, 5);
         end loop;
         Put(Count_Stuff, 10);
      end Mon_bloc;
      New_Line;
   end loop;
end Automatic;
