//
//  SearchItemView.swift
//  WeadyApp
//
//  Created by Alex Lin on 17/10/22.
//

import SwiftUI

struct SearchItemView: View {
    
    var model: ItemModel
    
    var body: some View {
        VStack(spacing: .zero) {
            HStack(spacing: .zero) {
                mainCardInfo
                Spacer()
                Image(model.icon)
            }
            .padding(.horizontal, 20)
            
            detailedCardInfo
        }
        .background(Color.getEquivalentOpaqueColor(opacity: 0.35, color: RGBColor(red: 0, green: 93, blue: 255)))
        .cornerRadius(12)
    }
    
    @ViewBuilder
    private var mainCardInfo: some View {
        VStack(alignment: .leading) {
            Text(model.location)
                .font(.getFont(family: .poppins, style: .semiBold, size: 20))
                .foregroundColor(.black)
            Text("\(Int(model.tempC))")
                .font(.getFont(family: .poppins, style: .medium, size: 60))
                .foregroundColor(.black)
        }
        .padding(.top, 16)
    }
    
    @ViewBuilder
    private var detailedCardInfo: some View {
        HStack(spacing: 20) {
            HStack(spacing: 8) {
                Image(Icons.wind)
                Text("\(Int(model.windSpeedKph)) km/h")
                    .font(.getFont(family: .poppins, style: .light, size: 11))
                    .foregroundColor(.black)
            }
            .padding(.leading, 20)
            Spacer()
            HStack(spacing: 8) {
                Image(Icons.rain)
                Text("\(Int(model.precipMm)) mm")
                    .font(.getFont(family: .poppins, style: .light, size: 11))
                    .foregroundColor(.black)
            }
            Spacer()
            HStack(spacing: 8) {
                Image(Icons.humidity)
                Text("\(Int(model.humidity)) %")
                    .font(.getFont(family: .poppins, style: .light, size: 11))
                    .foregroundColor(.black)
            }
            .padding(.trailing, 20)
        }
        .padding(.top, 8)
        .padding(.bottom, 16)
    }
    
    enum Icons {
        static let wind = "wind_icon_black"
        static let rain = "rain_icon_black"
        static let humidity = "humidity_icon_black"
    }
}

#if DEBUG
struct SearchItemView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemView(model: ItemModel())
    }
}
#endif
