//
//  ForecastCarrousselView.swift
//  WeadyApp
//
//  Created by Alex Lin on 11/10/22.
//

import SwiftUI

struct ForecastCarrousselView: View {
    
    var models: [ForecastModel]
    var colorMode: Color
    
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(models, id: \.self) { model in
                        ForecastView(model: model, colorMode: colorMode)
                            .padding(.trailing, model.id == models.last?.id ? 24 : 0)
                    }
                }
            }
        }
        .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .black, .black, .clear]), startPoint: .center, endPoint: .trailing))
        .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .black, .black, .clear]), startPoint: .center, endPoint: .leading))
    }
}

struct ForecastCarrousselView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            ForecastCarrousselView(models: [ForecastModel](), colorMode: .gray)
        }
    }
}
