MX28init;
CM730init;
%FSRinit;

robot_gravity = [0 0 -9.80665]; % gravity vector m.s^-2

robot_floor_position_gain = -1e5; % N.m^-1 Force (Newton) applied from the floor to the foot per length "pushed" inside the floor
robot_floor_speed_gain = -1e3;    % N.m^-1.s Force (Newton) applied from the floor to the foot per contact speed
robot_floor_friction_coeff = 0.6; % dry friction coefficient = floor tangent force / floor normal force
