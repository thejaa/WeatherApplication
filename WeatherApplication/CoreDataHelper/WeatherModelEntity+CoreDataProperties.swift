//
//  WeatherModelEntity+CoreDataProperties.swift
//  WeatherApplication
//
//  Created by Thejeswara Reddy on 26/02/21.
//
//

import Foundation
import CoreData


extension WeatherModelEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherModelEntity> {
        return NSFetchRequest<WeatherModelEntity>(entityName: "WeatherModelEntity")
    }

    @NSManaged public var base: String?
    @NSManaged public var cod: Double
    @NSManaged public var dt: Double
    @NSManaged public var id: Double
    @NSManaged public var name: String?
    @NSManaged public var timezone: Double
    @NSManaged public var visibility: Double
    @NSManaged public var winddeg: Double
    @NSManaged public var windspeed: Double
    @NSManaged public var sysunset: Double
    @NSManaged public var sysunrise: Double
    @NSManaged public var mainhumidity: Double
    @NSManaged public var mainfeelslike: Double

}
