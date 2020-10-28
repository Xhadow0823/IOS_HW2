//
//  ResultView.swift
//  2020_iOS_hw3
//
//  Created by 翁星宇 on 2020/10/28.
//  Copyright © 2020 Hannn. All rights reserved.
//

import SwiftUI
import MapKit

struct ResultView: View {
    @Binding var cityIdx: Int
    @Binding var weatherIdx: Int
    @Binding var wPoint: Double
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.0375417, longitude: 121.562244), span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25))

    @State private var showActionSheet = false
    
    var body: some View {

        VStack{
            
            Text("到時候的\(cities[cityIdx].name): ")
                .padding(.vertical, 50)
            Button(action: {
                showActionSheet = true
            }, label: {
                HStack{
                    Image(cities[cityIdx].pPath)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                    Image(systemName: "plus")
                    Image(systemName: weatherList[weatherIdx].pPath)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
            }
            })
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(title: Text("在此聲明"), message: Text("本產品成功率＜\(Int.random(in: 5...50))%"), buttons: [.default(Text("我當然知道囉"))])
            }
            
            Map(coordinateRegion: $region)
                .onAppear{
                    region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: cities[cityIdx].latitude, longitude: cities[cityIdx].longitude), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
                }
        }  //end stack
    }
}

//struct ResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultView(cityIdx: 10, weatherIdx: 1, wPoint: 1.0)
//    }
//}
