//
//  PictureWasTakenView.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 8/22/21.
//

import SwiftUI

struct PictureWasTakenView: View {
    
    @Binding var didTapCapture: Bool
    @Binding var imageConfirmed: Bool
    @Binding var image: UIImage?
    @State var croppedImage:UIImage?
    
    @State var showAddingNewItemView: Bool = false
    
    @State var cropperShown = false
    
    var body: some View {
        VStack {
            HStack {
                Text("x")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.leading, 110)
                    .padding(.vertical, 15)
                    .onTapGesture {
                        didTapCapture = false
                        print("x is working")
                    }
                Spacer()
                
                /*Image(systemName: "crop")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.vertical, 15)
                    .padding(.trailing, 110)
                    .onTapGesture {
                        //pull up sheet
                        cropperShown = true
                    }
                    .sheet(isPresented: $cropperShown){
                        ImageCroppingView(shown: $cropperShown, image: image!, croppedImage: $croppedImage)
                            .onDisappear(perform: {
                                if croppedImage != nil {
                                    image = croppedImage
                                }
                            })
                    }*/
            }
            Spacer()
            HStack {
                Spacer()
                Group {
                    Image(systemName: "arrowtriangle.right.fill")
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                        .background(Color.accentColor)
                        .cornerRadius(12)
                        .opacity(0.8)
                        .onTapGesture {
                            // go to new view with the image for adding the image to the view.
                            // also pass the didtapcapture to change it to false if
                            
                            // need to exit this view and enter another view.
                            imageConfirmed = true
                        }
                } //: GROUP
                .padding(.horizontal, 110)
                .padding(.vertical, 15)
            } //: HSTACK
        } //: VSTACK
        //.overlay(self.showAddingNewItemView ? Color.green : nil)
    } //: BODY
}

struct PictureWasTakenView_Previews: PreviewProvider {
    @State static var image = UIImage(named: "testImage")
    
    static var previews: some View {
        PictureWasTakenView(didTapCapture: .constant(true), imageConfirmed: .constant(true), image: $image)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
    }
}
