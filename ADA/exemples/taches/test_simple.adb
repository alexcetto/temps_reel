with Ada.Text_IO; use Ada.Text_Io;

procedure Test_Simple is
   task type Simple_Task is
      entry Start(Num : in Integer);
      entry Report(Num : out Integer);
   end Simple_Task;

   task body Simple_Task is
      Local_Num : Integer;
   begin
      accept Start(Num : in Integer) do
         Local_Num := Num;
      end Start;
      Local_Num := Local_Num * 2;
      accept Report(Num : out Integer) do
         Num := Local_Num;
      end Report;
   end Simple_Task;

   type Task_Pool is array(Positive range 1..10) of Simple_Task;
   My_Pool : Task_Pool;
   The_Value : Integer;
begin
   for num in My_Pool'Range loop
      My_Pool(num).Start(num);
   end loop;

   for num in My_Pool'Range loop
      My_Pool(num).Report(The_Value);
      Put_Line("Task" & Integer'Image(num) & " reports"
         & Integer'Image(The_Value));
   end loop;
end Test_Simple;

