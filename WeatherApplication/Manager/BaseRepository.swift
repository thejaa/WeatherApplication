//
//  BaseRepository.swift
//  WeatherApplication
//
//  Created by Thejeswara Reddy on 26/02/21.
//

import Foundation

protocol BaseRepository {
    
    associatedtype T
    
    func create(record:T)
    func get(byCity city:String) -> T?
}
