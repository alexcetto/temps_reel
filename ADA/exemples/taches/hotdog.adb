with Ada.Text_IO; use Ada.Text_IO;

procedure HotDog is
   task Chief is
      entry Make_A_Hot_Dog;
   end Chief;

   task body Chief is
   begin
      Put_Line("Chief  : I am ready to make a hot dog for you");
      accept Make_A_Hot_Dog do
         delay 0.8;
         Put_Line("Chief  : I put hot dog in bun and add mustard");
      end Make_A_Hot_Dog;
   end Chief;

begin
   Put_Line("Patron : I am hungry");
   Chief.Make_A_Hot_Dog;
   delay 0.1;
   Put_Line("Patron : I eat the resulting hot dog"); New_Line;
end HotDog;
