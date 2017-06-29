package comp173.lab5;
//Imports 
import java.net.*;
import java.io.*;
import java.lang.Number.*;

public class ClientB{
	
    public static void main (String[] args) throws IOException{
            byte [] data = new byte [7];

            //Checking for arithmetic operators.
            if (args[2].equalsIgnoreCase("+")){
                data[0] = 1;
            }
            else if (args[2].equalsIgnoreCase("-")){
                data[0] = 2;
            }
            else if (args[2].equalsIgnoreCase("*")){
                data[0] = 4;
            }

            //Packing in the nibbles

            int [] arguments = new int[args.length - 3];
            for (int i = 3; i < args.length; i++){
                arguments[i - 3] = Integer.parseInt(args[i]);
            }
            data[1] = (byte)(arguments.length);
            for(int i = 0; i < data[1]; i++){
                if(i % 2 == 0){                        
                    data[i / 2 + 2] = (byte)((arguments[i] & 0b1111) << 4);
                }else{                        
                    data[i / 2 + 2] |= (byte)((arguments[i] & 0b1111));
                }
            }
            
            //Creating Socket objects and sending/recieving to and from server
            Socket s = new Socket(args[0], Integer.parseInt(args[1]));
            
            BufferedReader br = new BufferedReader(new InputStreamReader(s.getInputStream()));
            BufferedOutputStream bos = new BufferedOutputStream(s.getOutputStream());
            DataInputStream dis = new DataInputStream(s.getInputStream());
            
            char [] ready = new char [5];
            br.read(ready);
            
            bos.write(data);
            bos.flush();
            byte [] data2 = new byte [40];
            
            System.out.println(dis.readInt());
    }
}

