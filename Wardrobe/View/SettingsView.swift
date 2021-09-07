//
//  SettingsView.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 9/1/21.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTY
    
    @AppStorage("happyBirthday") var happyBirthday: Bool = false
    @AppStorage("CustomColorActive") var customColor: Bool = false
    
    private let defaults = UserDefaults.standard
    
    @State var red: Double = 0.0
    @State var green: Double = 0.0
    @State var blue: Double = 0.0
    @EnvironmentObject var BackgroundColors: BackgroundColors
    
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical) {
            // Reload intro view
            GroupBox {
                VStack {
                    Text("To view that beautiful happy birthday intro again flip the switch.")
                        .padding()
                    
                    Toggle(isOn: $happyBirthday) {
                        if happyBirthday {
                            Text("Happy Birthday!".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(Color.green)
                        } else {
                            Text("Happy Birthday!".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(Color.secondary)
                        }
                    }
                    .padding()
                    .background(
                      Color(UIColor.tertiarySystemBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    )
                }
            } //: GROUPBOX
            .padding()
            
            //Background Color
            GroupBox {
                VStack {
                    Toggle(isOn: $customColor) {
                        if customColor {
                            Text("Activated".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(Color.green)
                        } else {
                            Text("Activate".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(Color.secondary)
                        }
                    }
                    .padding()
                    .background(
                      Color(UIColor.tertiarySystemBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    )
                    
                    Text("Adjust the nobs for a custom background color.")
                        .padding()
                    
                    Capsule()
                        .fill(Color(red: Double(BackgroundColors.red), green: Double(BackgroundColors.green), blue: Double(BackgroundColors.blue)))
                        .frame(width: 200, height: 100, alignment: .center)

                    
                    VStack {
                        HStack {
                            Text("RED     ")
                            Slider(value: $red)
                              .padding(.horizontal)
                                .onChange(of: red, perform: { value in
                                  BackgroundColors.red = red
                                })
                        }
                        HStack {
                            Text("GREEN")
                            Slider(value: $green)
                              .padding(.horizontal)
                              .onChange(of: green, perform: { value in
                                BackgroundColors.green = green
                              })
                        }
                        HStack {
                            Text("BLUE   ")
                            Slider(value: $blue)
                              .padding(.horizontal)
                                .onChange(of: blue, perform: { value in
                                  BackgroundColors.blue = blue
                                })
                        }
                    }
                    .padding(.vertical)
                    
                    Button(action: {
                        defaults.set(red, forKey: "red")
                        defaults.set(green, forKey: "green")
                        defaults.set(blue, forKey: "blue")
                    }) {
                        Text("Save Changes".uppercased())
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding()
                            .background(
                                Capsule()
                                    .fill(Color.green)
                            )
                    }
                }
            }
            .padding()
            
            
        } //: ScrollView
        .onAppear(perform: {
            
            let savedRed = defaults.double(forKey: "red")
            let savedGreen = defaults.double(forKey: "green")
            let savedBlue = defaults.double(forKey: "blue")
            
            red = Double(savedRed)
            green = Double(savedGreen)
            blue = Double(savedBlue)
        })
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
            .environmentObject(BackgroundColors())
    }
}
