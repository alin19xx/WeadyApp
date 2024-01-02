//
//  MainInfoView.swift
//  WeadyApp
//
//  Created by Alex Lin on 13/10/22.
//

import SwiftUI

struct MainInfoView: View {
    
    var model: MainInfoModel
    
    var body: some View {
        VStack(spacing: 24) {
            Image(model.icon)
                .padding(.top, 36)
            VStack(spacing: 12) {
                Text(model.city)
                    .font(.getFont(family: .poppins, style: .semiBold, size: 30))
                    .foregroundColor(.black)
                temperatureView
            }
        }
        .padding(.top, 24)
    }
    
    private var temperatureView: some View {
        HStack(alignment: .top, spacing: 0) {
            Text("\(Int(model.tempCelcius))")
                .font(.getFont(family: .poppins, style: .medium, size: 70))
                .foregroundColor(.black)
            Text("º")
                .font(.getFont(family: .poppins, style: .medium, size: 16))
                .foregroundColor(.black)
        }
        .frame(height: 70)
    }
}

#if DEBUG
struct MainInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MainInfoView(model: MainInfoModel(icon: "partly_cloudy_day",
                                                       city: "Barcelona",
                                                       tempCelcius: 16,
                                          tempFarenheit: 76, localTime: ""))
    }
}
#endif
