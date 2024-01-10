# One stop build and run
#!/bin/sh

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
	echo "Not running as root"
	exit
fi

echo "[+] Building Dockerfile..."
docker build --tag hellodockernginx:0.1 .
echo "[+] Executing created image..."
docker run --name hdnginx -d -p 80:80 -v /root/data:/data hellodockernginx:0.1
echo "[+] service is now running!"
docker ps
