
```
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

enum Logger {
    case Console, File, Windows
    
    var print: (String) -> () {
        switch self {
        case .Console:
            return logToConsole
        case .File:
            return logToFile
        case .Windows:
            return logToWindow
        }
    }
}

func getValue(from number: Int, loggerType: Logger) -> String {
    
    let result = "something \(number)"
    
    loggerType.print(result)
    return result
}

getValue(from: 5, loggerType: .Windows)
```
