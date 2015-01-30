robot_actions_default = struct( ...
    'name',uint8(zeros(256,14)), ...
    'repeat',uint8(zeros(256,1)), ...
    'schedule',uint8(zeros(256,1)), ...
    'stepnum',uint8(zeros(256,1)), ...
    'speed',uint8(zeros(256,1)), ...
    'accel',uint8(zeros(256,1)), ...
    'next',uint8(zeros(256,1)), ...
    'exit',uint8(zeros(256,1)), ...
    'slope',uint8(zeros(256,31)), ...
    'stepposition',int16(zeros(256,7,31)), ...
    'steppause',uint8(zeros(256,7)), ...
    'steptime',uint8(zeros(256,7)));
robot_actions_bus = Simulink.Bus.createObject(robot_actions_default);

bus_name = robot_actions_bus.busName;
robot_actions_bus = eval(bus_name);
clear(bus_name);
clear('bus_name');

for i=1:length(robot_actions_bus.Elements)
    element = robot_actions_bus.Elements(i);
    if strcmp(element.Name,'name')
        element.Description = 'Action name';
        element.Min = 0;
        element.Max = 255;
    elseif strcmp(element.Name,'repeat')
        element.Description = 'Repeat count';
        element.Min = 0;
        element.Max = 255;
    elseif strcmp(element.Name,'schedule')
        element.Description = 'Task schedule';
        element.Min = 0;
        element.Max = 255;
    elseif strcmp(element.Name,'stepnum')
        element.Description = 'Step count';
        element.Min = 0;
        element.Max = 7;
    elseif strcmp(element.Name,'speed')
        element.Description = 'Execution speed';
        element.Min = 0;
        element.Max = 255;
    elseif strcmp(element.Name,'accel')
        element.Description = 'Acceleration factor';
        element.Min = 0;
        element.Max = 255;
    elseif strcmp(element.Name,'next')
        element.Description = 'Next action';
        element.Min = 0;
        element.Max = 255;
    elseif strcmp(element.Name,'exit')
        element.Description = 'Exit action';
        element.Min = 0;
        element.Max = 255;
    elseif strcmp(element.Name,'slope')
        element.Description = 'Actuator compliance slopes';
        element.Min = 0;
        element.Max = 255;
    elseif strcmp(element.Name,'stepposition')
        element.Description = 'Actuator positions';
        element.Min = 0;
        element.Max = 4095;
    elseif strcmp(element.Name,'steppause')
        element.Description = 'Step preamble pause';
        element.Min = 0;
        element.Max = 255;
    elseif strcmp(element.Name,'steptime')
        element.Description = 'Step execution time';
        element.Min = 0;
        element.Max = 255;
    else
        error('invalid element name "%s"',element.Name);
    end
    robot_actions_bus.Elements(i) = element;
end
clear element;

f = fopen('motion_4096.bin','r');
try
    b = uint8(fread(f,2^17));
    fclose(f);
    clear f;
catch err
    fclose(f);
    clear b;
    clear f;
    rethrow(err);
end

if length(b) ~= 2^17
    error('invalid read, insufficient bytes returned');
end

robot_actions_motion = robot_actions_default;
for i=1:256
    j = 512*i-511;
    robot_actions_motion.name(i,:) = b(j:j+13);
    robot_actions_motion.repeat(i) = b(j+15);
    robot_actions_motion.schedule(i) = b(j+16);
    robot_actions_motion.stepnum(i) = b(j+20);
    robot_actions_motion.speed(i) = b(j+22);
    robot_actions_motion.accel(i) = b(j+24);
    robot_actions_motion.next(i) = b(j+25);
    robot_actions_motion.exit(i) = b(j+26);
    %robot_actions_init.checksum(i) = b(j+31);
    robot_actions_motion.slope(i,:) = b(j+32:j+62);
    for k=1:7
        l = j+k*64;
        for m=1:31
            v = uint16(b(l+m*2-2))+uint16(b(l+m*2-1))*256;
            v = min(max(v,0),4095);
            robot_actions_motion.stepposition(i,k,m) = v;
        end
        robot_actions_motion.steppause(i,k) = b(l+62);
        robot_actions_motion.steptime(i,k) = b(l+63);
    end
end

clear action;
clear i;
clear j;
clear k;
clear l;
clear m;
clear b;
