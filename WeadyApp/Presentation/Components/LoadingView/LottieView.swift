//
//  LottieView.swift
//  WeadyApp
//
//  Created by Alex Lin on 21/10/22.
//

import SwiftUI
import Lottie
 
struct LottieView: UIViewRepresentable {
    
    let lottieFile: String
    let animationView = LottieAnimationView()
 
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
 
        animationView.animation = Animation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        
        view.addSubview(animationView)
        
        animationView.play()
        animationView.loopMode = .repeatBackwards(2)
 
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
 
        return view
    }
 
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
