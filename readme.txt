# kinematics

Kinematics models for DarwinOp

Mechanical characteristics converted from Solidworks models to Matlab Simulink/SimMechanics.
Mechanical and electrical characteristics of the MX-28 actuators extracted from off-line measurements and on-line instrumentation.


Requirements:

The models are made using Matlab R2014b.
Models MX28.slx and MX28_simple.slx requires Simulink only.
Models MX28kinematics.slx, foot.slx, right_arm.slx, right_left.slx and robot_stand.slx require Simulink, SimScape and SimMechanics optional toolboxes.
Models robot_rk.slx and robot_action.slx require Simulink, SimScape, SimMechanics and Stateflow optional toolboxes.

The simulation models are implemented using the ODE45 solver to ensure fast and accurate results.
The instrumentation models are executed with discrete sample times identified from the actuators and from the robot.


File contents:

initialisation scripts
"MX28init.m"                                      - initialisation script for all types and constants required by MX28 simulink models
"CM730init.m"                                     - initialisation script for all types and constants required by CM730 (inside robot) simulink models
"FSRinit.m"                                       - initialisation script for all types and constants required by FSR (inside robot) simulink models
"action_init.m"                                   - initialisation script for all types and constants required by robot_action.slx
"robot_init.m"                                    - initialisation script for all types and constants required by robot simulink models (invoke all the above scripts)

MX28 models
"MX28_simple.slx"                                 - simple continuous-time equivalent model of the MX28 actuator
"MX28.slx"                                        - generic discrete-time model of the MX28 actuator, this model is referenced by the following models
"MX28kinematics.slx"                              - simple stimulus and scopes for one single MX28 actuator

simple kinematic models
"foot.slx"                                        - simple stimulus and scopes for 2 MX28 actuators (right foot - DARwInOP ID=15,17)
"right_arm.slx"                                   - simple stimulus and scopes for 3 MX28 actuators (right arm - DARwInOP ID=1,3,5)
"left_leg.slx"                                    - simple stimulus and scopes for 6 MX28 actuators (left leg - DARwInOP ID=8,10,12,14,16,18)
"right_leg.slx"                                   - simple stimulus and scopes for 6 MX28 actuators (right leg - DARwInOP ID=7,9,11,13,15,17)

advanced robot models
"robot_stand.slx"                                 - advanced command for the entire robot fixed on its stand
"robot_rk.slx"                                    - advanced command (Stateflow chart) for the entire robot doing a "right kick"
"robot_action.slx"                                - advanced command (Stateflow chart) for all predefined moves (Roboplus Motion files)

3D display files
"STL"                                             - directory containing 3D models for displaying the robot inside Matlab

MX28 identification details
"instrumentation"                                 - directory containing instrumentation and modeling details
"instrumentation/Identification du MX28 FR.pdf"   - results and explanations obtained during all the tests
"instrumentation/mx28_identification_d.slx"       - instrumentation model used during Derivate modeling, requires Simulink blocs from https://github.com/darwinop-ens/simulink/
"instrumentation/mx28_identification_i.slx"       - instrumentation model used during Integrator modeling, requires Simulink blocs from https://github.com/darwinop-ens/simulink/
"instrumentation/mx28_identification_p.slx"       - instrumentation model used during Proportional modeling, requires Simulink blocs from https://github.com/darwinop-ens/simulink/
"instrumentation/mx28_identification_pid.slx"     - instrumentation model used during entire PID modeling, requires Simulink blocs from https://github.com/darwinop-ens/simulink/
"instrumentation/mx28_identification_pid_sat.slx" - instrumentation model used during entire PID modeling with speed and load limits, requires Simulink blocs from https://github.com/darwinop-ens/simulink/
