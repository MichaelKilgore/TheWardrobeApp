//
//  NewWardrobeItemView.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 8/23/21.
//

import SwiftUI


struct NewWardrobeItemView: View {
    // MARK: - PROPERTY
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var item: Item?
    
    @Binding var imageConfirmed: Bool
    
    @State var image: UIImage
    
    @Binding var exitCameraView: Bool
    
    @State var garbageClothesDisplayed: ClothesDisplayed = ClothesDisplayed()
    @State var garbagedeleteMode: Bool = false
    
    var navigationViewPresent: Bool {
        print("HERE!!!")
        guard item != nil else { return false }
        print("123")
        return true
    }
    
    var computedImage: UIImage {
        guard let item = item else { return UIImage(imageLiteralResourceName: "") }
        
        //Image(uiImage: UIImage(data: item.image!)!)
        
        return UIImage(data: item.image!)!
    }
    
    @State var Title: String = ""
    
    var computedTitle: String {
        guard let item = item else { return "" }
        
        return item.name!
    }
    
    @State var clothingType: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    
    var computedClothingType: [Bool] {
        guard let item = item else { return [Bool]() }
        
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
        guard let item = item else { return [Bool]() }
        
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
        guard let item = item else { return [Bool]() }
        
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
        guard let item = item else { return [Bool]() }
        
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
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.name = Title
            
            if clothingType[0] == true {
                newItem.type = "Hat"
            } else if clothingType[1] == true {
                newItem.type = "Glasses"
            } else if clothingType[2] == true {
                newItem.type = "Jewelry"
            } else if clothingType[3] == true {
                newItem.type = "Scarf"
            } else if clothingType[4] == true {
                newItem.type = "Jacket"
            } else if clothingType[5] == true {
                newItem.type = "Shirt"
            } else if clothingType[6] == true {
                newItem.type = "Bra"
            } else if clothingType[7] == true {
                newItem.type = "Belt"
            } else if clothingType[8] == true {
                newItem.type = "Pants"
            } else if clothingType[9] == true {
                newItem.type = "Shorts"
            } else if clothingType[10] == true {
                newItem.type = "Underwear"
            } else if clothingType[11] == true {
                newItem.type = "Socks"
            } else if clothingType[12] == true {
                newItem.type = "Shoes"
            } else if clothingType[13] == true {
                newItem.type = "Misc"
            }
            
            newItem.id = UUID()
             
            // FILTERS
            
            var newColorScheme: String = ""
            for i in colors {
                if i == true {
                    newColorScheme += "1"
                } else {
                    newColorScheme += "0"
                }
            }
            newItem.colors = newColorScheme
            
            var newAttireTypes: String = ""
            for i in attireTypes {
                if i == true {
                    newAttireTypes += "1"
                } else {
                    newAttireTypes += "0"
                }
            }
            newItem.attireTypes = newAttireTypes
            
            var newTemps: String = ""
            for i in temps {
                if i == true {
                    newTemps += "1"
                } else {
                    newTemps += "0"
                }
            }
            
            newItem.temps = newTemps
             
            // IMAGE
             
            
            newItem.image = image.jpegData(compressionQuality: 1.0)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical) {
            HStack {
                Text("x")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 15)
                    .onTapGesture {
                        print("exiting camera view.")
                        imageConfirmed = false
                    }
                Spacer()
            } //: HSTACK
            
            //Image("testImage")
            Group {
            ImageView(image: Image(uiImage: image), deleteMode: garbagedeleteMode, clothesDisplayed: $garbageClothesDisplayed, index: -1) // pass image
                .frame(maxWidth: UIScreen.main.bounds.size.width-40, maxHeight: UIScreen.main.bounds.size.width-40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .padding(.vertical, 60)
            
            InputField(defaultText: "Title", text: $Title)
                .padding()
            
            
            FiltersView(clothingType: $clothingType, colors: $colors, attireTypes: $attireTypes, temps: $temps)
            
            Button(action: {
                if (Title != "") {
                    if (item == nil) {
                        addItem()
                        exitCameraView = false
                    } else {
                        
                    }
                }
            }) {
                Text("Add Item")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.top, 20)
            }
                
        } //: SCROLL
        .frame(maxWidth: UIScreen.main.bounds.size.width)
        .background(Color.accentColor.ignoresSafeArea(.all, edges: .all))
        .onAppear(perform: {
            if (item != nil) {
                if (item!.name != "") {
                    print("1")
                    image = computedImage
                    print("2")
                    Title = computedTitle
                    
                    clothingType = computedClothingType
                    
                    colors = computedColors
                    
                    attireTypes = computedAttireTypes
                }
                print("HERE!")
            }
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

// MARK: - PREVIEW
/*struct NewWardrobeItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewWardrobeItemView(Title: "", clothingType: [false, false, false, false, false], colors: [false, false, false, false, false], attireTypes: [false, false, false], imageConfirmed: .constant(true))
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}*/
