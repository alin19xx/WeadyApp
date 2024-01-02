//
//  SearchView.swift
//  WeadyApp
//
//  Created by Alex Lin on 14/10/22.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var results: [ItemModel]
    @Binding var text: String
    @Binding var isEditing: Bool
    
    @Binding var selectedLocation: String?
    
    init(results: Binding<[ItemModel]>, text: Binding<String>, isEditing: Binding<Bool>, selectedLocation: Binding<String?>) {
        self._results = results
        self._text = text
        self._isEditing = isEditing
        self._selectedLocation = selectedLocation
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(locationResults, id: \.self) { model in
                Button {
                    selectedLocation = model.location
                } label: {
                    SearchItemView(model: model)
                        .padding(.bottom, 8)
                }
            }
            .padding(.top, 48)
        }
        .edgesIgnoringSafeArea(.bottom)
        .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .black, .black, .clear]), startPoint: .center, endPoint: .top))
        .transition(.opacity.combined(with: .move(edge: .bottom)))
        .onTapGesture {
            MainUtils.resignFirstResponder()
        }
    }
    
    var locationResults: [ItemModel] {
        if text.isEmpty {
            return results
        } else {
            return results.filter { $0.location.contains(text) }
        }
    }
}

#if DEBUG
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            SearchView(results: .constant([ItemModel]()), text: .constant(""), isEditing: .constant(false), selectedLocation: .constant(""))
        }
    }
}
#endif
