//
//  Constant.swift
//  WeatherApplication
//
//  Created by Thejeswara Reddy on 26/02/21.
//

import Foundation

func convertTimeZoneToDate(timezone : Int)-> String{
    //let timezone = -14400
    let dateFormatter = DateFormatter()
    dateFormatter.timeStyle = .short
    dateFormatter.timeZone = TimeZone(secondsFromGMT: timezone)
    return dateFormatter.string(from: Date()) // "6:39 PM"
}

func convertSunriseTime(time: Int) -> String{
    let sunriseDate = Date(timeIntervalSince1970: TimeInterval(time))
    let formatter = DateFormatter()
    formatter.dateStyle = .none
    formatter.timeStyle = .medium
    return formatter.string(from: sunriseDate) //"12:19:03 AM"
}
func convertVisibilityTokm(value:Int) -> String{
    let measurement = Measurement(value: Double(value), unit: UnitLength.meters).converted(to: .kilometers)
    let mf = MeasurementFormatter()
    mf.unitOptions = .providedUnit
    mf.unitStyle = .medium
    mf.numberFormatter.maximumFractionDigits = 1
    return mf.string(from: measurement)
}
func convertTemp(temp: Double, from inputTempType: UnitTemperature, to outputTempType: UnitTemperature) -> String {
    let mf = MeasurementFormatter()
    mf.numberFormatter.maximumFractionDigits = 0
    mf.unitOptions = .providedUnit
    let input = Measurement(value: temp, unit: inputTempType)
    let output = input.converted(to: outputTempType)
    return mf.string(from: output)
  }
