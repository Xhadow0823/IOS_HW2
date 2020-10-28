//
//  AppView.swift
//  2020_iOS_hw3
//
//  Created by 翁星宇 on 2020/10/28.
//  Copyright © 2020 Hannn. All rights reserved.
//

import SwiftUI
import MapKit

struct AppView: View {
    @State private var secretCity = false;
    @State private var uselessKey:String = "";
    
    @State private var pickedCity:Int = 0;
    @State private var pickedWeather:Int = 0;
    @State private var weatherPoint: Double = 1.0;
    @State private var selectedDate = Date();
    @State private var showAlert = true;
    @State private var showJoke = false;
    @State private var showResult = false;
    @State private var btnColor = Color.blue
    
    let today = Date()
    let endDate = Calendar.current.date(byAdding: .year,value: +10, to: Date())!
    
    var body: some View {
        VStack {
            Text("台灣天氣控制App")
            Form {
                TextField("請輸入啟用金鑰", text: $uselessKey)
                    .onChange(of: uselessKey, perform: { value in
                        
                    })
//                onChange => 其實不輸入也沒關係
                Section(header: Text("請選擇城市")){
                    CityPicker(cityIdx: $pickedCity, secretCity: $secretCity)
                    DisclosureGroup("神奇的功能"){
                        Toggle("顯示隱藏城市", isOn: $secretCity)
                        .onChange(of: secretCity, perform: { value in
                            if (value){
                                cities[10].name = "苗栗國😺"
                            } else{
                                cities[10].name = "😺苗栗國"
                            }
                        })
                        .alert(isPresented: $showAlert, content: {
                            return Alert(title: Text("神奇功能說："), message: Text("用了我就要自行負責喔"))
                        })
                        
                        ColorPicker("換按鈕顏色", selection: $btnColor)
                    }
                    .contextMenu{
                        Text("你想幹嘛？")
                        Button("沒幹嘛"){}
                        Button("幹嘛"){ self.showJoke = true }

                    }
                }
                Section(header: Text("請選擇天氣內容")){  //DisclosureGroup IOS14
                    WeatherPicker(weatherIdx: $pickedWeather)
                    // 天氣程度
                    WeatherPointStepper(weatherPoint: $weatherPoint)
                    WeatherPointSlider(weatherPoint: $weatherPoint)
                }
                
                Section(header: Text("請選擇時間")){
                    DatePicker("發生日期", selection: $selectedDate, in: today...endDate)
                }
            }  // end form
            .alert(isPresented: $showJoke, content: {
                return Alert(title: Text("幹馬會生小馬"))
            })
            
            Button(action: {
                showResult = true
            }, label: {
                Text("  設定天氣！")
                    .font(.headline)
                    .padding()
                    .background(btnColor)
                    .cornerRadius(20.0)
                    .foregroundColor(.white)
                    
            })
            .sheet(isPresented: $showResult, content: {
                ResultView(cityIdx: $pickedCity, weatherIdx: $pickedWeather, wPoint: $weatherPoint)
            })
            .contextMenu{
                Text("按鈕可以換顏色！")
            }
                
            
            
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}

struct CityPicker: View {
    @Binding var cityIdx: Int
    @Binding var secretCity: Bool
    var body: some View {
        Picker("請選擇城市",selection: $cityIdx){
            ForEach(cities.indices){
                (idx) in
                Text(cities[idx].name);
            }
        }
        .pickerStyle(WheelPickerStyle())
        .frame(height: 150)
    }
}

struct WeatherPicker: View {
    @Binding var weatherIdx: Int
    var body: some View {
        Picker("請選擇天氣", selection: $weatherIdx){
            ForEach(weatherList.indices){
                (idx) in
//                Image(systemName: weatherList[idx].pPath)
                Text(weatherList[idx].name)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct WeatherPointStepper: View {
    @Binding var weatherPoint: Double
    var body: some View {
        Stepper("天氣指數: " + String(format: "%.1f", weatherPoint), value: $weatherPoint, in: 0...5, step: 0.5)
    }
}

struct WeatherPointSlider: View {
    @Binding var weatherPoint: Double
    
    var body: some View {
        Slider(value: $weatherPoint, in: 0...5,step: 0.5, minimumValueLabel: Text("0.0"), maximumValueLabel:Text("5.0")){
            Text("天氣指數")
        }
        .accentColor(.green)
    }
}
