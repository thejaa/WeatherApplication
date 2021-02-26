//
//  AppServerClient.swift
//  WeatherApplication
//
//  Created by Thejeswara Reddy on 25/02/21.
//

import Foundation

enum GetWeatherFailureReason: Int, Error {
    case unAuthorized = 401
    case notFound = 404
}
class AppServerClient{
    static let shared = AppServerClient()
    typealias GetWeatherResult = Result<WeatherModel, GetWeatherFailureReason>
    typealias GetWeatherCompletion = (_ result: GetWeatherResult) -> Void
    var weather:WeatherModel?
    func getWeatherData(city:String,completion: @escaping GetWeatherCompletion) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=f2be6c362b060a0e137529aac3ed2f5d")
        guard let urlWeather = url else { return }
        var request = URLRequest(url: urlWeather)
        request.httpMethod = "GET"
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            
            if let error = responseError {
                print(error)
            } else if let jsonData = responseData {
                do {
                    self.weather = try JSONDecoder().decode(WeatherModel.self, from: jsonData)
                    guard let weatherData = self.weather else {return}
                    completion(.success(weatherData))
                } catch {
                    debugPrint("Errorrr error \(error.localizedDescription)")
                    completion(.failure(GetWeatherFailureReason.notFound))
                }
            }
        }
        task.resume()
    }
}
