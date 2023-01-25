//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Neal Davar on 1/24/23.
//

import SwiftUI

struct ContentView: View {
    
    // use boolean vars
    @State private var isNight = false
    
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack(){
                CityTextView(cityTextName: "Cupertino, CA")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" :
                                        "cloud.sun.fill", temperature: "76")
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "WED", imageName: "wind", temperature: 70)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind", temperature: 60)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "snow", temperature: 30)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "moon.fill", temperature: 55)
                }
                Spacer()
                
                Button {
                    print("tapped")
                    isNight.toggle()
                } label: {
                    WeatherButtonView(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .light))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 20, weight: .light))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: isNight ? [.black, .gray] : [.blue, Color("lightBlue")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}


struct CityTextView: View {
    
    var cityTextName: String
    
    var body: some View {
        Text(cityTextName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}


struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: String
    
    var body: some View {
        VStack(spacing: 10.0)  {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            
        }.padding(.bottom, 40)
    }
}

