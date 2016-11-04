with Ada.Text_IO, Ada.Integer_Text_IO; 
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure maTache1 is
   procedure maBoucle(Boucle : in INTEGER;  Nb : in INTEGER);
   procedure maBoucle(Boucle : in INTEGER;  Nb : in INTEGER) is
   begin
      for Index in 1..Nb loop
         Put("Dans la tache ");  Put(Boucle, 3);
         Put(" indice nb ");  Put(Index, 3);  New_Line;
      end loop;
   end maBoucle;

   task Tache_1;
   task body Tache_1 is
   begin
      maBoucle(1,7);
   end Tache_1;

  task Tache_2;
   task body Tache_2 is
   begin
    maBoucle(2, 5);
   end Tache_2;

begin
   Put_Line("Ceci est le programme principal.");
end maTache1;
