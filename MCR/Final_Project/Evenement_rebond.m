function [value,isterminal,direction] = Evenement_rebond(t,Y)
value = Y(3) > feval('terrain',Y(1),Y(2));                   % stop the iteration when this condition is no longer verified
isterminal = 1;                                              % stop integration
direction = -1;                                              % for negative directions only