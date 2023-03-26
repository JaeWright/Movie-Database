/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package com.postgresqltutorial;

import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Date;

/**
 *
 * @author heavy
 */
public class App {
    private final String url = "jdbc:postgresql://localhost/Lab 5 2nd try";
    private final String user = "postgres";
    private final String password = "admin";
    
    public Connection connect() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Connected to the PostgreSQL server successfully.");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return conn;
    }
    private PreparedStatement setVariables(Connection conn, String[] variables,String sql) throws SQLException{
        PreparedStatement ps = conn.prepareStatement(sql);
        String temp;
        for (int i=0;i<variables.length;i++){
            if (variables[i].contains("_")){
                temp = variables[i].substring(0, variables[i].length()-1);
                ps.setInt(i+1,Integer.parseInt(temp));
 
            }else if(variables[i].contains("#")){
                temp = variables[i].substring(0, variables[i].length()-1);
                ps.setDouble(i+1,Double.parseDouble(temp));
            }
            else if(variables[i].equalsIgnoreCase("true")){
                ps.setBoolean(i+1, true);
            }
            else if(variables[i].equalsIgnoreCase("false")){
                ps.setBoolean(i+1, false);
            }else if(variables[i].contains("-")){
                Date date=Date.valueOf(variables[i]);
                ps.setDate(i+1, date);
            }else if(variables[i].contains(":")){
                Time time = Time.valueOf(variables[i]);
                ps.setTime(i+1, time);
            }
            else{
                ps.setString(i+1,variables[i]);
            }
        }
        return ps;
    }
    public void getDirectorsFromUS(){
        String sql = "SELECT \"Director Name\" FROM \"Director\" WHERE \"Country\"=\'United States\'";
        try(Connection conn = connect();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){
                System.out.println("Director Name");
                while (rs.next()){
                    System.out.println(rs.getString(1));
                }
            } catch(SQLException e){
                System.out.println(e.getMessage());
            }
    }
    
    /**
     *
     */
    public void getMoviesFromDirector(){
        String sql = """
                     SELECT \"Movie Title\"  FROM \"Director Cast\"
                     WHERE \"Director Name\" =?""";
        String[] directors = {"Quentin Tarantino"};
        try(Connection conn = connect();
            PreparedStatement preparedStatement = setVariables(conn,directors,sql);
            ResultSet rs = preparedStatement.executeQuery()){
                System.out.println("Movie Title");
                while (rs.next()){
                    System.out.println(rs.getString(1));
                }
            } catch(SQLException e){
                System.out.println(e.getMessage());
            }
    }
    
    public void getEyeColorFromActors(){
        String sql = """
                     SELECT COUNT(\"Eye color\") FROM \"Actor\"
                     WHERE \"Eye color\" = ?""";
        String[] colors = {"green"};
        try(Connection conn = connect();
            PreparedStatement preparedStatement = setVariables(conn,colors,sql);
            ResultSet rs = preparedStatement.executeQuery()){
                System.out.println("# of Actors with "+colors[0]+" eyes");
                while (rs.next()){
                    System.out.println(rs.getString(1));
                }
            } catch(SQLException e){
                System.out.println(e.getMessage());
            }
    }
    
    public void getDirectorsByLastName(){
        String sql = """
                     SELECT * FROM \"Director\" 
                     WHERE \"Director Name\" LIKE ?
                     OR \"Director Name\" LIKE ?""";
        String[] initials = {"% S%","% N%"};
        try(Connection conn = connect();
            PreparedStatement preparedStatement = setVariables(conn,initials,sql);
            ResultSet rs = preparedStatement.executeQuery()){
                System.out.println("Director Names");
                while (rs.next()){
                    System.out.println(rs.getString(2));
                }
            } catch(SQLException e){
                System.out.println(e.getMessage());
            }
    }
    
    
    
    
    //INSERTS
    public void Insert(String sql){
        try(Connection conn = connect();
            Statement stmt = conn.createStatement();
                ){
                stmt.executeUpdate(sql);
            } catch(SQLException e){
                System.out.println(e.getMessage());
            }
    }
    public void preparedInsert(String sql, String[] variables){
        try(Connection conn = connect();
            PreparedStatement stmt= setVariables(conn,variables,sql);
                ){
                stmt.executeUpdate();
            } catch(SQLException e){
                System.out.println(e.getMessage());
            }
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        App app = new App();
        app.connect();
        System.out.println("Connected");
        //Get Names of Directors from the US
        //app.getDirectorsFromUS();
        
        //Get Movies directed by director of choice
        //app.getMoviesFromDirector();
        
        //Get eye color of choice from actors
        //app.getEyeColorFromActors();
        
        //Get directors whose last names start with initial of choice
        //app.getDirectorsByLastName();
        
        
        //inserts with statements
        /*
        String[] sql = {"INSERT INTO \"Department\" VALUES (\'Theatre\',\'School A\',1000,\'Desc A\')",
                        "INSERT INTO \"Education\" VALUES (\'true\',\'Red\',\'Theatre\',\'School A\')",
                        "INSERT INTO \"Actor\" VALUES (6,\'Actor A\',2002,\'City A\',\'State A\',\'Country A\',\'yellow\',\'School A\')",
                        "INSERT INTO \"Director\" VALUES (6,\'Director A\',2000,\'City A\',\'State A\',\'Country A\',\'School A\',\'yellow\')",
                        "INSERT INTO \"Movie\" VALUES (\'Movie A\',\'1999-12-05\',7,10000,57200000)",
                        "INSERT INTO \"Actor Cast\" VALUES (\'Movie A\',\'1999-12-05\',\'Actor A\',6)",
                        "INSERT INTO \"Director Cast\" VALUES (\'Director A\',6,\'Movie A\',\'1999-12-05\')",
                        "INSERT INTO \"Type of movie\" VALUES (\'Horror\',\'Random info A\')",
                        "INSERT INTO \"Movie Genre\" VALUES (\'Movie A\',\'Horror\',\'1999-12-05\')",
                        "INSERT INTO \"Festivals\" VALUES (\'Festival F\',\'2002-03-14\')",
                        "INSERT INTO \"Festival Appearances\" VALUES (\'Festival F\',\'Movie A\',\'1999-12-05\')",
                        "INSERT INTO \"Type of Award\" VALUES (6,\'Category A\',\'Institution A\')",
                        "INSERT INTO \"Awards\" VALUES (6,\'Movie A\',\'1999-12-05\')",
                        "INSERT INTO \"Cinema\" VALUES (\'Cinema A\',\'Location A\',12.99,\'2022-09-15\',\'15:45:00\',\'17:45:00\',\'Hall A\')",
                        "INSERT INTO \"Tickets and Showtimes\" VALUES (\'Cinema A\',\'Location A\',\'Movie A\',\'1999-12-05\')"};
        
        for (int i=0;i<sql.length;i++){
            app.Insert(sql[i]);
        }
        */
        
        //inserts with prepared statements
        String[] sql2 = {"INSERT INTO \"Department\" VALUES (?,?,?,?)",
                        "INSERT INTO \"Education\" VALUES (?,?,?,?)",
                        "INSERT INTO \"Actor\" VALUES (?,?,?,?,?,?,?,?)",
                        "INSERT INTO \"Director\" VALUES (?,?,?,?,?,?,?,?)",
                        "INSERT INTO \"Movie\" VALUES (?,?,?,?,?)",
                        "INSERT INTO \"Actor Cast\" VALUES (?,?,?,?)",
                        "INSERT INTO \"Director Cast\" VALUES (?,?,?,?)",
                        "INSERT INTO \"Type of movie\" VALUES (?,?)",
                        "INSERT INTO \"Movie Genre\" VALUES (?,?,?)",
                        "INSERT INTO \"Festivals\" VALUES (?,?)",
                        "INSERT INTO \"Festival Appearances\" VALUES (?,?,?)",
                        "INSERT INTO \"Type of Award\" VALUES (?,?,?)",
                        "INSERT INTO \"Awards\" VALUES (?,?,?)",
                        "INSERT INTO \"Cinema\" VALUES (?,?,?,?,?,?,?)",
                        "INSERT INTO \"Tickets and Showtimes\" VALUES (?,?,?,?)"};
        
        
        String movie="Movie B",actor="Actor B",director="Director B",department="Theatre",uni="School B",uniDesc="Desc B";
        String uniColor = "Orange",city="City B",state="State B",country="Country B",eye="brown",movDate="1997-09-14",genre="Comedy",genDesc="Info B";
        String festival = "Festival G",fesDate="2004-05-19",category="Category B",institute="Institution B",cinema="Cinema B",location="Location B";
        String cinTime = "15:35:00",cinDur="18:10:00",cinHall="Hall B",cinDate="2009-05-19";
        //strings to be converted to int
        String numStudents = "2000_",id="7_",birth="1980_",rating="9_",budget="2000_",gross="10000_",price = "11.99#";
        //string to become boolean
        String pub = "true";
        /*
        String [] values = {department,uni,numStudents,uniDesc};
        app.preparedInsert(sql2[0],values);
        String [] values2 = {pub,uniColor,department,uni};
        app.preparedInsert(sql2[1],values2);
        String [] values3 = {id,actor,birth,city,state,country,eye,uni};
        app.preparedInsert(sql2[2],values3);
        String [] values4 = {id,director,birth,city,state,country,uni,eye};
        app.preparedInsert(sql2[3],values4);
        String [] values5 = {movie,movDate,rating,budget,gross};
        app.preparedInsert(sql2[4],values5);
        String[] values6 = {movie,movDate,actor,id};
        app.preparedInsert(sql2[5],values6);
        String[] values7 = {director,id,movie,movDate};
        app.preparedInsert(sql2[6],values7);
        String[] values8 = {genre,genDesc};
        app.preparedInsert(sql2[7],values8);
        String [] values9 = {movie,genre,movDate};
        app.preparedInsert(sql2[8],values9);
        String [] values10 = {festival,fesDate};
        app.preparedInsert(sql2[9],values10);
        String [] values11 = {festival,movie,movDate};
        app.preparedInsert(sql2[10],values11);
        String [] values12 = {id,category,institute};
        app.preparedInsert(sql2[11],values12);
        String [] values13 = {id,movie,movDate};
        app.preparedInsert(sql2[12],values13);
        String [] values14 = {cinema,location,price,cinDate,cinTime,cinDur,cinHall};
        app.preparedInsert(sql2[13],values14);
        String [] values15 = {cinema,location,movie,movDate};
        app.preparedInsert(sql2[14],values15);
        */
    }
    
}

