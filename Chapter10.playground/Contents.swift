import UIKit

var optionalDemo: String?
var optionalArr: Array<String>?


optionalArr?.insert("John", at: 0)
optionalArr?.insert("Chris", at: 1)

optionalDemo = "hello"

if var results = optionalDemo {
    print(results)
} else {
    print("No data found")
}