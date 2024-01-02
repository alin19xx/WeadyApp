//
//  WTextfield.swift
//  WeadyApp
//
//  Created by Alex Lin on 17/10/22.
//

import SwiftUI

struct WTextfield: View {
    
    @Binding var text: String
    @Binding var searching: Bool
    var colorMode: Color
    
    var body: some View {
        HStack(spacing: .zero) {
            HStack(spacing: .zero) {
                icon
                textfield
            }
            .background(backgroundColor)
            .fixedSize(horizontal: false, vertical: true)
            .cornerRadius(12)
            .animation(.default, value: searching)
            .animation(.default, value: colorMode)
            if searching { cancelButton }
        }
        .cornerRadius(12)
    }
    
    var backgroundColor: Color {
        if searching {
            return .getEquivalentOpaqueColor(opacity: 1, color: ModeColors.lightBackground)
        } else {
            return colorMode
        }
    }
    
    // MARK: - Accessory views
    
    @ViewBuilder
    private var icon: some View {
        Image(Icons.searchIcon)
            .resizable()
            .frame(width: 18, height: 18)
            .padding(.horizontal, 12)
    }
    
    @ViewBuilder
    private var textfield: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(Localizables.placeholder)
                    .font(.getFont(family: .poppins, style: .regular, size: 15))
                    .foregroundColor(Color.getEquivalentOpaqueColor(opacity: 1, color: Colors.primaryTextColor))
            }
            TextField("", text: _text) { startedEditing in
                if startedEditing {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        searching.toggle()
                    }
                }
            }
            .foregroundColor(Color.getEquivalentOpaqueColor(opacity: 1, color: Colors.primaryTextColor))
            .onSubmit {
                withAnimation {
                    searching.toggle()
                    text = ""
                }
            }
        }
        .frame(height: 46)
    }
    
    @ViewBuilder
    private var cancelButton: some View {
        Button {
            MainUtils.resignFirstResponder()
            withAnimation {
                searching = false
                text = ""
            }
        } label: {
            Text(Localizables.cancelBtn)
                .font(.getFont(family: .poppins, style: .regular, size: 16))
                .foregroundColor(Color.getEquivalentOpaqueColor(opacity: 1, color: Colors.primaryTextColor))
            
        }
        .padding(.leading, 8)
    }
}

extension WTextfield {
    private enum Localizables {
        static let placeholder = "Search location..."
        static let cancelBtn = "Cancel"
    }
    
    private enum Icons {
        static let searchIcon = "magnifyingglass"
    }
    
    private enum Colors {
        static let primaryTextColor = RGBColor(red: 154, green: 154, blue: 154)
    }
    
    private enum ModeColors {
        static let lightBackground = RGBColor(red: 252, green: 252, blue: 252)
        static let darkBackground = RGBColor(red: 53, green: 51, blue: 77)
        static let fontColor = RGBColor(red: 196, green: 196, blue: 196)
    }
}


#if DEBUG
struct WTextfield_Previews: PreviewProvider {
    
    @State var searching: Bool = false
    static var previews: some View {
        WTextfield_Preview()
    }
}

struct WTextfield_Preview: View {
    
    @State var searching: Bool = false
    
    var body: some View {
        ZStack {
            Color.gray
            WTextfield(text: .constant(""),
                       searching: $searching, colorMode: .white)
                .padding(.horizontal, 16)
        }
        
    }
}
#endif
