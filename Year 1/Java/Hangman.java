/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Hangman;
import java.util.Scanner;
import java.util.Random;


/**
 *
 * @author Tyler
 */
public class Hangman {
static final int NUM_OF_GUESSES = 6;

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner getInput = new Scanner (System.in);
        boolean playingTheGame = true; 
        Random ran = new Random();
        String gameOver = "Game over";
        String []  arrayOfWords = {"Chie", "Yosuke", "Yukiko"};
        char[] randomsWordz = arrayOfWords[ran.nextInt(arrayOfWords.length)].toCharArray();
        char[] canIHazPlayerInput = new char [NUM_OF_GUESSES];
        
        
        while (playingTheGame){
        System.out.println("Let's play some Hangman! Press p to play, or q to quit. If you want to leave the super exciting game of"
                + "hangman anytime while playing the game, just press '~' to stop.");
        String userInput = getInput.nextLine().toLowerCase();
        if(userInput.equals("q")){
            System.out.println(gameOver);
            break;
        }
        else if(userInput.equals("p")){
        System.out.println("This does work, I swear.");

        for (int i = 0; i < canIHazPlayerInput.length; i++){
            canIHazPlayerInput[i] = '_';
        }
        
        
        
        boolean correctWord = false; 
        int fetalAttempts = 0;
        
        while (!correctWord && fetalAttempts != NUM_OF_GUESSES){
            System.out.println("Current guesses: ");
            printSpacesArray(canIHazPlayerInput);
            System.out.printf("Player has %d tries left.\n", NUM_OF_GUESSES - fetalAttempts);
            System.out.println("Enter a single character!");
            char input = getInput.nextLine().charAt(0);
            fetalAttempts++;
            
            if (input == '~'){
                playingTheGame = false;
                correctWord = true;
                break;
            }
            else { 
                for (int j = 0; j < randomsWordz.length; j++){
                    if (isWordFilled(canIHazPlayerInput)){
                        correctWord = true;
                        System.out.println("Congrats! YOU DID ITT!");
                        
                    }
                }
                
            }
            
            
        }
        if (!correctWord){
                    System.out.println("You ran out of guesses and luck!");
                    System.out.println("However, hope is not lost. Play again? (Totally/Nope)");
                    String oneMoreTime = getInput.nextLine().toLowerCase(); 
                        if (oneMoreTime.equals("nope")){
                            playingTheGame = false;
                        }
                }
        else{
            System.out.println("Y user, y? Wot R U Doing? Stahp...");
            return;
            
        }   
      }
    }
 }
   public static void printSpacesArray (char[] arr_print){
       for (int i = 0; i < arr_print.length; i++ ){
            System.out.println(arr_print[i] + " ");
            
       }
       System.out.println();
   }
   public static boolean isWordFilled (char[] arr_guess){
       for (int i = 0; i < arr_guess.length; i++ ){
           if (arr_guess[i] == '_') return false;
       }
       return true;
   } 
       
}


