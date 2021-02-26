//
//  WeatherRepository.swift
//  WeatherApplication
//
//  Created by Thejeswara Reddy on 26/02/21.
//

import Foundation
import CoreData

protocol  WeatherRepository : BaseRepository {
    
}
struct WeatherDataRepository : WeatherRepository {
    
    typealias T = WeatherCoreData
    
    func get(byCity city: String) -> WeatherCoreData? {
        let weather = getWheather(byCity: city)
        guard weather != nil else { return nil}
        return (weather?.convertToWeather())!
    }
    
    func create(record: WeatherCoreData) {
        let weatherData = WeatherModelEntity(context: PersistentStorage.shared.context)
        weatherData.name = record.name
        weatherData.base = record.base
        weatherData.id = record.id ?? 0.0
        weatherData.timezone = record.timezone ?? 0.0
        weatherData.cod = record.cod ?? 0.0
        weatherData.dt = record.dt ?? 0.0
        weatherData.visibility = record.visibility ?? 0.0
        weatherData.winddeg = record.winddeg ?? 0.0
        weatherData.windspeed = record.windspeed ?? 0.0
        weatherData.mainhumidity = record.mainhumidity ?? 0.0
        weatherData.mainfeelslike = record.mainfeelslike ?? 0.0
        weatherData.sysunrise = record.sysunrise ?? 0.0
        weatherData.sysunset = record.sysunset ?? 0.0
        PersistentStorage.shared.saveContext()
    }
    
    private func getWheather(byCity city: String) -> WeatherModelEntity?
    {
        let fetchRequest = NSFetchRequest<WeatherModelEntity>(entityName: "WeatherModelEntity")
        let fetchByName = NSPredicate(format: "name==%@",city)
        fetchRequest.predicate = fetchByName
        
        let result = try! PersistentStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}
        
        return result.first
    }
}
