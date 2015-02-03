MX28init;
CM730init;
FSRinit;
action_init;

robot_gravity = [0 0 -9.80665]; % gravity vector m.s^-2

robot_floor_position_gain = -1e5; % N.m^-1 Force (Newton) applied from the floor to the foot per length "pushed" inside the floor
robot_floor_speed_gain = -1e3;    % N.m^-1.s Force (Newton) applied from the floor to the foot per contact speed
robot_floor_friction_coeff = 0.6; % dry friction coefficient = floor tangent force / floor normal force

% utility function to extract moment of inertia
moment_of_inertia = @(mat) [mat(1,1) mat(2,2) mat(3,3)];
% utility function to extract product of inertia
product_of_inertia = @(mat) [mat(3,2) mat(3,1) mat(2,1)];

% for all below characteristics
% dimensions in mm
% weight in g
% inertia in g.mm^2

% chest mass and transforms
robot_origin_to_center_mass = [0.06 16.94 -31.61];
robot_chest_mass = 591.59;
robot_chest_inertia = [486997.61 349.95 -439.04; 349.95 528767.21 17259.69; -439.04 17259.69 581899.58];
robot_chest_moment_inertia = moment_of_inertia(robot_chest_inertia);
robot_chest_product_inertia = product_of_inertia(robot_chest_inertia);

robot_origin_to_neck_base_tra = [0 0 23.9];
robot_origin_to_neck_base_rot = [1 0 0; 0 1 0; 0 0 1];

robot_origin_to_left_hip_base_tra = [37 5 -94.2];
robot_origin_to_left_hip_base_rot = [0 -1 0; -1 0 0; 0 0 -1];

robot_origin_to_right_hip_base_tra = [-37 5 -94.2];
robot_origin_to_right_hip_base_rot = [0 -1 0; -1 0 0; 0 0 -1];

robot_origin_to_left_shoulder_base_tra = [60.9 0 0.1];
robot_origin_to_left_shoulder_base_rot = [0 0 1; 1 0 0; 0 1 0];

robot_origin_to_right_shoulder_base_tra = [-60.9 0 0.1];
robot_origin_to_right_shoulder_base_rot = [0 0 -1; -1 0 0; 0 1 0];

robot_origin_to_acc_tra = [0 -10 -31.6];
robot_origin_to_acc_rot = [1 0 0; 0 1 0; 0 0 1];

robot_origin_to_gyro_tra = [0 10 -31.6];
robot_origin_to_gyro_rot = [0 -1 0; -1 0 0; 0 0 -1];

% neck mass and transform
robot_neck_to_center_mass = [0 -1.02 5.84];
robot_neck_mass = 12.36;
robot_neck_inertia = [1756.05 0.03 0.09; 0.03 5086.73 81.13; 0.09 81.13 4590.62];
robot_neck_moment_inertia = moment_of_inertia(robot_neck_inertia);
robot_neck_product_inertia = product_of_inertia(robot_neck_inertia);

robot_neck_axis_to_head_base_tra = [-23.65 0 26.85];
robot_neck_axis_to_head_base_rot = [0 0 1; 0 -1 0; 1 0 0];

% head mass and transform
robot_head_to_center_mass = [-17.84 3.18 26.43];
robot_head_mass = 137.28;
robot_head_inertia = [83441.89 12398.95 638.51; 12398.95 84371.05 -212.92; 638.51 -212.92 81574.80];
robot_head_moment_inertia = moment_of_inertia(robot_head_inertia);
robot_head_product_inertia = product_of_inertia(robot_head_inertia);

% right shoulder mass and transform
robot_right_shoulder_to_center_mass = [-4.16 5.98 7.64];
robot_right_shoulder_mass = 34.03;
robot_right_shoulder_inertia = [7413.36 -1420.06 -1942.66; -1420.06 12768.80 2454.83; -1942.66 2454.83 11408.98];
robot_right_shoulder_moment_inertia = moment_of_inertia(robot_right_shoulder_inertia);
robot_right_shoulder_product_inertia = product_of_inertia(robot_right_shoulder_inertia);

