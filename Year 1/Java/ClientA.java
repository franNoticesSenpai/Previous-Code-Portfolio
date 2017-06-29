package comp173.lab5;
//Imports 
import java.net.*;
import java.io.*;
import java.lang.Number.*;

public class ClientA{
	
	public static void main (String[] args) throws IOException{
		byte [] data = new byte [7];
               
		//Checking for arithmetic operators.
		if (args[3] == "+"){
                    data[0] = 1;
		}
		else if (args[3] == "-"){
                    data[0] = 2;
		}
		else if (args[3] == "*"){
                    data[0] = 4;
		}

		//Packing in the nibbles
		
                int [] arguments = new int[args.length - 4];
                for (int i = 4; i < args.length; i++){
                        arguments[i - 4] = Integer.parseInt(args[i]);
                    }       
                
		data[1] = (byte)(arguments.length);
		int j = 2;
		for(int i = 0; i < arguments.length; i++){
			int a = arguments[i];
			int b = 0;
			if (i+1 < arguments.length){
				b = arguments[i+1];
				int x = a << 4;
				x = x | b;
				data[j] = (byte)x;
				j++;
			}
		}

		//Creating Socket objects and sending/recieving to and from server
		InetAddress addr = InetAddress.getByName("localhost");
		Socket s = new Socket(addr, Integer.parseInt(args[1]));
                BufferedInputStream bin = new BufferedInputStream(s.getInputStream());
                BufferedOutputStream bos = new BufferedOutputStream(s.getOutputStream());
                byte [] ready = new byte [5];
                bin.read(ready);
                bos.write(data);
                bos.flush();
                byte [] data2 = new byte [4];
                bin.read(data2);
                int result;
                
                result = data2[0] << 24;
                result = result | (data2[1] << 16);
                result = result | (data2[2] << 8);
                result = result | (data2[3]);
                
                System.out.println(result);
                
                
                
                
                
                
		



	}
/*s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect ( (sys.argv[1], port) )
s.sendall (data)
data2 = bytearray(4)
s.recv_into(data2)
result = data2[0] << 24
result = result | (data2[1] << 16)
result = result | (data2[2] << 8)
result = result | (data2[3])
if (result >= 2 ** 31):
		result -= 2 ** 32
print (result)
*/

}

