function P = Parametres()           % parameter function for clear and efficient use

load('inputs.mat')
P.Xo = f_kinematics.t(1);                          % initial positions
P.Yo = f_kinematics.t(2);
P.Zo = f_kinematics.t(3);


if P.Zo < terrain(P.Xo,P.Yo)        % the surface cannot be punctured within the parameters instructed by the user
    P.Zo = terrain(P.Xo,P.Yo)+0.01;
end

P.Vox = velocity(1);                      % golf ball initial velocities
P.Voy = velocity(2);
P.Voz = velocity(3);

P.omega0x = 0 ;                     % golf ball initial rotations
P.omega0y = 0 ;
P.omega0z = 0 ;

P.gravite = 9.81 ;                  % acceleration due to gravity
P.densite = 1 ;                     % air volume density
P.traine =  0.2 ;                   % drag coefficient
P.magnus =  0.0005 ;                % Magnus coefficient 5e-6 if not dumped otherwise 5e-4 at least
P.restitution = 0.5 ;               % coefficient of restitution (homogeneous in space)
P.Vlimite = 0.5 ;                   % rolling condition
P.frottement = 0.15 ;               % coefficient of friction

P.rayon = 0.021135 ;                % golf ball radius
P.masse = 0.045 ;                   % golf ball mass

P.Vwx = 0 ;                         % wind speeds
P.Vwy = 0 ;
P.Vwz = 0 ;

% Integration parameters
P.to = 0 ;                          % time window for integration
P.tf = 4 ;

% option for integration
P.options = odeset(  'RelTol',1e-6,...
                        'AbsTol', 1e-6,...
                        'Events', @Evenement_rebond,'MaxStep',0.1);