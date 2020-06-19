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

logToConsole("Hello Swift FP ")
