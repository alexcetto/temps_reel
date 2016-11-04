
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

end Stacks;
