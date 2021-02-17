
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

## Lazy Evaluation:

```
import Foundation
import UIKit
import Combine
import SwiftUI


func loadActiveCurrency() -> String {
  return "€"
}

func format(price: Double, currency: String) -> String {
  if price <= 5 {
    return "Free"
  } else {
    return "\(price) \(currency)"
  }
}

format(price: 9.99, currency: loadActiveCurrency())
// Rpta: "9.99 €"

//EL problema aqui es que si le paso un nuemro menor de 5, ejecuta loadActiveCurrency() y no lo usa
// No parece un problema, pero si esta funcion es algo que llama al servidor, lo estariamos llamando por nada
format(price: 3.99, currency: loadActiveCurrency())
// Rpta: "Free"
```

🌟 En programación funcional esto no ocurre, usando evaluacion perezosa , se invoca solo cuando se utilize

Otro Ejemplo:

### Estructura de datos infinita.

Este bucle no contine todos los valores en memoria, sino que cada vez que da una vuelta le pide cual es el siguiente valor.

```
import Foundation
import UIKit
import Combine
import SwiftUI

struct ValidPrices: Sequence, IteratorProtocol {
  let maxPrice: Int
  let multiplier = 10
  
  var current: Int
  var nextValue: Int
  
  init(_ range: ClosedRange<Int>) {
    current = range.lowerBound
    nextValue = range.lowerBound * multiplier
    maxPrice = range.upperBound
  }
  
  mutating func next() -> String? {
    guard current <= maxPrice else {
      return nil
    }
    let result = current
    current = nextValue
    nextValue = nextValue * multiplier
    return "\(result-1).95 €"
  }
  
}

for price in ValidPrices(1...500) {
  print(price)
}

```


El Codigo es mas complejo, es mas dificil calcular el O(1) y O(N)


Otro Ejemplo:

```
import Foundation
import UIKit
import Combine
import SwiftUI


class Cart {
  
  // 1ra version (esto se ejecutara siempre)
//  let paymentConfig = Cart.loadAndPreparePaymentConfig()

  // 2da version (Aun tenemos el problema de que se ejeucta cuando cancelas el Checkout)
//  var paymentConfig: [String: String] { Cart.loadAndPreparePaymentConfig() }

  // 3ra version (esto se ahora se ejecuta una sola vez y cuando se necesite)
  lazy var paymentConfig = Cart.loadAndPreparePaymentConfig()
  
  
  func checkout() {
    if paymentConfig["type"] == "card" {
      // Do something
    }
  }
  
  static func loadAndPreparePaymentConfig() -> [String: String] {
    print("Very expensive operation!!!")
    return ["currency":"eur","type":"card"]
  }
}

let cart = Cart()
cart.checkout()
cart.checkout()

```

Ahora no esta claro cuando se ejecuta la operacion costosa, puesto que no oimporta la veces que llamemos a "cart.checkout()" solo se ejecutara una sola vez.

🌟
## Lazy Evaluation: Inconveniente de fugas de Memoria, por que no es facil conocer cuando se necesita un valor.

