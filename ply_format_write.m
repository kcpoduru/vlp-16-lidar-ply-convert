% calculation ff x,y,z coordinates for ply format

% calculation of x coordinates
x_count = 1;
while(x_count <1801)
x_coor(1,x_count) = frame_arranged_complete(2,x_count)*cosd(15)*sind(frame_arranged_complete(1,x_count));
x_coor(2,x_count) = frame_arranged_complete(3,x_count)*cosd(13)*sind(frame_arranged_complete(1,x_count));
x_coor(3,x_count) = frame_arranged_complete(4,x_count)*cosd(11)*sind(frame_arranged_complete(1,x_count));
x_coor(4,x_count) = frame_arranged_complete(5,x_count)*cosd(9)*sind(frame_arranged_complete(1,x_count));
x_coor(5,x_count) = frame_arranged_complete(6,x_count)*cosd(7)*sind(frame_arranged_complete(1,x_count));
x_coor(6,x_count) = frame_arranged_complete(7,x_count)*cosd(5)*sind(frame_arranged_complete(1,x_count));
x_coor(7,x_count) = frame_arranged_complete(8,x_count)*cosd(3)*sind(frame_arranged_complete(1,x_count));
x_coor(8,x_count) = frame_arranged_complete(9,x_count)*cosd(1)*sind(frame_arranged_complete(1,x_count));
x_coor(9,x_count) = frame_arranged_complete(10,x_count)*cosd(-1)*sind(frame_arranged_complete(1,x_count));
x_coor(10,x_count) = frame_arranged_complete(11,x_count)*cosd(-3)*sind(frame_arranged_complete(1,x_count));
x_coor(11,x_count) = frame_arranged_complete(12,x_count)*cosd(-5)*sind(frame_arranged_complete(1,x_count));
x_coor(12,x_count) = frame_arranged_complete(13,x_count)*cosd(-7)*sind(frame_arranged_complete(1,x_count));
x_coor(13,x_count) = frame_arranged_complete(14,x_count)*cosd(-9)*sind(frame_arranged_complete(1,x_count));
x_coor(14,x_count) = frame_arranged_complete(15,x_count)*cosd(-11)*sind(frame_arranged_complete(1,x_count));
x_coor(15,x_count) = frame_arranged_complete(16,x_count)*cosd(-13)*sind(frame_arranged_complete(1,x_count));
x_coor(16,x_count) = frame_arranged_complete(17,x_count)*cosd(-15)*sind(frame_arranged_complete(1,x_count));
x_count = x_count + 1;
end

x_coor_initial = 1;
x_coor_final = 16;
x_coor_temp = 1;

while(x_coor_temp <1801)
x_final_coor(x_coor_initial : x_coor_final) = x_coor(1:16,x_coor_temp);
x_coor_initial = x_coor_initial+16;
x_coor_final = x_coor_final+16;
x_coor_temp = x_coor_temp+1;
end


%--------------------------------------------------------------------------------------------------------
% calculation of y coordinates

