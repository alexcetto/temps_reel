                                       -- Chapter 11 - Program 2
with Ada.Text_IO;
use Ada.Text_IO;

procedure String1 is

   My_char : CHARACTER;
   Another : CHARACTER := 'D';
   Line     : STRING(1..33);
   NAME     : constant STRING := ('J','o','h','n');
   JOB      : constant STRING := "Computer Programmer";
   Address  : STRING(1..13) := "Anywhere, USA";

begin

   My_char := 'A';
   Put(My_char); Put(Another); Put(My_char); New_Line;

   Line := "This is a test of STRINGS in Ada.";
   Put(Line);
   New_Line;
   Put(NAME);
   Put(" is a ");
   Put(JOB);
   Put(" and lives in ");
   Put(Address);Put("%");
   New_Line(2);

end String1;
