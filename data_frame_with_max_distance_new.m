t = tcpclient('enter the same ip which you have entered in the python file',17000); %client intialize
clc
clearvars -except t data
n_azi = 4;
m_azi = 3;
k_azi = 1;
n_dist = 6;
m_dist = 5;
k_dist = 1;
n_intensity = 7;
k_intensity = 1;
count_byte = 1;
frame_pause = 1;
lidar_k = 1;
lidar_l = 1;
lidar_m = 24;
lidar_k_intensity = 1;
next_frame_max_dist_initial = 1;
next_frame_max_dist_final = 1800;
raw_data_initial = 1;
raw_data_final = 1206;
entered = 010101010101;
%------------------------------------------------------------------------------------
while 1
     a = read(t,1206);
    %-------------------------------------------------------------------------------------
    % Extracting the azimuthal
  % a = data(raw_data_initial:raw_data_final);
   %  raw_data_final = raw_data_final+1206;
 % raw_data_initial = raw_data_initial +1;  
   count_azi = 1;
    k_azi = 1;
    n_azi = 4;
    m_azi = 3;
 
    while(k_azi<13)
    i = num2str(dec2hex(a(n_azi)));
    j = num2str(dec2hex(a(m_azi)));
    azi = strcat(i,j);
    azi = hex2dec(azi);
    azi = azi/100;
    data_azi(count_azi) = azi;
    data_azi(count_azi+1) = data_azi(count_azi) + 0.20;
    count_azi = count_azi+2;
    n_azi = n_azi+100;
    m_azi = m_azi+100;
    k_azi = k_azi+1; 
    end
    
    
    %---------------------------------------------------------------------------
    %distance
    n_dist = 6;
    m_dist = 5;
    k_dist = 1;
    count_dist = 1;
    
    while n_dist<1200
    y = num2str(dec2hex(a(n_dist)));
    z = num2str(dec2hex(a(m_dist)));
    dist = strcat(y,z);
    dist = hex2dec(dist);   
    dist = dist*2;
    dist = dist/1000;
    data_dist(count_dist) = dist;
    
    count_dist = count_dist +1;
    n_dist = n_dist+3;
    m_dist = m_dist+3;
    k_dist = k_dist+1;
    if k_dist> 32
        k_dist = 1;
        n_dist = n_dist+4;
        m_dist = m_dist+4;      
    end
    end
 
    %---------------------------------------------------------------------------------------
    %intensity 
    k_intensity = 1;
    count_intensity = 1;
    n_intensity = 7;
    
   while n_intensity <1201
   intensity = a(n_intensity);
   data_intensity(count_intensity) = intensity;
   count_intensity = count_intensity+1;
   k_intensity = k_intensity + 1;
   if k_intensity > 32
      k_intensity = 1;
      n_intensity = n_intensity + 4;
   end
    n_intensity = n_intensity+3;
   end
   
  %---------------------------------------------------------------------------------------------
  % time
   while 1
  u = num2str(dec2hex(a(1201)));
  v = num2str(dec2hex(a(1202)));
  w = num2str(dec2hex(a(1203)));
  x = num2str(dec2hex(a(1204)));
  time = strcat(x,w,v,u);
  time = hex2dec(time);
  time = time/1000000;
  break;
   end
   
  %---------------------------------------------------------------------------------------------
  %plotting the distance values w.r.t azimuthal and elevation
lidar_dat_distance(1,lidar_l:lidar_m)= data_azi; 
temp1 = 1;
temp16 = 16;
temp_k = 1;
while 1 
lidar_dat_distance(2:17,lidar_k) = data_dist(temp1:temp16);
temp1 = temp1 + 16;
temp16 = temp16 +16;
temp_k = temp_k +1;
lidar_k = lidar_k+1;
if temp_k>24
    break
end
end


