with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_text_IO; use Ada.Integer_text_IO;
package body Stacks is
  procedure Push(S: in out Stack; X: in Integer) is
  begin
    S.Top := S.Top+1;
    S.S(S.Top) := X;
  end Push;

  procedure Pop(S: in out Stack; X: out Integer) is
  begin
    X:= S.S(S.Top);
    S.Top := S.Top-1;
  end Pop;

  procedure Print_Stack(S: in out Stack) is
  begin
    for I in Integer range 1..S.Top loop
      Put (S.S(I)); New_line;
    end loop;
  end Print_Stack;

  function "=" (S,T : Stack) return Boolean is
  begin 
    if S.Top /= T.Top then
      return False;
    end if;
    for I in 1..S.Top loop
      if S.S(I) /= T.S(I) then
	return False;
      end if;
    end loop;
    return True;
  end "=";

end Stacks;
