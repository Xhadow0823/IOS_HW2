//
//  CityData.swift
//  2020_iOS_hw3
//
//  Created by 翁星宇 on 2020/10/28.
//  Copyright © 2020 Hannn. All rights reserved.
//

import Foundation
import SwiftUI

struct City {
    var name: String;
    let latitude: Double;
    let longitude: Double;
    let pPath: String;
};


var cities: [City] = [
    City(name: "臺北市",latitude: 25.0375417,longitude: 121.562244 , pPath: "台北"),
    City(name: "新北市",latitude: 25.0123025,longitude: 121.4632665, pPath: "新北"),
    City(name: "桃園市",latitude: 24.9931569,longitude: 121.2988176, pPath: "桃園"),
    City(name: "台中市",latitude: 24.1618329,longitude: 120.6446744, pPath: "台中"),
    City(name: "台南市",latitude: 23.1414893,longitude: 120.109876 , pPath: "台南"),
    City(name: "高雄市",latitude: 22.6208866,longitude: 120.2768455, pPath: "高雄"),
    City(name: "基隆市",latitude: 25.1316201,longitude: 121.7424584, pPath: "基隆"),
    City(name: "新竹市",latitude: 24.8068535,longitude: 120.9668243, pPath: "新竹"),
    City(name: "嘉義市",latitude: 23.4812496,longitude: 120.4514076, pPath: "嘉義"),
    City(name: "新竹縣",latitude: 24.8268792,longitude: 121.010715 , pPath: "新竹"),
    City(name: "苗栗縣",latitude: 24.564855, longitude: 120.8185503, pPath: "苗栗"),
    City(name: "彰化縣",latitude: 24.075515, longitude: 120.5424973, pPath: "彰化"),
    City(name: "南投縣",latitude: 23.9026792,longitude: 120.6883204, pPath: "南投"),
    City(name: "雲林縣",latitude: 23.6992302,longitude: 120.524139 , pPath: "雲林"),
    City(name: "嘉義縣",latitude: 23.4586628,longitude: 120.2907802, pPath: "嘉義"),
    City(name: "宜蘭縣",latitude: 24.7307143,longitude: 121.7609277, pPath: "宜蘭"),
    City(name: "花蓮縣",latitude: 23.991331, longitude: 121.6176273, pPath: "花蓮"),
    City(name: "台東縣",latitude: 22.7556232,longitude: 121.148087 , pPath: "台東"),
    City(name: "澎湖縣",latitude: 23.569999, longitude: 119.5641873, pPath: "澎湖"),
    City(name: "金門縣",latitude: 24.4369323,longitude: 118.3165268, pPath: "金門"),
    City(name: "連江縣",latitude: 26.1578627,longitude: 119.9497309, pPath: "連江")
]
