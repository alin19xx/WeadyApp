//
//  LoadingView.swift
//  WeadyApp
//
//  Created by Alex Lin on 21/10/22.
//

import SwiftUI

struct LoadingView: View {
    
    private enum Localizables {
        static let loadText = "Cargando..."
    }
    
    private enum Constants {
        static let lottieName = "cloud_2"
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: -50) {
                Spacer()
                LottieView(lottieFile: Constants.lottieName)
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width)
                Text(Localizables.loadText)
                    .font(.getFont(family: .poppins, style: .regular, size: 14))
                    .foregroundColor(.gray)
                Spacer()
            }
            .background(.white)
            .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .clear, .clear]), startPoint: .center, endPoint: .top))
            .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .clear]), startPoint: .center, endPoint: .bottom))
            .transition(.opacity)
        }
    }
}

#if DEBUG
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
        .ignoresSafeArea()
    }
}
#endif
