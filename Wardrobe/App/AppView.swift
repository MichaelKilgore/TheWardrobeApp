//
//  AppView.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 8/20/21.
//

import SwiftUI

struct AppView: View {
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    // MARK: - PROPERTY
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @FetchRequest(
        entity: Outfit.entity(), sortDescriptors: []) var outfits:
            FetchedResults<Outfit>
    
    @State private var newItemView = false
    
    @State private var inputImage: UIImage?
    
    @State var listView: Bool = false
    
    @State var equipModeActive: Bool = false
    
    @State var clothesDisplayed: ClothesDisplayed = ClothesDisplayed()
    
    @State var deleteMode: Bool = true
    
    @State var clothingTypeFilter: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    @State var colorsFilter: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    @State var attireTypesFilter: [Bool] = [false, false, false, false, false, false, false, false]
    @State var tempsFilter: [Bool] = [false, false, false]
    
    @EnvironmentObject var BackgroundColors: BackgroundColors
    private let defaults = UserDefaults.standard
    @AppStorage("CustomColorActive") var customColor: Bool = false
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var scaleEffect: Double = 1.0
    
    @State var showNewOutfitView = false
    
    // MARK: - FUNCTION
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteOutfits(offsets: IndexSet) {
        withAnimation {
            offsets.map { outfits[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    //true means present the item.
    private func filters(item: Item) -> Bool {
        var clothingTypeFilterSuccess: Bool = false
        var allFalseClothingTypeFilters: Bool = true
        for i in 0..<clothingTypeFilter.count {
            if item.type == types[i] && clothingTypeFilter[i] == true {
                clothingTypeFilterSuccess = true
            } else if clothingTypeFilter[i] == true {
                allFalseClothingTypeFilters = false
            }
        }
        
        var colorTypeFilterSuccess: Bool = true
        for i in 0..<colorsFilter.count {
            if item.colors![i] == "0" && colorsFilter[i] == true {
                colorTypeFilterSuccess = false
            }
        }
        
        var attireTypeFilterSuccess: Bool = true
        for i in 0..<attireTypesFilter.count {
            if item.attireTypes![i] == "0" && attireTypesFilter[i] == true {
                attireTypeFilterSuccess = false
            }
        }
        
        if (clothingTypeFilterSuccess == true || allFalseClothingTypeFilters == true) {
            if (colorTypeFilterSuccess == true && attireTypeFilterSuccess == true) {
                return true
            }
        }
        
        return false
    }
    
    private func totalFilterItems() -> Int {
        var count: Int = 0
        for i in items {
            if filters(item: i) {
                count += 1
            }
        }
        return count
    }
    
    private func getWardrobePreviewIDs() -> [UUID] {
        var IDs: [UUID] = []
        for i in clothesDisplayed.Hats {
            IDs.append(i.idOfWardrobeItem)
        }
        for i in clothesDisplayed.Glasses {
            IDs.append(i.idOfWardrobeItem)
        }
        for i in clothesDisplayed.Jewelry {
            IDs.append(i.idOfWardrobeItem)
        }
        for i in clothesDisplayed.Scarfs {
            IDs.append(i.idOfWardrobeItem)
        }
        for i in clothesDisplayed.Jackets {
            IDs.append(i.idOfWardrobeItem)
        }
        for i in clothesDisplayed.Shirts {
            IDs.append(i.idOfWardrobeItem)
        }
        for i in clothesDisplayed.Bras {
            IDs.append(i.idOfWardrobeItem)
        }
        for i in clothesDisplayed.Belts {
            IDs.append(i.idOfWardrobeItem)
        }
        for i in clothesDisplayed.Pants {
            IDs.append(i.idOfWardrobeItem)
        }
        for i in clothesDisplayed.Shorts {
            IDs.append(i.idOfWardrobeItem)
        }
        for i in clothesDisplayed.Underwear {
            IDs.append(i.idOfWardrobeItem)
        }
        for i in clothesDisplayed.Socks {
            IDs.append(i.idOfWardrobeItem)
        }
        for i in clothesDisplayed.Shoes {
            IDs.append(i.idOfWardrobeItem)
        }
        for i in clothesDisplayed.Misc {
            IDs.append(i.idOfWardrobeItem)
        }
        return IDs
    }
        
    // MARK: - BODY
    var body: some View {
        ZStack {
            if (newItemView == false) {
            VStack(spacing: 0) {
                NavigationBarView(clothingType: $clothingTypeFilter, colors: $colorsFilter, attireTypes: $attireTypesFilter, temps: $tempsFilter)
                    .environmentObject(BackgroundColors)
                    .padding(.bottom)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(colorScheme == .dark ? Color.black : Color.white)
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    //.shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                
                NavigationView {
                ScrollView(.vertical, showsIndicators: false, content: {
                    //HERE
                    Slider(value: $scaleEffect, in: 0.25...1.0)
                      .padding(30)
                        .accentColor(colorScheme == .dark ? .black : .white)
                        .onChange(of: scaleEffect, perform: { value in
                            //BackgroundColors.red = scaleEffect
                        })
                    
                    WardrobeSelectedClothesView(clothesDisplayed: $clothesDisplayed, deleteMode: deleteMode)
                        .scaleEffect(CGFloat(scaleEffect))
                        .padding(.horizontal, 15)
                        .padding(.vertical, 15)
                   
                    
                    Group {
                        Group {
                            HStack {
                                Spacer()
                                Text("Save Outfit")
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                            .background(colorScheme == .dark ? Color.black : Color.white)
                            .onTapGesture {
                                showNewOutfitView = true
                            }
                        }
                        .cornerRadius(12)
                    }
                    .padding(.horizontal, 50)
                    
                    
                    //add a switch that has a details mode and equip mode
                    NewItemButtonView()
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    //.background(colorScheme == .dark ? Color.black : Color.white)
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        .onTapGesture {
                            newItemView = true
                        }
                        .padding()
                    
                    Group {
                        Toggle("asdf", isOn: $equipModeActive)
                            .toggleStyle(detailEquipStyle())
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    }
                    //.padding()
                    
                    // WARDROBE ITEMS LIST
                    List {
                        ForEach(items) { item in
                            //imageconfirmed not sure what to make it here.
                            if (filters(item: item)) {
                                NavigationLink(destination: existingWardrobeItemView(item: item, imageConfirmed: $listView, image: UIImage(), exitCameraView: $listView, equipModeActive: $equipModeActive)) {
                                    // need to pass the toggle and the clothesdisplayed in order to add the item to it.
                                    // FUNC
                                    ListItemView(item: item, equipModeActive: $equipModeActive, clothesDisplayed: $clothesDisplayed)
                                }
                            }
                        } //: LOOP
                        .onDelete(perform: deleteItems)
                    } //: LIST
                    .ignoresSafeArea(.all, edges: .bottom)
                    .frame(minHeight: 143 * CGFloat(totalFilterItems()))
                    .cornerRadius(12)
                    .padding()
                    //.frame(maxWidth: 640)
                    
                    HStack {
                        Text("Outfits")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding()
                        Spacer()
                    }
                        
                    List {
                        ForEach(outfits) { outfit in
                            OutfitView(outfitName: outfit.name!, images: outfit.imageArray)
                                .onAppear {
                                    print(outfit.name!)
                                }
                        }
                        .onDelete(perform: deleteOutfits)
                    }
                    .ignoresSafeArea(.all, edges: .bottom)
                    .frame(minHeight: 190 * CGFloat(outfits.count))
                    .cornerRadius(12)
                    .padding()
                    
                }) //: SCROLL
                .ignoresSafeArea(.all, edges: .all)
                .background(
                    (!customColor ? Color.accentColor : Color(red: Double(BackgroundColors.red), green: Double(BackgroundColors.green), blue: Double(BackgroundColors.blue)))
                            .ignoresSafeArea(.all, edges: .all)
                )
                .navigationBarHidden(true)
                } //: NAVIGATIONVIEW
                .onAppear(perform: {
                    
                    let savedRed = defaults.double(forKey: "red")
                    let savedGreen = defaults.double(forKey: "green")
                    let savedBlue = defaults.double(forKey: "blue")
                    
                    BackgroundColors.red = Double(savedRed)
                    BackgroundColors.green = Double(savedGreen)
                    BackgroundColors.blue = Double(savedBlue)
                })
                
                
                Spacer()
            } //: VSTACK
            .blur(radius: showNewOutfitView ? 8.0 : 0, opaque: false)
            .transition(.move(edge: .bottom))
            //.animation(.easeOut(duration: 0.5))
            .ignoresSafeArea(.all, edges: .all)
        } else {
            CustomCameraView(exitCameraView: $newItemView)
        }
            
            if showNewOutfitView {
                BlankView(
                    backgroundColor: colorScheme == .dark ? Color.black : Color.gray,
                    backgroundOpacity: colorScheme == .dark ? 0.3 : 0.5)
                    .onTapGesture {
                        withAnimation() {
                            showNewOutfitView = false
                        }
                    }
                
                NewOutfitView(itemIDs: getWardrobePreviewIDs())
            }
        } //: ZSTACK
    } //: BODY
}

// MARK: - PREVIEW
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environment(\.colorScheme, .light)
            .environmentObject(BackgroundColors())
            .previewDevice("iPhone 12")
    }
}

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
