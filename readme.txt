The link attached have  the scripts . Python script  acts as a UDP listener and TCP server. The python script takes the input byte stream from lidar and sends to the client(matlab)....enter the local ip of the computer in the spot in the script. flow of running the scripts

1. Run the python file(It waits until you start the matlab script).
2. Run the data_frame_with_max_distance.m file which acts as a client(enter the ip which you have entered in the python file(your global or local ip adress)(run the script till the frame count is 75(preffered 150). you can check the variables with naming accordingly in the workspace.
3.  Run ply_format_write.m file which creates a file name pkCloud.ply file in the same directory as of your scripts. 
4. Analyze the point cloud with matlab using toolbox.


