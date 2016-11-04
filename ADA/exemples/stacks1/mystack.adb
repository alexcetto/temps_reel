with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_text_IO; use Ada.Integer_text_IO;
with Stacks; use Stacks;

procedure mystack is
  My_Stack : Stack;
  Mydata : Integer;
begin 
  for I in Integer range 1..10 loop
    Push(My_Stack, I);
  end loop;
  for I in Integer range 1..My_Stack.Top loop
    Put (My_Stack.S(I));
    New_Line;
  end loop;
  
  for I in Integer range 1..10 loop
    Pop(My_Stack, Mydata);
    Put(Mydata);
    New_Line;
  end loop;
  
end mystack;
