import socket, sys, os, queue, time, threading

#Classes 
class client (threading.Thread):
	def __init__(self,conn):
		threading.Thread.__init__(self)
		#Instantiate connection
		self.conn = conn
	
	#Cut and pasted Lab 2 Server code	
	def run(self):
		
		
			self.conn.send("READY".encode("UTF-8"))
			data = self.conn.recv(1024)
			fileCMD = data.decode("UTF-8")
			listArgs = fileCMD.split(" ")
			
			#print(listArgs)
			# print(listArgs[0])
			# print(listArgs[1])
			filename = listArgs[0]
			cmd = listArgs[1]
			fileNotFound = filename + " does not exist"
			fileNotCreated = "Unable to create file: " + filename
			
			if cmd == "PUT":
			
			  self.conn.send("OK".encode("UTF-8"))
			  data = self.conn.recv(8)
			  size = int.from_bytes(data, byteorder = "big", signed = True)	
			  f = open(filename, "wb")
			  while size > 0:
				  data = self.conn.recv(min(size, 1024))
				  size -= len(data)
				  f.write(data)
			  f.close()
			  self.conn.send("OK".encode("UTF-8"))
			  data = self.conn.recv(1024)
			  self.conn.close()
			
			elif cmd == "GET":
				if not os.access(filename, os.R_OK) or not os.path.isfile(filename):
					self.conn.send(("ERROR: " + fileNotFound).encode("UTF-8"))
				else: 
					self.conn.send("OK".encode("UTF-8"))
					ready = self.conn.recv(1024).decode("UTF-8")
				  
					size = os.path.getsize(filename)	  
					
					self.conn.send(size.to_bytes(8, byteorder='big', signed=False))
					ok = self.conn.recv(1024).decode("UTF-8")
					f = open(filename, "rb")
					while size > 0: 
						data = f.read(min(size, 1024))
						self.conn.send(data)
						size -= len(data)
					f.close()
				  
					ok = self.conn.recv(1024).decode("UTF-8")
					self.conn.send("Goodbye: ".encode("UTF-8"))
					self.conn.close()
			elif cmd == "DEL":
			  
				if not os.access(filename, os.R_OK) or not os.path.isfile(filename):
					self.conn.send(("ERROR: " + fileNotFound).encode("UTF-8"))
				else:
					size = os.path.getsize(filename)
					os.remove(filename)
					ok = self.conn.recv(1024).decode("UTF-8")
					self.conn.send("Goodbye: ".encode("UTF-8"))
					self.conn.close()
					
class Manager (threading.Thread):
		
		def __init__ (self,maxClients):
			#Instantiate maximum amount of clients, queue and set variables
			threading.Thread.__init__(self)
			self.maxClients = maxClients
			self.q = queue.Queue()
			self.running = set()
		
		def add(self, client):
			#Enqueue a client
			self.q.put(client)
		
		
		def run(self):
			while True:	
				kick = []
				for t in self.running:
					if not t.isAlive(): kick.append(t)
				for t in kick:
					self.running.remove(t)
				if len(self.running) < self.maxClients:
					if self.q.qsize() > 0:
						t = self.q.get()
						self.running.add(t)
						t.start()
				time.sleep(1)
					

#Main program
port = int(sys.argv[1])
maxClients = int(sys.argv[2])
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind(("", port))
s.listen(5)

#Instantiate threads and classes

manage = Manager(maxClients)
manage.start()
while True: 
	conn, address = s.accept()
	t = client(conn)
	manage.add(t)	
				
			