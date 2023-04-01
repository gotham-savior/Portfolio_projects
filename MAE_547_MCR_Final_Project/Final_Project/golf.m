% clear all; clc ;

% Parameters
P = Parametres() ; 
m = P.masse ;
D = 0.5*P.traine*P.densite*pi*P.rayon^2 ;
Cm = P.magnus ;
g = P.gravite ;
r = P.rayon ;
options=P.options;
to = P.to ;
tf = P.tf ;
Wox = P.omega0x ;
Woy = P.omega0y ;
Woz = P.omega0z ;
CI = [P.Xo;P.Yo;P.Zo;P.Vox;P.Voy;P.Voz];

% EDO function
F = @(t,Y) [Y(4);Y(5);Y(6);-sign(Y(4))*(D/m)*(Y(4)-P.Vwx)^2+(Cm/m)*(Woy*Y(6)-Woz*Y(5));-sign(Y(5))*(D/m)*(Y(5)-P.Vwy)^2+(Cm/m)*(Woz*Y(4)-Wox*Y(6));-sign(Y(6))*(D/m)*(Y(6)-P.Vwz)^2-g+(Cm/m)*(Wox*Y(5)-Woy*Y(4))];

% initialisation
t = to;
Y = transpose(CI);
rebond = 1 ;

% integration
[t_vol,Y_vol]=ode45(F,[to,tf],CI,options);
duree_vol = length(t_vol);
t= [t;t_vol(1:duree_vol)];
Y = [Y;Y_vol(1:duree_vol,:)];

% terrain
terrain_x = min(Y(:,1))-1:0.1:max(Y(:,1))+1 ;
terrain_y = (min(Y(:,2))-1:0.1:max(Y(:,2))+1)';
terrain_z =  terrain(terrain_x,terrain_y);
C = terrain_z;

% Animation trajectory
to =t(1); 
dto = 0.01;

for i = 1:length(Y(:,1))
    dt = t(i)-to;
    if dt >= dto
        mesh(terrain_x,terrain_y,terrain_z)
        axis equal
        hold on
       plot3(Y(1:i,1),Y(1:i,2),Y(1:i,3),'b',Y(i,1),Y(i,2),Y(i,3),'-ob')
        view(-145,20)
        title('trajectoire')
        title(sprintf('t=%f',t(i)))
        xlabel('x (m)')
        ylabel('y (m)')
        zlabel('z (m)')
        grid ON
        hold on  
        to = t(i);
    end
    pause(0.00001)
end