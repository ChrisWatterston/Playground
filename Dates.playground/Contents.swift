//: Playground - noun: a place where people can play

import UIKit


// To create a Date representing the current date and time,
// simply initialize a new Date.
let now = Date()


// The other initializers expect arguments of type TimeInterval,
// which is a typealias for Double.


// To create a Date a specified number of seconds before or after
// the current date and time, use the "timeIntervalSinceNow" initializer.
let fiveMinutesAgo = Date(timeIntervalSinceNow: -5 * 60)
let fiveMinutesFromNow = Date(timeIntervalSinceNow: 5 * 60)


// To create a Date relative to Swift's reference date and time,
// use the "timeIntervalSinceReferenceDate" initializer.

// The first mobile phone call was made on April 3, 1973.
// We don't know the exact time the call was made, but it happened
// sometime during business hours in New York City, in the U.S. Eastern
// Time Zone. Noon that day was 875,602,800 seconds prior to the
// reference date and time.
let firstMobileCallDate = Date(timeIntervalSinceReferenceDate: -875_602_800)

// The "Stevenote" where the iPhone was introduced started on January 9, 2007,
// 10 a.m. Pacific time, 190,058,400 seconds after the reference date and time.
let iPhoneStevenoteDate = Date(timeIntervalSinceReferenceDate: 190_058_400)


// Unix time (a.k.a. POSIX time or Epoch Time) is the way time is represented
// by Unix, Unix-like, and other operating systems. It defines time as a
// number of seconds after the Unix Epoch, January 1, 1970, 00:00:00 UTC.
// To create a Date relative to the Unix Epoch, use the
// "timeIntervalSince1970" initializer.
let oneYear = TimeInterval(60 * 60 * 24 * 365)
let newYears1971 = Date(timeIntervalSince1970: oneYear)
let newYears1969 = Date(timeIntervalSince1970: -oneYear)


// To create a Date relative to another Date, use the
// "timeInterval:Since:" initializer.

// The "Stevenote" where the iPad was introduced started on January 27, 2010,
// 10 a.m. Pacific time, 96,249,600 seconds after the start of the iPhone Stevenote
// three years earlier.
let secondsBetweeniPhoneAndiPadStevenote = TimeInterval(96_249_600)
let iPadStevenoteDate = Date(timeInterval: secondsBetweeniPhoneAndiPadStevenote,
                             since: iPhoneStevenoteDate)







// The user's calendar incorporates the user's locale and
// time zone settings, which means it's the one you'll use
// most often.
let userCalendar = Calendar.current

// March 10, 1876: The day Alexander Graham Bell
// made the first land line phone call
// ---------------------------------------------
// DateComponents' init method is very thorough, but very long,
// especially when we're providing only 3 pieces of information
let firstLandPhoneCallDateComponents = DateComponents(calendar: nil,
                                                      timeZone: nil,
                                                      era: nil,
                                                      year: 1876,
                                                      month: 3,
                                                      day: 10,
                                                      hour: nil,
                                                      minute: nil,
                                                      second: nil,
                                                      nanosecond: nil,
                                                      weekday: nil,
                                                      weekdayOrdinal: nil,
                                                      quarter: nil,
                                                      weekOfMonth: nil,
                                                      weekOfYear: nil,
                                                      yearForWeekOfYear: nil)

// With a calendar and a year, month, and day defined in
// a DateComponents struct, we can build a date
let firstLandPhoneCallDate = userCalendar.date(from: firstLandPhoneCallDateComponents)!
firstLandPhoneCallDate.timeIntervalSinceReferenceDate







// April 3, 1973: The day Martin Cooper
// made the first cellular phone call
// ------------------------------------
// This time, we'll create a blank DateComponents struct
// and set its year, month, and day properties.
var firstCellPhoneCallDateComponents = DateComponents()
firstCellPhoneCallDateComponents.year = 1973
firstCellPhoneCallDateComponents.month = 4
firstCellPhoneCallDateComponents.day = 3

let firstCellPhoneCallDate = userCalendar.date(from: firstCellPhoneCallDateComponents)!
firstCellPhoneCallDate.timeIntervalSinceReferenceDate


// The first Friday in June, 2017:
// National Donut Day
// -------------------------------
var donutDayComponents = DateComponents()
donutDayComponents.year = 2017
donutDayComponents.month = 6
// We're looking for a Friday...
donutDayComponents.weekday = 6
// ...and it needs to be the first Friday of the month
donutDayComponents.weekdayOrdinal = 1

let donutDayDate = userCalendar.date(from: donutDayComponents)!









