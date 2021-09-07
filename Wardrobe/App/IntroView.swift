//
//  IntroView.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 8/20/21.
//

import SwiftUI
import AVKit

import UIKit
import AVFoundation

struct IntroView: View {
    // MARK: - PROPERTY
    
    @State private var isAnimating: Bool = false
    @State private var fadeIn: Bool = false
    
    @AppStorage("happyBirthday") var happyBirthday: Bool = true
    
    @EnvironmentObject var BackgroundColors: BackgroundColors
    
    private var player: AVPlayer {
        return video()
    }
    
    @State var player2: AVPlayer = AVPlayer()
    
    // MARK: - FUNCTION
    private func video() -> AVPlayer {
        let path = Bundle.main.path(forResource: "animationFirework", ofType:"mp4")!
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        
        return player
    }

    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VideoPlayer(player: player2)
                .onAppear() {
                    player2 = player
                    player2.play()
                }
                .onDisappear {
                    player2.pause()
                }
                .ignoresSafeArea(.all, edges: .all)
                .frame(width: 1400, height: 1400)
            
            Text("Start")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .offset(y: 300)
                .padding()
                .background(
                    Capsule().strokeBorder(Color.white, lineWidth: 1.25)
                        .offset(y: 300)
                )
                .onTapGesture {
                    happyBirthday.toggle()
                    feedback.notificationOccurred(.success)
                    playSound(sound: "sound-tap", type: "mp3")
                }
                .onAppear() {
                    withAnimation(.easeIn(duration: 0.6).delay(8)) {
                        fadeIn.toggle()
                    }
                }
                .opacity(fadeIn ? 1 : 0)
            
            Text("Happy Birthday\nAmanda!")
                .font(.system(size: 45))
                .fontWeight(.heavy)
                .foregroundColor(.accentColor)
                .multilineTextAlignment(.center)
                .offset(y: isAnimating ? 0: 600)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 5)) {
                        isAnimating.toggle()
                    }
                })
        } //: ZSTACK
            
    }
}

// MARK: - PREVIEW
struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
            .previewDevice("iPhone 12")
            .environmentObject(BackgroundColors())
    }
}
