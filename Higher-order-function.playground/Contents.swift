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

protocol Logger {
    func print(_ msg: String)
}

class ConsoleLogger : Logger {
    func print(_ msg: String) {
        logToConsole(msg)
    }
}

class FileLogger : Logger {
    func print(_ msg: String) {
        logToFile(msg)
    }
}

class WindowsLogger : Logger {
    func print(_ msg: String) {
        logToWindow(msg)
    }
}

func getValue(from number: Int, loggerType: Logger) -> String {
    
    let result = "something \(number)"
    
    loggerType.print(result)
    return result
}

getValue(from: 5, loggerType: ConsoleLogger())
