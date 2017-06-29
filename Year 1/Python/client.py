
import socket
import sys
import os
server = sys.argv[1]
port = int(sys.argv[2])
cmd = sys.argv[3]
filename = sys.argv[4]


if cmd == 'PUT' and (not os.access(filename, os.R_OK) or not os.path.isfile(filename)):
	print("Unable to access: " + filename)
	sys.exit(1)

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((server, port))
fileCMD = filename + ' ' + cmd

dataReady = s.recv(1024).decode("UTF-8")
#print(dataReady)

if cmd == 'PUT':
	print("CMD: " + cmd + " and filename: " + filename)
	size = os.path.getsize(filename)
		
	s.send(fileCMD.encode('UTF-8'))
	ok = s.recv(1024).decode('UTF-8')
	s.send(size.to_bytes(8, byteorder='big', signed=False))
    
	f = open(filename, 'rb')
	while size > 0:
		data = f.read(min(size, 1024))
		s.send(data)
		size -= len(data)
	f.close()
	ok = s.recv(1024).decode('UTF-8')
	s.send('Goodbye: '.encode('UTF-8'))
	s.close()
elif cmd == 'GET':

	#print (cmd)
	#print (filename)
	s.send(fileCMD.encode('UTF-8'))
	data = s.recv(1024).decode("UTF-8")
	#print(data)
	if data == "OK": 
		s.send('ready'.encode('UTF-8'))
		data = s.recv(8)
		s.send('OK'.encode("UTF-8"))
		size = int.from_bytes(data, byteorder='big', signed=True)
		f = open(filename, 'wb')
		while size > 0:
			data = s.recv(min(size, 1024))
			size -= len(data)
			f.write(data)
		f.close()
		s.send('OK'.encode('UTF-8'))
		data = s.recv(1024)
		s.close()
	else: 
		parts = data.split(":")
		print(parts[0])
		print(parts[1])
		print(("Server error: file" + parts[1]))
elif cmd == 'DEL':
	s.send(fileCMD.encode('UTF-8'))
	data = s.recv(1024).decode("UTF-8")
	if data == 'ok':
		s.close()
	else: 
		parts = data.split(":")
		print(("Server error: file" + parts[1]))


			
