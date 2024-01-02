//
//  ForecastView.swift
//  WeadyApp
//
//  Created by Alex Lin on 10/10/22.
//

import SwiftUI

struct ForecastView: View {
    
    var model: ForecastModel
    var colorMode: Color
    
    var body: some View {
        VStack(spacing: 8) {
            topView
            bottomView
        }
        .frame(width: Grid.one.gridWidth, height: 100)
        .background(colorMode)
        .cornerRadius(8)
    }
    
    // MARK: - Accessory View
    
    private var topView: some View {
        VStack(spacing: 8) {
            Text(model.time)
                .font(.getFont(family: .poppins, style: .medium, size: 12))
                .foregroundColor(.gray)
            Image(model.icon)
                .resizable()
                .frame(width: 32, height: 32)
        }
    }
    
    private var bottomView: some View {
        HStack(spacing: 12) {
            Text("\(Int(model.maxTempCelcius))º")
                .font(.getFont(family: .poppins, style: .bold, size: 13))
                .foregroundColor(.gray)
        }
    }
}

#if DEBUG
struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            ForecastView(model: ForecastModel(time: "11:00",
                                              icon: "cloud",
                                              maxTempCelcius: 23,
                                              maxtempFarenheit: 120),
                         colorMode: .gray)
        }
        .ignoresSafeArea()
    }
}
#endif
