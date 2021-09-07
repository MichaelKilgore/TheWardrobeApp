//
//  InputField.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 8/23/21.
//

import SwiftUI

struct InputField: View {
    //MARK: - PROPERTIES
    let defaultText: String
    @Binding var text: String
    
    
    //MARK: - BODY
    var body: some View {
        TextField(self.defaultText, text: self.$text)
            .padding()
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 2)
            )
    }
}

//MARK: - PREVIEW
struct InputField_Previews: PreviewProvider {
    static let defaultText: String = "Email"
    @State static var text: String = ""
    
    static var previews: some View {
        InputField(defaultText: defaultText, text: $text)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

