package Stacks is
  
  Max : constant := 100;
  type Integer_Vector is array (integer range <>) of Integer;
  type Stack is
    record
      S: Integer_Vector(1..Max);
      Top : Integer range 0..Max :=0;
    end record;
  procedure Push(S: in out Stack; X: in Integer);
  procedure Pop (S: in out Stack; X: out Integer);
  
end Stacks;
