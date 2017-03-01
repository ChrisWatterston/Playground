//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let now = Date()

let formatter = DateFormatter()
formatter.dateStyle = .short
formatter.timeStyle = .medium

let dateStr = formatter.string(from: now)


let formatter2 = DateFormatter()
formatter2.dateFormat = "YYYY-MM-dd HH:mm:ss"

let dateStr2 = formatter2.string(from: now)


let dateStr3 = "2016-08-19 16:32:02"
let date = formatter2.date(from: dateStr3)


