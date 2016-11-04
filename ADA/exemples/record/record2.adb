                                       -- Chapter 12 - Program 2
with Ada.Text_IO;
use Ada.Text_IO;

procedure Record2 is

   type DATE is
      record
         Month : INTEGER range 1..12;
         Day   : INTEGER range 1..31;
         Year  : INTEGER range 1776..2010;
      end record;

   type PERSON is
      record
         Name      : STRING(1..15);
         Birth_Day : DATE;
         Age       : INTEGER;
         Sex       : CHARACTER;
      end record;

   Self, Mother, Father : PERSON;

   My_Birth_Year : INTEGER renames Self.Birth_Day.Year;

begin

   Self.Name := "John Q. Doe    ";
   Self.Age := 21;
   Self.Sex := 'M';
   Self.Birth_Day.Month := 10;
   Self.Birth_Day.Day := 18;
   Self.Birth_Day.Year := 1938;
   My_Birth_Year := 1938;        -- Identical to previous statement

   Mother := Self;
   Father.Birth_Day := Mother.Birth_Day;
   Father.Birth_Day.Month := Self.Birth_Day.Month - 4;
   Mother.Sex := 'F';

   if Mother /= Self then
      Put_Line("Mother is not equal to Self.");
   end if;

end Record2;




-- Result of execution

-- Mother is not equal to Self.

