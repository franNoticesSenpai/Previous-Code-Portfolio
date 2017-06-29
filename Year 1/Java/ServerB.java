package comp173.lab5;
//Imports 
import java.net.*;
import java.io.*;
import java.nio.charset.Charset;
import java.lang.Number.*;
//Socket stuff.
public class ServerB {

    public static final int MASK_HIGH = 255 << 24;
    public static final int MID_RIGHT = 255 << 16;
    public static final int MID_LEFT = 255 << 8;
    public static final int MASK_LOW = 255;
    public static final int mask_upper = 15 << 4;
    public static final int mask_lower = 15;
    boolean alwaysTrue = true;

    public static void main(String[] args) throws IOException{
       ServerSocket s = new ServerSocket(Integer.parseInt(args[0]));

        while(true){
            byte [] data = new byte [7];
            byte [] response =  new byte[4];


            int result = 0;

            Socket accept = s.accept();
            BufferedInputStream bin = new BufferedInputStream(accept.getInputStream());
            PrintWriter pw = new PrintWriter(new PrintWriter(accept.getOutputStream(), true));
            DataOutputStream dos = new  DataOutputStream(accept.getOutputStream());
            pw.write("ready");
            pw.flush();
            bin.read(data);
            int [] nums = new int [data[1]];
            int index = 2;
            for (int i = 0; i < data[1]; i++){
                int x = data[index];
                if (i % 2 == 0){
                    nums[i] = ((x & mask_upper) >>> 4);
                }
                else{
                    nums[i] = (x & mask_lower);
                    index++;
                }
            }
            if (data[0] == 1){
                    result = 0;

                    for (int j : nums){
                            result += j;
                    }
            }

            if (data[0] == 2){
                    result = nums[0];

                    for (int i = 1; i < nums.length; i++){
                        result-= nums[i];
                    }

            }
            if (data[0] == 4){
                result = 1;
                for (int j : nums){
                    result *= j;
                }
            }

            dos.writeInt(result);
            dos.flush();
        }
    }
}

           
      
