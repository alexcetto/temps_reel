with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_text_IO; use Ada.Integer_text_IO;
with Stacks; use Stacks;

procedure mystack is
  My_Stack : Stack;
  Your_Stack : Stack;
  Mydata : Integer;
begin 
  for I in Integer range 1..10 loop
    Push(My_Stack, I);
  end loop;
  Print_Stack(My_Stack);
  
  for I in Integer range 2..11 loop
    Push(Your_Stack, I);
  end loop;
  Print_Stack(Your_Stack);
  
  if (My_Stack = Your_Stack) then
    Put("My_Stack = Your_Stack");
  else
    Put("My_Stack /= Your_Stack");
  end if;
  New_Line;

  for I in Integer range 1..10 loop
    Pop(My_Stack, Mydata);
    Put(Mydata);
    New_Line;
  end loop;
  
end mystack;
