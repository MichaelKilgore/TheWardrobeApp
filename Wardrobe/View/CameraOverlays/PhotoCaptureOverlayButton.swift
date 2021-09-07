//
//  PhotoCaptureOverlayButton.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 8/22/21.
//

import SwiftUI

struct PhotoCaptureOverlayButton: View {
    // MARK: - PROPERTY
        
    // MARK: - BODY
    var body: some View {
        Circle()
            .fill(Color.white)
            //.stroke(Color.white, lineWidth: 5)
            .overlay(
                Circle()
                    .stroke(Color.white, lineWidth: 5)
                    .frame(width: 60, height: 60)
            )
            .opacity(0.5)
            .frame(width: 60, height: 60)
    }
}

// MARK: - PREVIEW
struct PhotoCaptureOverlayButton_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCaptureOverlayButton()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.black)
    }
}
