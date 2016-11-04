procedure Scope2 is
   Count, Index : INTEGER;
   procedure Level1 is
      Index, Count : INTEGER;
      procedure Level2 is
         Count : INTEGER;
      begin
         Count := Scope2.Count;
      end Level2;
      procedure Level2_Prime is
         Data, Index, Count : INTEGER;
         Outer_Index : INTEGER renames Scope2.Level1.Index;
      begin
         Count := Index  + Scope2.Level1.Count;
         Index :=   Scope2.Level1.Index +  Scope2.Index; 
         Index :=  Outer_Index +Scope2.Index; 
      end Level2_Prime;
   begin
      null;
   end Level1;
   procedure Other_Level1 is
   begin
      Count := Index;  
   end Other_Level1;
begin
   Count := Index; 
end Scope2;
