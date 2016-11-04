                                       -- Chapter 14 - Program 4
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure CharIn is

   My_File  : FILE_TYPE;
   One_Char : CHARACTER;

begin

   open(My_File, In_File, "TEST.TXT");

   loop       -- Read one character at a time and display it
      exit when End_Of_File(My_File);
      Get(My_File, One_Char);
      Put(One_Char);
   end loop;
   New_Line(2);

   Reset(My_File);  -- Reset and start over with the same file

   loop       -- Read and display but search for End of lines
      exit when End_Of_File(My_File);
      Get(My_File, One_Char);
      if End_Of_Line(My_File) then
         Put("<--- End of line found");
         New_Line;
      else
         Put(One_Char);
      end if;
   end loop;
   New_Line;

   Reset(My_File);  -- Reset and start over the third time

              -- Read and display but search for End of lines
   loop       -- using a look ahead method
      exit when End_Of_File(My_File);
      Get(My_File, One_Char);
      Put(One_Char);
      if End_Of_Line(My_File) then
         Put("<--- End of line found");
         New_Line;
      end if;
   end loop;

   Close(My_File);

end CharIn;




-- Result of execution

-- (Note; the first line is a full 80 columns wide.)
-- This line goes to the CHARACTS.TXT file.This line goes to...
-- This line goes to the CHARACTS.TXT file.
--
-- This line goes to the CHARACTS.TXT file<--- End of line found
-- This line goes to the CHARACTS.TXT file<--- End of line found
-- This line goes to the CHARACTS.TXT file<--- End of line found
--
-- This line goes to the CHARACTS.TXT file.<--- End of line found
-- This line goes to the CHARACTS.TXT file.<--- End of line found
-- This line goes to the CHARACTS.TXT file.<--- End of line found

