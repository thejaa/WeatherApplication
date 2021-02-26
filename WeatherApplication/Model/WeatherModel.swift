//
//  WeatherModel.swift
//  WeatherApplication
//
//  Created by Thejeswara Reddy on 25/02/21.
//

import Foundation

struct WeatherModel : Codable {
    let coord : Coord
    let weather : [Weather]
    let main : Main
    let wind : Wind
    let clouds : Clouds
    let sys : Sys
    let name : String
    let visibility : Double
    let dt : Double
    let timezone : Double
    let base : String
    let id : Double
    let cod : Double
    enum CodingKeys: String, CodingKey {
        case coord = "coord"
        case weather = "weather"
        case base = "base"
        case main = "main"
        case visibility = "visibility"
        case wind = "wind"
        case clouds = "clouds"
        case dt = "dt"
        case sys = "sys"
        case timezone = "timezone"
        case id = "id"
        case name = "name"
        case cod = "cod"
    }
}
struct Weather : Codable {
    let id : Int
    let main : String
    let description : String?
    let icon : String
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
}
struct Sys : Codable {
    let country : String
    let sunrise : Int
    let sunset : Int
    enum CodingKeys: String, CodingKey {
        case country = "country"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
}
struct Coord : Codable {
    let lon : Double
    let lat : Double
    enum CodingKeys: String, CodingKey {
        case lon = "lon"
        case lat = "lat"
    }
}

struct Main : Codable {
    let temp : Double
    let feels_like : Double
    let temp_min : Double
    let temp_max : Double
    let pressure : Int
    let humidity : Int
    let sea_level : Int
    let grnd_level : Int
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feels_like = "feels_like"
        case temp_min = "temp_min"
        case temp_max = "temp_max"
        case pressure = "pressure"
        case humidity = "humidity"
        case sea_level = "sea_level"
        case grnd_level = "grnd_level"
    }
}
struct Wind : Codable {
    let speed : Double
    let deg : Int
    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case deg = "deg"
    }
}
struct Clouds : Codable {
    let all : Int?
    enum CodingKeys: String, CodingKey {
        case all = "all"
    }
}
struct WeatherErrorModel : Codable{
    let cod : String
    let message : String
    enum CodingKeys: String, CodingKey {
        case cod
        case message
    }
}

