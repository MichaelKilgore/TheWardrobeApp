//
//  existingWadrobeItemView.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 9/2/21.
//

import SwiftUI

struct existingWardrobeItemView: View {
    // MARK: - PROPERTY
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var item: Item
    
    @Binding var imageConfirmed: Bool
    
    @State var image: UIImage
    
    @Binding var exitCameraView: Bool
    
    @State var garbageClothesDisplayed: ClothesDisplayed = ClothesDisplayed()
    @State var garbagedeleteMode: Bool = false
    
    @Binding var equipModeActive: Bool
    
    var navigationViewPresent: Bool {
        print("HERE!!!")
        guard item != nil else { return false }
        print("123")
        return true
    }
    
    var computedImage: UIImage {
        //guard let item = item else { return UIImage(imageLiteralResourceName: "") }
        
        //Image(uiImage: UIImage(data: item.image!)!)
        
        return UIImage(data: item.image!)!
    }
    
    @State var Title: String = ""
    
    var computedTitle: String {
        //guard let item = item else { return "" }
        
        return item.name!
    }
    
    @State var clothingType: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    
    var computedClothingType: [Bool] {
        //guard let item = item else { return [Bool]() }
        
        let type: String = item.type ?? ""
        if (type == "Hat") {
            return [true, false, false, false, false, false, false, false, false, false, false, false, false, false]
        } else if (type == "Glasses") {
            return [false, true, false, false, false, false, false, false, false, false, false, false, false, false]
        } else if (type == "Jewelry") {
            return [false, false, true, false, false, false, false, false, false, false, false, false, false, false]
        } else if (type == "Scarf") {
            return [false, false, false, true, false, false, false, false, false, false, false, false, false, false]
        } else if (type == "Jacket") {
            return [false, false, false, false, true, false, false, false, false, false, false, false, false, false]
        } else if (type == "Shirt") {
            return [false, false, false, false, false, true, false, false, false, false, false, false, false, false]
        } else if (type == "Bra") {
            return [false, false, false, false, false, false, true, false, false, false, false, false, false, false]
        } else if (type == "Belt") {
            return [false, false, false, false, false, false, false, true, false, false, false, false, false, false]
        } else if (type == "Pants") {
            return [false, false, false, false, false, false, false, false, true, false, false, false, false, false]
        } else if (type == "Shorts") {
            return [false, false, false, false, false, false, false, false, false, true, false, false, false, false]
        } else if (type == "Underwear") {
            return [false, false, false, false, false, false, false, false, false, false, true, false, false, false]
        } else if (type == "Socks") {
            return [false, false, false, false, false, false, false, false, false, false, false, true, false, false]
        } else if (type == "Shoes") {
            return [false, false, false, false, false, false, false, false, false, false, false, false, true, false]
        } else if (type == "Misc") {
            return [false, false, false, false, false, false, false, false, false, false, false, false, false, true]
        } else {
            return [false, false, false, false, false, false, false, false, false, false, false, false, false, false]
        }
    } // = [false, false, false, false, false]
    
    @State var colors: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    
    var computedColors: [Bool] {
        //guard let item = item else { return [Bool]() }
        
        var colorBoolArr: [Bool] = []
        let colors: String = item.colors ?? "0000000000000000"
        for i in colors {
            if i == "1" {
                colorBoolArr.append(true)
            } else {
                colorBoolArr.append(false)
            }
        }
        return colorBoolArr
    } // = [false, false, false, false, false]
    
    @State var attireTypes: [Bool] = [false, false, false, false, false, false, false, false]
    
    var computedAttireTypes: [Bool] {
        //guard let item = item else { return [Bool]() }
        
        let attires: String = item.attireTypes ?? "00000000"
        var types: [Bool] = []
        for i in attires {
            if i == "1" {
                types.append(true)
            } else {
                types.append(false)
            }
        }
        return types
    } // = [false, false, false]
    
    @State var temps: [Bool] = [false, false, false]
    
