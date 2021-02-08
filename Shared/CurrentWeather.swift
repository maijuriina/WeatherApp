//
//  CurrentWeather.swift
//  WeatherApp (iOS)
//
//  Created by Maijuriina Mustonen on 08/02/2021.
//

import SwiftUI

struct CurrentWeather: View {
    var weather: WeatherModel?
    var height: CGFloat = 0
    var body: some View {
        VStack(alignment: .center) {
            Text("Weather")
                .font(.system(size: 50))
                .bold()
                .padding(80)
                .shadow(color: .black, radius: 3)
                .foregroundColor(Color.white)
            Spacer()
            
            Text("\(weather?.main.temp ?? 0) °C")
                .foregroundColor(.white)
                .fontWeight(Font.Weight.light)
                .font(.system(size: 50))
                .shadow(color: .black, radius: 3)
            
            Text("\(weather?.name ?? "Unknown")")
                .font(.system(size: 50))
                .bold()
                .foregroundColor(.white)
                .padding(.bottom, 300)
                .shadow(color: .black, radius: 3)
            Spacer()
        }
        
        /*.background(
            Image("light_background")
                .resizable()
                .scaledToFill()
                .clipped())
        .edgesIgnoringSafeArea([.top, .bottom])*/
        
    }
}


struct CurrentWeather_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeather()
    }
}
