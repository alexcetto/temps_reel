with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;

procedure Overload is

   Int_Dat : INTEGER;
   Flt_Dat : FLOAT;


   function Raise_To_Power(Index : INTEGER) return INTEGER is
   begin
      Put("In the INTEGER function.   ");
      return Index * Index;
   end Raise_To_Power;



   function Raise_To_Power(Value : FLOAT) return FLOAT is
   begin
      Put("In the FLOAT function.   ");
      return Value * Value * Value;
   end Raise_To_Power;



   procedure Raise_To_Power(Index  : in     INTEGER;
                            Result :    out INTEGER) is
   begin
      Put("In the INTEGER procedure.   ");
      Result := Index * Index * Index;
   end Raise_To_Power;



   procedure Raise_To_Power(Value  : in     FLOAT;
                            Result :    out FLOAT) is
   begin
      Put("In the FLOAT procedure.   ");
      Result := Value * Value;
   end Raise_To_Power;

begin

   Int_Dat := Raise_To_Power(2);     -- uses INTEGER function
   Put(Int_Dat);New_Line;

   Flt_Dat := Raise_To_Power(3.2);   -- uses FLOAT function
   Put(Flt_Dat);New_Line;

   Raise_To_Power(3, Int_Dat);       -- uses INTEGER procedure
   Put(Int_Dat);New_Line;

   Raise_To_Power(2.73, Flt_Dat);    -- uses FLOAT procedure
   Put(Flt_Dat);New_Line;

   Int_Dat := 2;
                      -- In the following statement,
                      -- the function returns 2 squared, or 4
                      -- and the procedure cubes it to 64.
   Raise_To_Power(Raise_To_Power(Int_Dat), Int_Dat);
   Put("The result is ");
   Put(Int_Dat, 4);
   New_Line;

end Overload;



