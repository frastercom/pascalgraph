uses graphabc;
const max=10;
      speed = 10;
      maxLife = 3; //максимальное количество жизней

var x,y,x1,y1,x2,y2:integer;
    f:boolean;
    a:array[1..max,1..4] of integer;//new coment
    active:integer;
    life:integer;//количество жизней
    
procedure lifePicture(x: integer; y: integer; b: boolean);
begin
  if b then
  begin
    //если жизнь активна
    setbrushcolor(clRed);
    circle(x,y,10);
    setbrushcolor(clWhite);
  end
  else
  begin
    //если не активна
    setbrushcolor(clWhite);
    circle(x,y,10);
  end;
end;
    
procedure popodanie(x: integer; y:integer);
begin
  if (x1>x) and (x<x2) then
    if (y1>y) and (y<y2) then 
      life:=life-1;
end;
    
procedure isDead();
begin
  if life <= 0 then
    f:=false;
end;
    
procedure picture(x:integer; y:integer);//отображение снаряда
begin
  circle(x,y,10);
  FloodFill(x,y,clBlack);
  popodanie(x,y);
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

procedure sharic1;
begin
  setbrushcolor(clBrown);
  x1:=x;
  x2:=x+50;
  y1:=y;
  y2:=y+20+100+50;
  circle(x,y,20);
  line(x,y+20,x,y+20+100);
  line(x,y+20+10,x-50,y+20+50);
  line(x,y+20+10,x+50,y+20+50);
  line(x,y+20+100,x-50,y+20+100+50);
  line(x,y+20+100,x+50,y+20+100+50);
end;

procedure sharic;
begin
  setbrushcolor(clBrown);
  Line(x,y,x+50,y); //x = 350 y = 50
  Line(x,y,x-50,y+60);
  Line(x+50,y,x-20,y+100);
  Line(x-20,y+100,x-150,y+100);
  Line(x-50,y+60,x-150,y+60);
  Line(x-150,y+60,x-240,y+60);
  Line(x-150,y+100,x-240,y+100);
  Line(x-240,y+80,x-260,y+80);
  Line(x-240,y+100,x-260,y+80);
  Line(x-150,y+80,x-70,y+150);
  Line(x-120,y+150,x-80,y+150);
  Line(x-80,y+150,x-110,y+80);
end;
 
begin
  f:=true;
  life:=maxLife;
  x:=windowwidth div 2;
  y:=windowheight div 2;
  lockdrawing; //убираем мерцание 
  repeat
    clearwindow;
    onkeydown:=klavisha;
    sharic1;
    arr();
    sleep(1);
    isDead();
    redraw; //убираем мерцание
  until not f;
  writeln('end');
end.