y_count = 1;
while(y_count <1801)
y_coor(1,y_count) = frame_arranged_complete(2,y_count)*cosd(15)*cosd(frame_arranged_complete(1,y_count));
y_coor(2,y_count) = frame_arranged_complete(3,y_count)*cosd(13)*cosd(frame_arranged_complete(1,y_count));
y_coor(3,y_count) = frame_arranged_complete(4,y_count)*cosd(11)*cosd(frame_arranged_complete(1,y_count));
y_coor(4,y_count) = frame_arranged_complete(5,y_count)*cosd(9)*cosd(frame_arranged_complete(1,y_count));
y_coor(5,y_count) = frame_arranged_complete(6,y_count)*cosd(7)*cosd(frame_arranged_complete(1,y_count));
y_coor(6,y_count) = frame_arranged_complete(7,y_count)*cosd(5)*cosd(frame_arranged_complete(1,y_count));
y_coor(7,y_count) = frame_arranged_complete(8,y_count)*cosd(3)*cosd(frame_arranged_complete(1,y_count));
y_coor(8,y_count) = frame_arranged_complete(9,y_count)*cosd(1)*cosd(frame_arranged_complete(1,y_count));
y_coor(9,y_count) = frame_arranged_complete(10,y_count)*cosd(-1)*cosd(frame_arranged_complete(1,y_count));
y_coor(10,y_count) = frame_arranged_complete(11,y_count)*cosd(-3)*cosd(frame_arranged_complete(1,y_count));
y_coor(11,y_count) = frame_arranged_complete(12,y_count)*cosd(-5)*cosd(frame_arranged_complete(1,y_count));
y_coor(12,y_count) = frame_arranged_complete(13,y_count)*cosd(-7)*cosd(frame_arranged_complete(1,y_count));
y_coor(13,y_count) = frame_arranged_complete(14,y_count)*cosd(-9)*cosd(frame_arranged_complete(1,y_count));
y_coor(14,y_count) = frame_arranged_complete(15,y_count)*cosd(-11)*cosd(frame_arranged_complete(1,y_count));
y_coor(15,y_count) = frame_arranged_complete(16,y_count)*cosd(-13)*cosd(frame_arranged_complete(1,y_count));
y_coor(16,y_count) = frame_arranged_complete(17,y_count)*cosd(-15)*cosd(frame_arranged_complete(1,y_count));
y_count = y_count + 1;
end

y_coor_initial = 1;
y_coor_final = 16;
y_coor_temp = 1;

while(y_coor_temp <1801)
y_final_coor(y_coor_initial : y_coor_final) = y_coor(1:16,y_coor_temp);
y_coor_initial = y_coor_initial+16;
y_coor_final = y_coor_final+16;
y_coor_temp = y_coor_temp+1;
end

%----------------------------------------------------------------------------------------------------------------
% calculation of z coordinates

z_count = 1;
while(z_count <1801)
z_coor(1,z_count) = frame_arranged_complete(2,z_count)*sind(15);
z_coor(2,z_count) = frame_arranged_complete(3,z_count)*sind(13);
z_coor(3,z_count) = frame_arranged_complete(4,z_count)*sind(11);
z_coor(4,z_count) = frame_arranged_complete(5,z_count)*sind(9);
z_coor(5,z_count) = frame_arranged_complete(6,z_count)*sind(7);
z_coor(6,z_count) = frame_arranged_complete(7,z_count)*sind(5);
z_coor(7,z_count) = frame_arranged_complete(8,z_count)*sind(3);
z_coor(8,z_count) = frame_arranged_complete(9,z_count)*sind(1);
z_coor(9,z_count) = frame_arranged_complete(10,z_count)*sind(-1);
z_coor(10,z_count) = frame_arranged_complete(11,z_count)*sind(-3);
z_coor(11,z_count) = frame_arranged_complete(12,z_count)*sind(-5);
z_coor(12,z_count) = frame_arranged_complete(13,z_count)*sind(-7);
z_coor(13,z_count) = frame_arranged_complete(14,z_count)*sind(-9);
z_coor(14,z_count) = frame_arranged_complete(15,z_count)*sind(-11);
z_coor(15,z_count) = frame_arranged_complete(16,z_count)*sind(-13);
z_coor(16,z_count) = frame_arranged_complete(17,z_count)*sind(-15);
z_count = z_count + 1;
end

z_coor_initial = 1;
z_coor_final = 16;
z_coor_temp = 1;

while(z_coor_temp <1801)
z_final_coor(z_coor_initial : z_coor_final) = z_coor(1:16,z_coor_temp);
z_coor_initial = z_coor_initial+16;
z_coor_final = z_coor_final+16;
z_coor_temp = z_coor_temp+1;
end

%--------------------------------------------------------------------------------------------------------------------
% ply format conversion

 cloud_format(1:28800 ,1) = x_final_coor';
cloud_format(1:28800 ,2) = y_final_coor';
cloud_format(1:28800 ,3) = z_final_coor';
pkcloud = pointCloud(cloud_format);
pcwrite(pkcloud,'pkCloud','PLYFormat','ascii');
pause(2);
pk_ply = pcread('pkCloud.ply');
pause(2);
pcshow(pk_ply)



