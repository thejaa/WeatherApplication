//
//  DataTableViewCell.swift
//  WeatherApplication
//
//  Created by Thejeswara Reddy on 26/02/21.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    var cityData : WeatherCoreData?
    @IBOutlet weak var sunrise: UILabel!
    @IBOutlet weak var chanceofrain: UILabel!
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var visibility: UILabel!
    @IBOutlet weak var sunset: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    @IBOutlet weak var cityName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func cityDetails(cityDetails : WeatherCoreData?){
        guard let weatherData = cityDetails else {return}
        cityName.text = """
            City
            \(weatherData.name ?? "")
            """
        visibility.text = """
            Visibility
            \(convertVisibilityTokm(value: Int(weatherData.visibility ?? 0.0)))
            """
        feelsLike.text = """
            Feelslike
            \(convertTemp(temp: weatherData.mainfeelslike ?? 0.0, from: .kelvin, to: .celsius))
            """
        sunrise.text = """
            Sunrise
            \(convertSunriseTime(time: Int(weatherData.sysunrise ?? 0.0)))
            """
        sunset.text = """
            Sunset
            \(convertSunriseTime(time: Int(weatherData.sysunset ?? 0.0)))
            """
        
        wind.text = """
            Wind
            \(weatherData.windspeed ?? 0.0) m/s
            """
        
        humidity.text = """
            Humidity
            \(weatherData.mainhumidity ?? 0.0)%
            """
        
        chanceofrain.text = """
            Chance of rain
            Clear sky
            """
    }
}
