                                       -- Chapter 13 - Program 3
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Unchecked_Deallocation;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Access3 is

   type MY_RECORD is
      record
         Age     : INTEGER;
         Initial : CHARACTER;
         Sex     : CHARACTER;
      end record;

   type ACCESS_MY_DATA is access MY_RECORD;

   procedure Free is new
                Ada.Unchecked_Deallocation(MY_RECORD, ACCESS_MY_DATA);

   Myself  : ACCESS_MY_DATA;
   Friend  : ACCESS_MY_DATA := new MY_RECORD'(30, 'R', 'F');

   Result : BOOLEAN;

begin

   Myself := new MY_RECORD;

   Myself.Age := 34;
   Myself.Initial := 'D';
   Myself.Sex := 'M';

   Friend := new MY_RECORD'(31, 'R', 'F');

   Put("My age is");
   Put(Myself.Age, 3);
   Put(" and my initial is ");
   Put(Myself.Initial);
   New_Line;

   Friend.all := Myself.all;

   Result := Friend.all = Myself.all;    -- TRUE because of line 43
   Result := Friend = Myself;            -- FALSE because they point
                                         -- to different things.

   Free(Myself);
   Free(Friend);

end Access3;




-- Result of execution

-- My age is 34 and my initial is D

