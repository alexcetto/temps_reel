with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
  
procedure Proced3 is
  
   Dogs, Cats, Animals : INTEGER;
   procedure Total_Number_Of_Animals(Variety1 : in     INTEGER;
                                     Variety2 : in     INTEGER;
                                     Total    :    out INTEGER);
  
   procedure Total_Number_Of_Animals(Variety1 : in     INTEGER;
                                     Variety2 : in     INTEGER;
                                     Total    :    out INTEGER) is
   begin
      Total := Variety1 + Variety2;
   end Total_Number_Of_Animals;
  
begin
   Dogs := 3;
   Cats := 4;
   Total_Number_Of_Animals(Dogs, Cats, Animals);
   Put("The total number of animals is");
   Put(Animals, 3);
   New_Line;
end Proced3;