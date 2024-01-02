//
//  CurrentWeatherInfoView.swift
//  WeadyApp
//
//  Created by Alex Lin on 12/10/22.
//

import SwiftUI

struct CurrentWeatherInfoView: View {
    
    var model: CurrentInfoModel
    var colorMode: Color
    
    var body: some View {
        HStack(spacing: 0) {
            infoCellView(type: .wind, value: "\(model.windSpeedKph) km")
            infoCellView(type: .uv, value: "\(model.uv)")
            infoCellView(type: .rain, value: "\(model.precipMm) mm")
            infoCellView(type: .aq, value: "\(model.airQuality)")
            infoCellView(type: .humidity, value: "\(model.humidity) %")
        }
        .frame(width: Grid.four.gridWidth, height: Constants.mainViewHeight)
        .background(colorMode)
        .cornerRadius(8)
        .clipped()
    }
               
    // MARK: - Accessory Views
    
    private func infoCellView(type: InfoType, value: String) -> some View {
        VStack(spacing: Constants.infoCellVspacing) {
            Image(type.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 24)
            Text(value)
                .font(.getFont(family: .poppins, style: .medium, size: 13))
                .foregroundColor(Color.getEquivalentOpaqueColor(opacity: 1, color: Colors.primaryTextColor))
                .frame(maxWidth: Grid.four.gridWidth/7)
                .fixedSize(horizontal: true, vertical: false)
                
        }
        .frame(width: Grid.four.gridWidth/5, alignment: .center)
    }
}

extension CurrentWeatherInfoView {
    
    private enum InfoType: String {
        case wind = "custom.wind.light"
        case uv = "custom.rays.light"
        case rain = "custom.drop.fill.light"
        case aq = "custom.aqi.medium.light"
        case humidity = "custom.humidity.fill.light"
    }
    
    private enum Colors {
        static let primaryTextColor = RGBColor(red: 154, green: 154, blue: 154)
    }
    
    private enum Constants {
        static let iconFrame: CGFloat = 24
        static let infoHpadding: CGFloat = 40
        static let infoCellVspacing: CGFloat = 12
        static let mainViewHeight: CGFloat = 76
    }
}

#if DEBUG
struct CurrentWeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            CurrentWeatherInfoView(model: CurrentInfoModel(windSpeedMph: 20,
                                                           windSpeedKph: 42,
                                                           uv: 4, precipMm: 10,
                                                           precipIn: 10,
                                                           humidity: 76,
                                                           aq: 4),
                                   colorMode: .white)
        }
        .ignoresSafeArea()
    }
}
#endif
