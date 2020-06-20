import UIKit

// (Strinfg) -> Void
func logToConsole(_ msg: String) {
    print(msg + "From Console")
}

func logToFile(_ msg: String) {
    print(msg + "From File")
}

func logToWindow(_ msg: String) {
    print(msg + "From Windows")
}

func getValue(from number: Int, loggerType: Int) -> String {
    
    let result = "something \(number)"
    
    switch loggerType {
    case 1:
        logToConsole(result)
    case 2:
        logToWindow(result)
    case 3:
        logToFile(result)
    default:
        break
    }
    return result
}

getValue(from: 5, loggerType: 1)