robot_right_shoulder_to_right_upper_arm_tra = [-23.65 16 21.35];
robot_right_shoulder_to_right_upper_arm_rot = [0 0 -1; sqrt(2)/2 -sqrt(2)/2 0; -sqrt(2)/2 -sqrt(2)/2 0];

% right upper arm mass and transform
robot_right_upper_arm_to_center_mass = [0.08 33.72 -21.42];
robot_right_upper_arm_mass = 172.08;
robot_right_upper_arm_inertia = [19264.83 -1279.61 -556.36; -1279.61 9724.45 -2575.51; -556.36 -2575.51 16255.00];
robot_right_upper_arm_moment_inertia = moment_of_inertia(robot_right_upper_arm_inertia);
robot_right_upper_arm_product_inertia = product_of_inertia(robot_right_upper_arm_inertia);

robot_right_upper_arm_to_right_forearm_tra = [23.9 60 -7.9];
robot_right_upper_arm_to_right_forearm_rot = [0 0 1; -1 0 0; 0 -1 0];

% right forearm mass and transform
robot_right_forearm_to_center_mass = [12.76 43.34 -15.75];
robot_right_forearm_mass = 62.79;
robot_right_forearm_inertia = [94510.59 8488.79 -659.23; 8488.79 21923.01 1625.36; -659.23 1625.36 95153.38];
robot_right_forearm_moment_inertia = moment_of_inertia(robot_right_forearm_inertia);
robot_right_forearm_product_inertia = product_of_inertia(robot_right_forearm_inertia);

% left shoulder mass and transform
robot_left_shoulder_to_center_mass = [4.16 5.98 7.64];
robot_left_shoulder_mass = 34.03;
robot_left_shoulder_inertia = [7413.36 1420.06 1942.66; 1420.06 12768.80 2454.83; 1942.66 2454.83 11408.98];
robot_left_shoulder_moment_inertia = moment_of_inertia(robot_left_shoulder_inertia);
robot_left_shoulder_product_inertia = product_of_inertia(robot_left_shoulder_inertia);

robot_left_shoulder_to_left_upper_arm_tra = [23.65 16 21.35];
robot_left_shoulder_to_left_upper_arm_rot = [0 0 1; -sqrt(2)/2 -sqrt(2)/2 0; sqrt(2)/2 -sqrt(2)/2 0];

% left upper arm mass and transform
robot_left_upper_arm_to_center_mass = [-0.08 33.72 -21.42];
robot_left_upper_arm_mass = 172.08;
robot_left_upper_arm_inertia = [19264.83 1279.61 556.36; 1279.61 9724.45 -2575.51; 556.36 -2575.51 16255.00];
robot_left_upper_arm_moment_inertia = moment_of_inertia(robot_left_upper_arm_inertia);
robot_left_upper_arm_product_inertia = product_of_inertia(robot_left_upper_arm_inertia);

robot_left_upper_arm_to_left_forearm_tra = [-21.08 60 -7.9];
robot_left_upper_arm_to_left_forearm_rot = [0 0 -1; 1 0 0; 0 -1 0];

% left forearm mass and transform
robot_left_forearm_to_center_mass = [-12.76 43.34 -15.75];
robot_left_forearm_mass = 62.79;
robot_left_forearm_inertia = [94510.59 -8488.79 659.23; -8488.79 21923.01 1625.36; 659.23 1625.36 95153.38];
robot_left_forearm_moment_inertia = moment_of_inertia(robot_left_forearm_inertia);
robot_left_forearm_product_inertia = product_of_inertia(robot_left_forearm_inertia);

% left/right hip 1 mass and transform
robot_hip1_to_center_mass = [7.53 0 10.27];
robot_hip1_mass = 34.10;
robot_hip1_inertia = [8263.37 0.01 3666.64; 0.01 18980.35 -0.01; 3666.64 -0.01 13481.71];
robot_hip1_moment_inertia = moment_of_inertia(robot_hip1_inertia);
robot_hip1_product_inertia = product_of_inertia(robot_hip1_inertia);

