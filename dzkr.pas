Uses  GraphABC;
var (v,z,x1,y1):=(5,200,500,450);
Procedure levy(x,y,a,r:real;k:integer);
begin
if k>0 then 
begin
  r:=r*sin(pi/4);
  levy(x,y,a+pi/4,r,k-1);
  levy(x+r*cos(a+pi/4),y-r*sin(a+pi/4),a-pi/4,r,k-1);
end 
else
line(trunc(x),trunc(y),trunc(x+r*cos(a)),trunc(y-r*sin(a))); 
end; 

Procedure KeyDown(k: integer);
begin
 case K of
    VK_W: if v < 15 then v+=1;
    VK_A: if z < 1000 then z+=1;
    VK_S: if v > 2 then v-=1;
    VK_D: if z > 10 then z-=1;
    VK_Down: y1 -= 10;
    VK_Up: y1 += 10; 
    VK_Left: x1 += 10;  
    VK_Right: x1 -= 10;
   end;
 Window.Clear; 
 levy(x1-z,y1,x1+z,y1,v);
 Redraw;
end; 
Begin
     SetWindowCaption('Фрактал: Кривая Леви');
     SetWindowSize(800, 600);
     LockDrawing;
     KeyDown(0);
     OnkeyDown += KeyDown;
End.