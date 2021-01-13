import UIKit



//Starting at the top left corner of an N x M grid and facing towards the right, you keep walking one square at a time in the direction you are facing. If you reach the boundary of the grid or if the next square you are about to visit has already been visited, you turn right. You stop when all the squares in the grid have been visited. What direction will you be facing when you stop? For example: Consider the case with N = 3, M = 3. The path followed will be (0,0) -> (0,1) -> (0,2) -> (1,2) -> (2,2) -> (2,1) -> (2,0) -> (1,0) -> (1,1). At this point, all squares have been visited, and you are facing right.

// Input specification The first line contains T the number of test cases. Each of the next T lines contain two integers N and M, denoting the number of rows and columns respectively.


// Output specification Output T lines, one for each test case, containing the required direction you will be facing at the end. Output L for left, R for right, U for up, and D for down. 1 <= T <= 5000, 1 <= N,M <= 10^9.


var t = 4

var m = 10  //row
var n = 10  //columns



func getFinalDirection( m: Int, n: Int){
    let max = pow(10,9)
    if Decimal(n) <= (max) {
        if 1 <=  m {
            if m > n {
                if m % 2 == 0 {
                    print("D")
                } else {
                    print("U")
                }
                
            } else {
                if m % 2 == 0 {
                    print("L")
                } else{
                    print("R")
                }
            }
        }else{
            print(" m tiene que  ser mayor o igual a 1")
        }
    }
    else{
        print("El numero de columnas es muy grande, no debe ser mayor a 10^9")
    }
   
    
}

    
getFinalDirection(m: 10 , n: 11)

//No entendi lo de T pero la logica de  a que lado termina viendo ya esta 
