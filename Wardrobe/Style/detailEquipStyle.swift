//
//  detailEquipStyle.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 8/31/21.
//

import SwiftUI

struct detailEquipStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        return Group {
            HStack {
                Text("Detail")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 20)
                Text("Equip")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 20)
            } //: HSTACK
            .overlay(
                Capsule()
                    .fill(Color.yellow)
                    .frame(width: 100, height: 48)
                    .offset(x: configuration.isOn ? -48 : 48)
            )
            .background(
                Capsule()
                    .fill(Color.green)
                    .frame(width: 200, height: 50)
            )
            .onTapGesture {
                withAnimation {
                    configuration.isOn.toggle()
                }
            }
        } //: GROUP
    }
}

struct detailEquipStyle_Previews: PreviewProvider {
    static var previews: some View {
        Toggle("asdf", isOn: .constant(true))
            .toggleStyle(detailEquipStyle())
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
