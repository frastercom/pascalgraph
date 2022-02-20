uses graphabc;
var x,y:integer;
    f:boolean;
procedure klavisha(key:integer);
begin
  case key of
    VK_Up:if y>30 then y:=y-10;
    VK_Down:if y<windowheight-30 then y:=y+10;
    VK_Left:if x>30 then x:=x-10;
    Vk_Right:if x<windowwidth-30 then x:=x+10;
    Vk_Escape:begin
              CloseWindow;
              f:=false;
              end;
  end;
end;

procedure sharic;
begin
  setbrushcolor(clBrown);
  circle(x,y,20);
end;
 
begin
  f:=true;
  x:=windowwidth div 2;
  y:=windowheight div 2;
  repeat
    clearwindow;
    onkeydown:=klavisha;
    sharic;
  until not f;
end.
