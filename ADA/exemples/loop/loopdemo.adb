with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure LoopDemo is

   Index, Count : INTEGER;

begin
   Index := 1;
   loop                            -- This is the simplest loop
      Put("Index =");
      Put(Index, 5); New_Line;
      Index := Index + 1;
      exit when Index = 5;
   end loop;

   Index := 1;
   loop                            -- Another simplest loop
      Put("Index =");
      Put(Index, 5); New_Line;
      Index := Index + 1;
      if Index = 5 then exit; end if;
   end loop;

   Count := 1;
   while Count < 5 loop            -- This is the while loop
      Put("Count =");
      Put(Count, 5); New_Line;
      Count := Count + 1;
   end loop;

   for Index in 1..4 loop          -- This is the for loop
      Put("Doubled index =");
      Put(2 * Index, 5); New_Line;
   end loop;

   for Count in reverse 5..8 loop  -- This is the reverse for loop
      Put("Triple count =");
      Put(3 * Count, 5); New_Line;
   end loop;

   for Index in 7..11 loop         -- An empty loop
      null;
   end loop;

end LoopDemo;
