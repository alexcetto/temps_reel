package Stacks is
  type Stack is limited private;
  procedure Push(S: in out Stack; X: in Integer);
  procedure Pop (S: in out Stack; X: out Integer);
  procedure Print_Stack (S: in out Stack);
  function "=" (S,T: Stack) return Boolean;
private
  Max : constant := 100;
  type Integer_Vector is array (integer range <>) of Integer;
  type Stack is
    record
      S: Integer_Vector(1..Max);
      Top : Integer range 0..Max :=0;
    end record;
  
end Stacks;