%--------------------------------------------------------------------------------------------------
%plotting the intensity values w.r.t. azimuthal and elevation
lidar_dat_intensity(1,lidar_l:lidar_m)= data_azi; 
temp11 = 1;
temp116 = 16;
temp_k_in = 1;
while 1 
lidar_dat_intensity(2:17,lidar_k_intensity) = data_intensity(temp11:temp116);
temp11 = temp11 + 16;
temp116 = temp116 +16;
temp_k_in = temp_k_in +1;
lidar_k_intensity = lidar_k_intensity+1;
if temp_k_in>24
    break
end
end
lidar_l = lidar_l+24;
lidar_m = lidar_m+24;
%--------------------------------------------------------------------------------------
%plotting the values bythe wise
size_azi = size(data_azi);
size_dist = size(data_dist);
size_intensity = size(data_intensity);
  
main_data_azimuthal(1:size_azi(2),count_byte) = data_azi;
main_data_distance(1:size_dist(2),count_byte) = data_dist;
main_data_intensity(1: size_intensity(2),count_byte) = data_intensity;
main_data_time_sec(count_byte) = time;
  count_byte = count_byte+1;
%  subplot(3,1,1), plot( main_data_azimuthal)
%  subplot(3,1,2), plot(main_data_distance)
%  subplot(3,1,3) ,plot(main_data_intensity)
%  hold on;
% if frame_pause == 1
%     pause(2);
% end

%------------------------------------------------------------------------------------------------------------
%max distance with data one data frame
if rem(frame_pause,75) == 0
entered
frame_min= lidar_dat_distance(2:17,next_frame_max_dist_initial:next_frame_max_dist_final);
frame_min_with_angle = lidar_dat_distance(1,next_frame_max_dist_initial:next_frame_max_dist_final);
[row_max,column_max] = find(frame_min == max(max(frame_min)));
max_distance = frame_min(row_max,column_max);
azimuthal_maxdistance = frame_min_with_angle(1,column_max);
next_frame_max_dist_initial = next_frame_max_dist_initial+1800;
next_frame_max_dist_final = next_frame_max_dist_final +1800;
end
%-----------------------------------------------------------------------------------------------------------
%frame rearranged
frame_arranged_count = 1;


if rem(frame_pause,75) == 0
    entered
   while(frame_arranged_count<1801)
   frame_arranged_temp = frame_min(1:16, frame_arranged_count) ;
   frame_arranged(16,frame_arranged_count) = frame_arranged_temp(1);
   frame_arranged(15,frame_arranged_count) = frame_arranged_temp(3);
   frame_arranged(14,frame_arranged_count) = frame_arranged_temp(5);
   frame_arranged(13,frame_arranged_count) = frame_arranged_temp(7);
   frame_arranged(12,frame_arranged_count) = frame_arranged_temp(9);
   frame_arranged(11,frame_arranged_count) = frame_arranged_temp(11);
   frame_arranged(10,frame_arranged_count) = frame_arranged_temp(13);
   frame_arranged(9,frame_arranged_count) = frame_arranged_temp(15);
   frame_arranged(8,frame_arranged_count) = frame_arranged_temp(2);
   frame_arranged(7,frame_arranged_count) = frame_arranged_temp(4);
   frame_arranged(6,frame_arranged_count) = frame_arranged_temp(6);
   frame_arranged(5,frame_arranged_count) = frame_arranged_temp(8);
   frame_arranged(4,frame_arranged_count) = frame_arranged_temp(10);
   frame_arranged(3,frame_arranged_count) = frame_arranged_temp(12);
   frame_arranged(2,frame_arranged_count) = frame_arranged_temp(14);
   frame_arranged(1,frame_arranged_count) = frame_arranged_temp(16);  
   frame_arranged_count = frame_arranged_count +1;
   end
        frame_arranged_complete(1,1:1800) = frame_min_with_angle;
        frame_arranged_complete(2:17,1:1800) = frame_arranged;
end
%-----------------------------------------------------------------------------------------------------




%-----------------------------------------------------------------------------------------------------
frame_pause = frame_pause+1

end


