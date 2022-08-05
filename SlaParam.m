%スラロームパラメータ調整

target_v = 300; %探索速度 mm/s
tread = 37.8;
T = 0.001; %制御周期
%切り替え角度
angle1 = 30*pi/180;
angle2 = 60*pi/180;
angle3 = 90*pi/180;

pre = 5;
fol = 10;
%Tをカウントしていき、目標値を随時更新して目標軌道を描く
%結果、どの時刻でどの位置にどの角度、角速度でいるべきかを表す

alpha = 0.0;
alalpha = 0.00308185;
angv = 0;
x = 45;
y = 0;
angle = 0;

xl = x - tread/2;
xr = x + tread/2;
yl = y;
yr = y;

lv = target_v;
rv = lv;

plot([x x],[y y+pre]);
hold on
grid on
plot([xr xr],[yr y+pre]);
plot([xl xl],[yl y+pre]);
y = y + pre;
yr=yr+pre;
yl=yl+pre;

%plot([0 100*sin(x*pi/180)],[0 100*cos(x*pi/180)]);
while angle < angle1
    alpha = alpha + alalpha;
    angv = angv+alpha; %rad/ms
    angle = angle + angv*T;
    plot([x x+(target_v*T)*sin(angle)],[y y+(target_v*T)*cos(angle)]);
    x = x + (target_v*T)*sin(angle);
    y = y + (target_v*T)*cos(angle);

%左右の車輪

    plot([xr x+(tread*0.5*cos(angle))],[yr y-(tread*0.5*sin(angle))]);
    plot([xl x-(tread*0.5*cos(angle))],[yl y+(tread*0.5*sin(angle))]);
    xr = x + (tread*0.5*cos(angle));
    yr = y - (tread*0.5*sin(angle));
    xl = x - (tread*0.5*cos(angle));
    yl = y + (tread*0.5*sin(angle));
end
while angle < angle2
    %alpha = alpha + alalpha;
    %angv = angv; %rad/ms
    angle = angle + angv*T;
    plot([x x+(target_v*T)*sin(angle)],[y y+(target_v*T)*cos(angle)]);
    x = x + (target_v*T)*sin(angle);
    y = y + (target_v*T)*cos(angle);

    plot([xr x+(tread*0.5*cos(angle))],[yr y-(tread*0.5*sin(angle))]);
    plot([xl x-(tread*0.5*cos(angle))],[yl y+(tread*0.5*sin(angle))]);
    xr = x + (tread*0.5*cos(angle));
    yr = y - (tread*0.5*sin(angle));
    xl = x - (tread*0.5*cos(angle));
    yl = y + (tread*0.5*sin(angle));
end
while angle < angle3
    alpha = alpha - alalpha;
    angv = angv - alpha; %rad/ms
    angle = angle + angv*T;
    plot([x x+(target_v*T)*sin(angle)],[y y+(target_v*T)*cos(angle)]);
    x = x + (target_v*T)*sin(angle);
    y = y + (target_v*T)*cos(angle);

    plot([xr x+(tread*0.5*cos(angle))],[yr y-(tread*0.5*sin(angle))]);
    plot([xl x-(tread*0.5*cos(angle))],[yl y+(tread*0.5*sin(angle))]);
    xr = x + (tread*0.5*cos(angle));
    yr = y - (tread*0.5*sin(angle));
    xl = x - (tread*0.5*cos(angle));
    yl = y + (tread*0.5*sin(angle));
end
plot([x x+fol],[y y]);
plot([xl xl+fol],[yl yl]);
plot([xr xr+fol],[yr yr]);
xlim([-5 95]);
ylim([-5 95]);
%plot[pre_line[0],pre_line[1],pre_line[2],pre_line[3]];

%
