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
  line(x,y+20,x,y+20+100);
  line(x,y+20+10,x-50,y+20+50);
  line(x,y+20+10,x+50,y+20+50);
  line(x,y+20+100,x-50,y+20+100+50);
  line(x,y+20+100,x+50,y+20+100+50);
end;

procedure sharic1;
begin
  setbrushcolor(clBrown);
  circle(x,y,20);
  line(x,y+20,x,y+20+100);
  line(x,y+20+10,x-50,y+20+50);
  line(x,y+20+10,x+50,y+20+50);
  line(x,y+20+100,x-50,y+20+100+50);
  line(x,y+20+100,x+0,y+20+100+50);
end;
 
begin
  f:=true;
  x:=windowwidth div 2;
  y:=windowheight div 2;
  lockdrawing; //убираем мерцание 
  repeat
    clearwindow;
    onkeydown:=klavisha;
    sharic1;
    redraw; //убираем мерцание
  until not f;
end.
