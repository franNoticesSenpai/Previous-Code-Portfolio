/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shapes;

/**
 *
 * @author scarruthers
 */
public class Rectangle {
    private double height;
    private double width;
    
    public Rectangle(){
        height = 0;
        width = 0;
    }
    public Rectangle(double h, double w){
        height = h;
        width = w;
    }
    //getters
    public double getHeight(){
        return height;
    }
    public double getWidth(){
        return width;
    }
    
    //setters
    public void setHeight(double h){
        height = h;
    }
    public void setWidth(double w){
        width = w;
    }
    
    public void print(){
        
        System.out.println("height: " + height + ", and width: " + width);
    }
}
