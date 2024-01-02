//
//  AstrologyInfoView.swift
//  WeadyApp
//
//  Created by Alex Lin on 12/10/22.
//

import SwiftUI

struct AstrologyInfoView: View {
        
    var model: AstrologyModel
    var colorMode: Color
    
    var body: some View {
        mainInfoView
    }
    
    // MARK: - Accessory views
    
    private var mainInfoView: some View {
        HStack(spacing: Grid.gutter) {
            containerDetailView(model: model.sun,
                                icon1: Icons.sunriseIcon,
                                icon2: Icons.sunsetIcon)
            containerDetailView(model: model.moon,
                                icon1: Icons.moonriseIcon,
                                icon2: Icons.moonsetIcon)
        }
        .frame(width: Grid.four.gridWidth)
    }
    
    private func containerDetailView(model: AstroModel, icon1: String, icon2: String) -> some View {
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: .zero) {
                    detailInfoView(title: model.titleRise,
                                   time: model.riseTime,
                                   image: icon1)
                    detailInfoView(title: model.titleSet,
                                   time: model.setTime,
                                   image: icon2)
                }
                .frame(maxWidth: .infinity)
                .background(colorMode)
                .cornerRadius(8)
            }
    }
    
    private func detailInfoView(title: String, time: String, image: String) -> some View {
        HStack(alignment: .center, spacing: Constants.detailHSpacing) {
            Image(image)
                .resizable()
                .frame(width: Constants.detailIconFrame, height: Constants.detailIconFrame)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.getFont(family: .poppins, style: .light, size: 13))
                    .foregroundColor(Color.getEquivalentOpaqueColor(opacity: 1, color: Colors.primaryTextColor))
                Text("\(time)")
                    .font(.getFont(family: .poppins, style: .regular, size: 13))
                    .foregroundColor(Color.getEquivalentOpaqueColor(opacity: 1, color: Colors.primaryTextColor))
            }
        }
        .padding(.vertical, Constants.verticalPadding)
    }
}

extension AstrologyInfoView {
    private enum Icons {
        static let sunriseIcon = "sunrise_icon"
        static let sunsetIcon = "sunset_icon"
        static let moonriseIcon = "moonrise_icon"
        static let moonsetIcon = "moonset_icon"
    }
    
    private enum Colors {
        static let primaryTextColor = RGBColor(red: 154, green: 154, blue: 154)
    }
    
    private enum Constants {
        static let detailIconFrame: CGFloat = 24
        static let containerHSpacing: CGFloat = 20
        static let detailHSpacing: CGFloat = 16
        static let verticalPadding: CGFloat = 8
    }
}

#if DEBUG
struct AstrologyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            AstrologyInfoView(model: AstrologyModel(sun: AstroModel(titleRise: "Sunrise",
                                                                    riseTime: "07:52 AM",
                                                                    titleSet: "Sunset",
                                                                    setTime: "19:43 PM"),
                                                    moon: AstroModel(titleRise: "Moonrise",
                                                                     riseTime: "12:08 PM",
                                                                     titleSet: "Moonset",
                                                                     setTime: "08:21 AM")), colorMode: .white)
        }
    }
}
#endif
