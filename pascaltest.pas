uses graphabc;
const max=10;
speed = 10;

var x,y:integer;
    f:boolean;
    a:array[1..max,1..4] of integer;//new coment
    active:integer;
    
procedure picture(x:integer; y:integer);//отображение снаряда
begin
  circle(x,y,10);
  FloodFill(x,y,clBlack);
end;

procedure arr();
var variant:integer;
begin
  variant := 100;
  if active < max then
  begin
    variant := random(100);
    if variant<10 then
      for var i:=1 to max do
        if a[i,1]=0 then
        begin
          a[i,1]:=1;
          a[i,2]:=WindowWidth+10;
          a[i,3]:=random(WindowHeight);
          a[i,4]:=random(speed)+1;
          active:=active+1;
          break;
        end;
  end;
  for var i:=1 to max do
  begin
    if a[i,1]=1 then
    begin
      picture(a[i,2],a[i,3]);
      a[i,2]:=a[i,2]-a[i,4];
      if (a[i,2]<1) then
      begin
        a[i,1]:=0;
        active:=active-1;
      end;
    end;
  end;
end;
    
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
    arr();
    sleep(1);
    redraw; //убираем мерцание
  until not f;
end.
