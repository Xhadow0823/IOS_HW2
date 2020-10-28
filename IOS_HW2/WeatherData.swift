//
//  WeatherData.swift
//  2020_iOS_hw3
//
//  Created by 翁星宇 on 2020/10/28.
//  Copyright © 2020 Hannn. All rights reserved.
//

import Foundation
import SwiftUI

struct Weather {
    let name: String;
    let pPath: String;
};

let weatherList: [Weather] = [
    Weather(name: "晴天", pPath: "sun.max"),
    Weather(name: "雨天", pPath: "cloud.heavyrain"),
    Weather(name: "陰天", pPath: "cloud"),
    Weather(name: "颳風天", pPath: "wind"),
    Weather(name: "龍捲風", pPath: "tornado"),
    Weather(name: "下雪天", pPath: "cloud.snow")
]