robot_hip1_to_hip2_tra = [24.85 0 28.35];
robot_hip1_to_hip2_rot = [0 0 -1; -1 0 0; 0 1 0];

% right hip 2 mass and transform
robot_right_hip2_to_center_mass = [-0.29 -10.71 0.82];
robot_right_hip2_mass = 174.59;
robot_right_hip2_inertia = [16728.30 -144.99 -83.89; -144.99 16766.02 2743.83; -83.89 2743.83 7675.79];
robot_right_hip2_moment_inertia = moment_of_inertia(robot_right_hip2_inertia);
robot_right_hip2_product_inertia = product_of_inertia(robot_right_hip2_inertia);

robot_right_hip2_to_right_thigh_tra = [23.9 0 19.1];
robot_right_hip2_to_right_thigh_rot = [0 0 1; 0 1 0; -1 0 0];

% right thigh mass and transform
robot_right_thigh_to_center_mass = [1.3336 65.4588 -22.7484];
robot_right_thigh_mass = 110.3854;
robot_right_thigh_inertia = [55201.0572 -838.9747 800.8535; -838.9747 21712.8386 -6491.7378; 800.8535 -6491.7378 48022.2949];
robot_right_thigh_moment_inertia = moment_of_inertia(robot_right_thigh_inertia);
robot_right_thigh_product_inertia = product_of_inertia(robot_right_thigh_inertia);

robot_right_thigh_to_right_lower_leg_tra = [0 93 -1.75];
robot_right_thigh_to_right_lower_leg_rot = [1 0 0; 0 1 0; 0 0 1];

% right lower leg mass and transform
robot_right_lower_leg_to_center_mass = [-6.05 -39.28 -19.71];
robot_right_lower_leg_mass = 76.53;
robot_right_lower_leg_inertia = [129652.78 -13233.35 1869.15; -13233.35 47800.32 -2435.47; 1869.15 -2435.47 108912.32];
robot_right_lower_leg_moment_inertia = moment_of_inertia(robot_right_lower_leg_inertia);
robot_right_lower_leg_product_inertia = product_of_inertia(robot_right_lower_leg_inertia);

robot_right_lower_leg_to_right_ankle_tra = [0 -93 0];
robot_right_lower_leg_to_right_ankle_rot = [1 0 0; 0 1 0; 0 0 1];

% right ankle mass and transform
robot_right_ankle_to_center_mass = [17.25 -10.71 -23.2];
robot_right_ankle_mass = 174.59;
robot_right_ankle_inertia = [10113.69 -3800.76 443.69; -3800.76 15126.15 777.03; 443.69 777.03 12650.52];
robot_right_ankle_moment_inertia = moment_of_inertia(robot_right_ankle_inertia);
robot_right_ankle_product_inertia = product_of_inertia(robot_right_ankle_inertia);

robot_right_ankle_to_right_foot_tra = [-19.35 0 -24];
robot_right_ankle_to_right_foot_rot = [0 0 1; 0 -1 0; 1 0 0];

% right foot mass and transform
robot_right_foot_to_center_mass = [7.76 24.50 17.25];
robot_right_foot_mass = 76.78;
robot_right_foot_inertia = [69069.27 2754.23 778.30; 2754.23 85303.49 4062.22; 778.30 4062.22 36675.98];
robot_right_foot_moment_inertia = moment_of_inertia(robot_right_foot_inertia);
robot_right_foot_product_inertia = product_of_inertia(robot_right_foot_inertia);

robot_right_foot_to_front_left_floor_tra = [-14.5 33.5 73.1];
robot_right_foot_to_front_right_floor_tra = [35.5 33.5 73.1];
robot_right_foot_to_back_left_floor_tra = [-14.5 33.5 -28.9];
robot_right_foot_to_back_right_floor_tra = [35.5 33.5 -28.9];
robot_right_foot_to_floor_rot = [-1 0 0; 0 0 -1; 0 -1 0];

