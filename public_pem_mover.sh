#! /bin/bash


# As a Windows user, I use WSL to work with the Linux Ubuntu OS on the same physical device. The default download manager downloads files to the Windows OS directory. 
# To streamline the process of SSH connection to AWS labs provided by the AWS re/Start program, I've created this small script. 
# It changes the directory to the Windows default download folder where the .pem file is located, then it copies the file to the Linux directory, changes the file permissions of the .pem, and SSHs to the specified IP address. 
#You'll need to personalize the script to use it.

echo Switchig directory to Windows default Downloads dir
cd /mnt/c/Users/ # <provide source Windows directory>
echo Force move file to  # <provide target Linux directory for verbose purpose>
mv -f #<provide name of .pem file, for example keys.pem > < provide target Linux directory, for example /home/someuser>
echo Switching back to Linux directory
cd #<provide target Linux directory /home/someuser>
echo Modifing permissions
chmod 400  #<provide name of .pem file, for example keys.pem>
echo Done!
read -p 'Do you want to connect with ec2 server? yes/no ' answer
if [[ $answer == 'no' ]]; then
	echo Bye!

elif [[ $answer == 'yes' ]]; then
	read -p 'Provide IP: ' IP_address
	ssh -i #<keys.pem> <ec2-user@$IP_address>
else
	echo Bye!
fi

