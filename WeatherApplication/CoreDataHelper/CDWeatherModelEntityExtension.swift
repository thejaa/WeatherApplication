//
//  CDWeatherModelEntityExtension.swift
//  WeatherApplication
//
//  Created by Thejeswara Reddy on 26/02/21.
//

import Foundation

extension WeatherModelEntity {
    func convertToWeather() -> WeatherCoreData
    {
        let weather = WeatherCoreData()
        weather.name = self.name
        weather.cod = self.cod
        weather.dt = self.dt
        weather.timezone = self.timezone
        weather.base = self.base
        weather.visibility = self.visibility
        weather.id = self.id
        weather.mainfeelslike = self.mainfeelslike
        weather.mainhumidity = self.mainhumidity
        weather.sysunrise = self.sysunrise
        weather.sysunset = self.sysunset
        weather.winddeg = self.winddeg
        weather.windspeed = self.windspeed
        return weather
    }
}