% left hip 2 mass and transform
robot_left_hip2_to_center_mass = [-0.29 -10.71 0.82];
robot_left_hip2_mass = 174.59;
robot_left_hip2_inertia = [16728.30 -144.99 -83.89; -144.99 16766.02 2743.83; -83.89 2743.83 7675.79];
robot_left_hip2_moment_inertia = moment_of_inertia(robot_left_hip2_inertia);
robot_left_hip2_product_inertia = product_of_inertia(robot_left_hip2_inertia);

robot_left_hip2_to_left_thigh_tra = [-23.9 0 19.1];
robot_left_hip2_to_left_thigh_rot = [0 0 -1; 0 1 0; 1 0 0];

% left thigh mass and transform
robot_left_thigh_to_center_mass = [-0.8267 65.4588 -22.7488];
robot_left_thigh_mass = 110.3854;
robot_left_thigh_inertia = [55201.0572 -838.9747 800.8535; -838.9747 21712.8386 -6491.7378; 800.8535 -6491.7378 48022.2949];
robot_left_thigh_moment_inertia = moment_of_inertia(robot_left_thigh_inertia);
robot_left_thigh_product_inertia = product_of_inertia(robot_left_thigh_inertia);

robot_left_thigh_to_left_lower_leg_tra = [0 93 0.25];
robot_left_thigh_to_left_lower_leg_rot = [1 0 0; 0 1 0; 0 0 1];

% left lower leg mass and transform
robot_left_lower_leg_to_center_mass = [6.05 -39.28 -19.66];
robot_left_lower_leg_mass = 76.53;
robot_left_lower_leg_inertia = [129652.78 -13233.35 1869.15; -13233.35 47800.32 -2435.47; 1869.15 -2435.47 108912.32];
robot_left_lower_leg_moment_inertia = moment_of_inertia(robot_left_lower_leg_inertia);
robot_left_lower_leg_product_inertia = product_of_inertia(robot_left_lower_leg_inertia);

robot_left_lower_leg_to_left_ankle_tra = [0 -93 0];
robot_left_lower_leg_to_left_ankle_rot = [1 0 0; 0 1 0; 0 0 1];

% left ankle mass and transform
robot_left_ankle_to_center_mass = [17.25 -10.71 -23.2];
robot_left_ankle_mass = 174.59;
robot_left_ankle_inertia = [10113.69 -3800.76 443.69; -3800.76 15126.15 777.03; 443.69 777.03 12650.52];
robot_left_ankle_moment_inertia = moment_of_inertia(robot_left_ankle_inertia);
robot_left_ankle_product_inertia = product_of_inertia(robot_left_ankle_inertia);

robot_left_ankle_to_left_foot_tra = [19.35 0 -23.55];
robot_left_ankle_to_left_foot_rot = [0 0 -1; 0 -1 0; -1 0 0];

% left foot mass and transform
robot_left_foot_to_center_mass = [-7.76 24.50 17.25];
robot_left_foot_mass = 76.78;
robot_left_foot_inertia = [69069.27 -2754.23 -778.30; -2754.23 85303.49 4062.22; -778.30 4062.22 36675.98];
robot_left_foot_moment_inertia = moment_of_inertia(robot_left_foot_inertia);
robot_left_foot_product_inertia = product_of_inertia(robot_left_foot_inertia);

robot_left_foot_to_front_left_floor_tra = [-35.5 33.5 73.1];
robot_left_foot_to_front_right_floor_tra = [14.5 33.5 73.1];
robot_left_foot_to_back_left_floor_tra = [-35.5 33.5 -28.9];
robot_left_foot_to_back_right_floor_tra = [14.5 33.5 -28.9];
robot_left_foot_to_floor_rot = [-1 0 0; 0 0 -1; 0 -1 0];
