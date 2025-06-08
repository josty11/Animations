//
//  WeatherModel.swift
//  Animations
//
//  Created by Tatiana on 04/06/25.
//

import SwiftUI

struct WeatherModel {
    let day: String
    let data: CGFloat
    
    //Weekly temperature data
    static let temperature: [WeatherModel] = [
        .init(day: "Su", data: 0.9),
        .init(day: "M", data: 0.7),
        .init(day: "T", data: 0.9),
        .init(day: "W", data: 0.8),
        .init(day: "Th", data: 0.75),
        .init(day: "F", data: 0.65),
        .init(day: "Sa", data: 0.85)
    ]
    
    //Weekly precipitation data
    static let precipitation: [WeatherModel] = [
        .init(day: "Su", data: 0.4),
        .init(day: "M", data: 0.6),
        .init(day: "T", data: 0.2),
        .init(day: "W", data: 0.3),
        .init(day: "Th", data: 0.4),
        .init(day: "F", data: 0.9),
        .init(day: "Sa", data: 0.5)
    ]
    
    //Weekly winf percentage data
    static let wind: [WeatherModel] = [
        .init(day: "Su", data: 0.8),
        .init(day: "M", data: 0.4),
        .init(day: "T", data: 0.3),
        .init(day: "W", data: 0.3),
        .init(day: "Th", data: 0.5),
        .init(day: "F", data: 0.3),
        .init(day: "Sa", data: 0.2)
    ]
    
}
