<%-- 
    Document   : PA#1 Part 1
    Created on : Jan 29, 2013, 9:28:41 PM
    Author     : christinachoe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <!DOCTYPE html>
<html>
  <head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
      table {
        margin-left: auto;
        margin-right: auto;
      }
      td {
        border: 1px solid black;
        width: 50px;
        height: 50px;
        background: white;
        text-align: center;
      }
    </style>
    
    <script type="text/javascript">
    
      var SIZE = 4;
      var WHITE = '#FFFFFF', BLACK='#000000';  // tile colors
      var blankRow = 3, blankCol = 3;  // location of the blank
      
      // initial tile values
      var tileValues = [ 
        [1, 2, 3, 4], 
        [5, 6, 7, 8], 
        [9, 10, 11, 12], 
        [13, 14, 15, 0] ];
        
      /*
       * Display the initial tile configuration.
       */
      window.onload = function() { displayTiles(); };
      
      /*
       * Return a reference to the tile at the specified row and col (zero-based).
       */
      function getTile(row, col) {
        return document.getElementById('b'+row+col);
      }

      /*
       * Display the tiles as defined in the array.
       */
      function displayTiles() {
        for (var r=0; r<SIZE; r++) {
          for (var c=0; c<SIZE; c++) {
            if (tileValues[r][c] == 0) {
              getTile(r, c).style.background = BLACK; 
            }
            else {
              getTile(r, c).style.background = WHITE;
              getTile(r, c).innerHTML = tileValues[r][c]; 
            }
          }
        }
      }
      
      /*
       * Handle a button click on a tile.
       */
      function handle(row, col) {
        // If a tile above, below, left, or right of the blank tile is clicked,
        //   those two tiles should be swapped, and the tiles redisplayed. 
        // All relevant variables must be updated in the move.
        
        // For now, this function just displays the row and column.
        alert(''+ row + col);
      
        // handle the button click here ...
        var i;
        var j;
        
        for (i = 0; i < SIZE; i++){//go through rows
            for (j = 0; j < SIZE; j++){//go through columns
               if (tileValues[i][j] == 0){
                    if(i+1 == row || i - 1 == row){//ensure the click is 
                        if(j==col){//adjacent
                    getTile(i, j).style.background = WHITE;//make tile white
                    tileValues[i][j] = tileValues[row][col];//switch values
                    tileValues[row][col]=0;
                    getTile(row, col).style.background = BLACK;//make tiles 
                                                               //black
                    getTile(i, j).innerHTML = tileValues[i][j];
                    }
                    }else
                        if(j+1==col || j-1==col){//ensure click
                            if(i==row){//is adjacent
                    getTile(i, j).style.background = WHITE;
                    tileValues[i][j] = tileValues[row][col];
                    tileValues[row][col]=0;
                    getTile(row, col).style.background = BLACK;
                    getTile(i, j).innerHTML = tileValues[i][j];
                            }
                        }
               }
                    
            }
                
         }   
      }
      
      /*
       * Shuffle tiles by moving the blank spot (0) randomly, 100 times.
       *
       */
      function randomize() {
          //declarations
          var track = 0;
          var rRand;
          var cRand;
          var i;
          var j;
          
          while (track < 100){
        
          for (i = 0; i < SIZE; i++){//check row
            for (j = 0; j < SIZE; j++){//check column
               if (tileValues[i][j] == 0){
                   rRand = Math.floor((Math.random()*4));//random number
                   cRand = Math.floor((Math.random()*4));//random number
                   getTile(i, j).style.background = WHITE;
                    tileValues[i][j] = tileValues[rRand][cRand];
                    tileValues[rRand][cRand]=0;
                    getTile(rRand, cRand).style.background = BLACK;
                    getTile(i, j).innerHTML = tileValues[i][j];
                   
               }
            }
        }
            track++;
           }
      }
     
      
            
    </script>

  </head>
  <body>
    <p>
       The goal of this game is to put the tiles in order, from 1 to 15 (starting at upper left).
       <br/>
       When a tile that is adjacent to the blank (black) tile is clicked, that tile and the blank
       should change places.
       <br/>
       Start by randomizing the tiles!
    </p>
    <hr/>

    <table>
      <tbody>
        <tr>
          <td id="b00" onclick="handle(0, 0);"></td>
          <td id="b01" onclick="handle(0, 1);"></td>
          <td id="b02" onclick="handle(0, 2);"></td>
          <td id="b03" onclick="handle(0, 3);"></td>
        </tr>
        <tr>
          <td id="b10" onclick="handle(1, 0);"></td>
          <td id="b11" onclick="handle(1, 1);"></td>
          <td id="b12" onclick="handle(1, 2);"></td>
          <td id="b13" onclick="handle(1, 3);"></td>
        </tr>       
        <tr>
          <td id="b20" onclick="handle(2, 0);"></td>
          <td id="b21" onclick="handle(2, 1);"></td>
          <td id="b22" onclick="handle(2, 2);"></td>
          <td id="b23" onclick="handle(2, 3);"></td>
        </tr>        
        <tr>
          <td id="b30" onclick="handle(3, 0);"></td>
          <td id="b31" onclick="handle(3, 1);"></td>
          <td id="b32" onclick="handle(3, 2);"></td>
          <td id="b33" onclick="handle(3, 3);"></td>
        </tr>
      </tbody>
    </table>

    <hr/>
    <input type="button" onclick="randomize();" value="Randomize"/>
  </body>
</html>