    var computedTemps: [Bool] {
        //guard let item = item else { return [Bool]() }
        
        let tempsArr: String = item.temps ?? "000"
        var tempArr: [Bool] = []
        for i in tempsArr {
            if i == "1" {
                tempArr.append(true)
            } else {
                tempArr.append(false)
            }
        }
        
        return tempArr
    }

    // MARK: - FUNCTION
    
    private func updateItem() {
        withAnimation {
            
            //toggle to equip mode then back.
            
            equipModeActive.toggle()
            equipModeActive.toggle()
            
            item.timestamp = Date()
            item.name = Title
            
            if clothingType[0] == true {
                item.type = "Hat"
            } else if clothingType[1] == true {
                item.type = "Glasses"
            } else if clothingType[2] == true {
                item.type = "Jewelry"
            } else if clothingType[3] == true {
                item.type = "Scarf"
            } else if clothingType[4] == true {
                item.type = "Jacket"
            } else if clothingType[5] == true {
                item.type = "Shirt"
            } else if clothingType[6] == true {
                item.type = "Bra"
            } else if clothingType[7] == true {
                item.type = "Belt"
            } else if clothingType[8] == true {
                item.type = "Pants"
            } else if clothingType[9] == true {
                item.type = "Shorts"
            } else if clothingType[10] == true {
                item.type = "Underwear"
            } else if clothingType[11] == true {
                item.type = "Socks"
            } else if clothingType[12] == true {
                item.type = "Shoes"
            } else if clothingType[13] == true {
                item.type = "Misc"
            }
             
            // FILTERS
            
            var newColorScheme: String = ""
            for i in colors {
                if i == true {
                    newColorScheme += "1"
                } else {
                    newColorScheme += "0"
                }
            }
            item.colors = newColorScheme
            
            var newAttireTypes: String = ""
            for i in attireTypes {
                if i == true {
                    newAttireTypes += "1"
                } else {
                    newAttireTypes += "0"
                }
            }
            item.attireTypes = newAttireTypes
            
            var newTemps: String = ""
            for i in temps {
                if i == true {
                    newTemps += "1"
                } else {
                    newTemps += "0"
                }
            }
            
            item.temps = newTemps
             
            // IMAGE
             
            
            //item.image = image.jpegData(compressionQuality: 1.0)

            if self.viewContext.hasChanges {
                try? self.viewContext.save()
            }
        }
    }
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical) {
            
            //Image("testImage")
            ImageView(image: Image(uiImage: image), deleteMode: garbagedeleteMode, clothesDisplayed: $garbageClothesDisplayed, index: -1) // pass image
                .padding()
                //.frame(maxWidth: UIScreen.main.bounds.size.width-20, maxHeight: UIScreen.main.bounds.size.width-20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            InputField(defaultText: "Title", text: $Title)
                .padding()
            
            
            FiltersView(clothingType: $clothingType, colors: $colors, attireTypes: $attireTypes, temps: $temps)
            
            Button(action: {
                if (Title != "") {
                    print("HERE")
                    updateItem()
                    exitCameraView = false
                    self.mode.wrappedValue.dismiss()
                }
            }) {
                Text("Update Item")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.top, 20)
            }
                
        } //: SCROLL
        .background(Color.accentColor.ignoresSafeArea(.all, edges: .all))
        .onAppear(perform: {
            if (item.name != "") {
                print("1")
                image = computedImage
                print("2")
                Title = computedTitle
                
                clothingType = computedClothingType
                
                colors = computedColors
                
                attireTypes = computedAttireTypes
                
                temps = computedTemps
            }
            print("HERE!")
        })
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.mode.wrappedValue.dismiss()
        }){
            Image(systemName: "arrow.left")
                .foregroundColor(Color.white)
        })
        //.edgesIgnoringSafeArea(.top)
        .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
        
            if(value.startLocation.x < 20 && value.translation.width > 100) {
                self.mode.wrappedValue.dismiss()
            }
            
        }))
    } //: BODY
}
