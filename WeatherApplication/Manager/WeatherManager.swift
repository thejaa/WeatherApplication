//
//  WeatherManager.swift
//  WeatherApplication
//
//  Created by Thejeswara Reddy on 26/02/21.
//

import Foundation

class WeatherManager {
    private let _weatherDataRepository = WeatherDataRepository()
    
    func createWeatherByCity(record: WeatherCoreData) -> Bool
    {
        _weatherDataRepository.create(record: record)
        return true
    }
    func getWeatherCity(name: String) -> WeatherCoreData?{
        let cityWeather = _weatherDataRepository.get(byCity: name)
        return cityWeather
    }
}
