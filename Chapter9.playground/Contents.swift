import UIKit

class playingWithSubscripts {
    var playingArray = ["Chris", "Sally", "Hayley", "David", "Pauline"]
    
    subscript(index: Int) -> String {
        get {
            return playingArray[index]
        }
        set {
            playingArray[index] = newValue
        }
    }
}

var demo = playingWithSubscripts()
print(demo[0])

demo[0] = "Christopher"
demo.playingArray.insert("Six Ducks", at: 0)

for name in demo.playingArray {
    print(name)
}





struct caluclationDemo {
    var sumValue: Int
    
    subscript(multiply number: Int) -> Int {
        return sumValue * number
    }
    subscript(add number: Int) -> Int {
        return sumValue + number
    }
}

var equation = caluclationDemo(sumValue: 10)
print(equation[multiply: 6])
print(equation[add: 10])




struct NortsCrosses {
    var board = [["", "", ""], ["", "", ""], ["", "", ""]]
    
    subscript(x: Int, y: Int) -> String {
        get {
            return board[x][y]
        }
        set {
            board[x][y] = newValue
        }
    }
}

var board = NortsCrosses()
board[2,1] = "x"
board[1,1] = "0"
