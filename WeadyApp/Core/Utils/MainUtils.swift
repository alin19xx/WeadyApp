//
//  MainUtils.swift
//  WeadyApp
//
//  Created by Alex Lin on 13/10/22.
//

import Foundation
import UIKit

final class MainUtils {
    
    static var isSmallDevice: Bool = {
        return UIScreen.main.bounds.size.height < 750
    }()
    
    static var isNarrowDevice: Bool = {
        return UIScreen.main.bounds.size.width < 379
    }()
    
    static var iPadDevice: Bool = {
        return UIDevice.current.userInterfaceIdiom == .pad
    }()
    
    static func convertBase64StringToImage(imageBase64String: String) -> UIImage? {
        guard let imageData = Data(base64Encoded: imageBase64String),
              let image = UIImage(data: imageData) else { return nil }
        return image
    }

    static var firstKeyWindow: UIWindow? {
        // Get connected scenes
        return UIApplication.shared.connectedScenes
            // Keep only active scenes, onscreen and visible to the user
            .filter { $0.activationState == .foregroundActive }
            // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
            // Get its associated windows
            .flatMap({ $0 as? UIWindowScene })?.windows
            // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }
    
    static func resignFirstResponder() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
