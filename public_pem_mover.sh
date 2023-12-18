#! /bin/bash

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

