import UIKit

// (Strinfg) -> Void
func logToConsole(_ msg: String) {
    print(msg + " From Console")
}

func logToFile(_ msg: String) {
    print(msg + " From File")
}

func logToWindow(_ msg: String) {
    print(msg + " From Windows")
}

func getValue(from number: Int, loggerType: (String)->()) -> String {
    
    let result = "something \(number)"
    
    loggerType(result)
    return result
}

getValue(from: 5, loggerType: logToWindow)
