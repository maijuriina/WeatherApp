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
        VStack(alignment: .leading) {
            
            Text("Weather Search")
                .font(.title)
                .shadow(color: .black, radius: 3)
                .foregroundColor(Color.white)

            Text("\(weather?.name ?? "Unknown")")
                .font(.system(size: 50))
                .bold()
                .foregroundColor(.white)
                .padding(.bottom)
                .shadow(color: .black, radius: 3)
            
            // find icon image using url and array position
            Image(uiImage: "https://openweathermap.org/img/wn/\(weather?.weather[0].icon ?? "Unknown")@2x.png".load())
                .shadow(color: .gray, radius: 2, x: 2, y: 2)
                .background(Color(.white))
                .cornerRadius(25)
            
            Text("\(weather?.main.temp ?? 0, specifier: "%.1f") °C")
                .foregroundColor(.white)
                .fontWeight(Font.Weight.light)
                .font(.system(size: 50))
                .shadow(color: .black, radius: 3)
            
            Text("Feels like \(weather?.main.feels_like ?? 0, specifier: "%.1f") °C")
                .foregroundColor(.white)
                .fontWeight(Font.Weight.light)
                .font(.system(size: 30))
                .shadow(color: .black, radius: 3)
            
            Spacer()
        }
        
        .background(
            Image("dark_background")
                .resizable()
                .scaledToFill()
                .clipped())
        .edgesIgnoringSafeArea([.top, .bottom])
        
    }
    
}

// extension for locating an icon picture using url
extension String {
    func load() -> UIImage {
        do {
            guard let url = URL(string: self) else {
                return UIImage()
                }
            // convert URL to data
            print(url)
            let data: Data = try
            Data(contentsOf: url)

            return UIImage(data: data)
            ?? UIImage()
        }
        catch {
            
        }
        return UIImage()
    }
}


struct CurrentWeather_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeather()
    }
}
