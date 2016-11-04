-- Temperature degree -> farenheit
-- Alexandre Lagrange-Cetto - 4/11/2016
-- Farenheit = 32 + Centigrade*9/5 

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Temperature is
	--subtype SUB_INT is INTEGER range -20..120;
	Celsius : INTEGER;
	Farenheit : INTEGER;

begin
	Celsius := -20;
	Farenheit := (Celsius *9/5) + 32;

	loop
		Put("Farenheit =");
		Put(Farenheit, 3); 
		Put(" is equivalent to Celsius =");
		Put(Celsius, 3); 
		if Celsius = 0 then
			Put(" Frozen water");
		end if;
		if Celsius = 100 then
			Put(" Boiling water");
		end if;
		New_Line;
		Celsius := Celsius + 10;
		Farenheit := (Celsius *9/5) + 32;
		exit when Celsius > 120;
	end loop;

end Temperature;