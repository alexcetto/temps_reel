with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Proced2 is
   Counter : INTEGER;

   procedure Write_A_Header is
   begin
      Counter := 1;
   end Write_A_Header;

   procedure Write_And_Increment is
   begin
      Put(Counter, 2);
      Counter := Counter + 1;
   end Write_And_Increment;

begin
   Write_A_Header;
   for Index in 1..7 loop
      Write_And_Increment;
   end loop;
end Proced2;