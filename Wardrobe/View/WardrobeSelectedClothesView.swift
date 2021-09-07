//
//  WardrobeSelectedClothesView.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 8/20/21.
//

import SwiftUI

struct WardrobeSelectedClothesView: View {
    // MARK: - PROPERTY
    
    @Binding var clothesDisplayed: ClothesDisplayed
    @State var deleteMode: Bool
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            //TODO: I Need to change the grid so that each image is scalled to fill like in the dynamic view in
            
            if (true) {
            if clothesDisplayed.Hats.count == 1 {
                LazyVGrid(columns: oneGridLayout, spacing: 15, content: {
                    //TODO FINISH FIXING THESE FOREACHES	
                    //ForEach(Array(zip(items.indices, items)), id: \.0) { index, item in
                    ForEach(Array(zip(clothesDisplayed.Hats.indices, clothesDisplayed.Hats)), id: \.0) { index, item in
                        ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            
                        //.scaleEffect(scaleEffect)
                            .onTapGesture {
                                if deleteMode == true {
                                        clothesDisplayed.Hats.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                    }
                })
                .padding()
            } else if clothesDisplayed.Hats.count == 2 {
                LazyVGrid(columns: twoGridLayout, spacing: 15, content: {
                    ForEach(Array(zip(clothesDisplayed.Hats.indices, clothesDisplayed.Hats)), id: \.0) { index, item in
                        ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Hats.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                    }
                })
                .padding()
            } else if clothesDisplayed.Hats.count != 0 {
                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                    ForEach(Array(zip(clothesDisplayed.Hats.indices, clothesDisplayed.Hats)), id: \.0) { index, item in
                        ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Hats.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                    }
                })
                .padding()
            }
            
            //GLASSES
            if clothesDisplayed.Glasses.count == 1 {
                LazyVGrid(columns: oneGridLayout, spacing: 15, content: {
                    //TODO FINISH FIXING THESE FOREACHES
                    //ForEach(Array(zip(items.indices, items)), id: \.0) { index, item in
                    ForEach(Array(zip(clothesDisplayed.Glasses.indices, clothesDisplayed.Glasses)), id: \.0) { index, item in
                        ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                        clothesDisplayed.Glasses.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                    }
                })
                .padding()
            } else if clothesDisplayed.Glasses.count == 2 {
                LazyVGrid(columns: twoGridLayout, spacing: 15, content: {
                    ForEach(Array(zip(clothesDisplayed.Glasses.indices, clothesDisplayed.Glasses)), id: \.0) { index, item in
                        ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Glasses.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                    }
                })
                .padding()
            } else if clothesDisplayed.Glasses.count != 0 {
                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                    ForEach(Array(zip(clothesDisplayed.Glasses.indices, clothesDisplayed.Glasses)), id: \.0) { index, item in
                        ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Glasses.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                    }
                })
                .padding()
            }
            
            if clothesDisplayed.Jewelry.count == 1 {
                LazyVGrid(columns: oneGridLayout, spacing: 15, content: {
                    ForEach(Array(zip(clothesDisplayed.Jewelry.indices, clothesDisplayed.Jewelry)), id: \.0) { index, item in
                        ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Jewelry.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                    }
                })
                .padding()
            } else if clothesDisplayed.Jewelry.count == 2 {
                LazyVGrid(columns: twoGridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Jewelry.indices, clothesDisplayed.Jewelry)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Jewelry.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            } else if clothesDisplayed.Jewelry.count != 0 {
                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Jewelry.indices, clothesDisplayed.Jewelry)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Jewelry.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            }
            
            //SCARF
            if clothesDisplayed.Scarfs.count == 1 {
                LazyVGrid(columns: oneGridLayout, spacing: 15, content: {
                    ForEach(Array(zip(clothesDisplayed.Scarfs.indices, clothesDisplayed.Scarfs)), id: \.0) { index, item in
                        ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Scarfs.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                    }
                })
                .padding()
            } else if clothesDisplayed.Scarfs.count == 2 {
                LazyVGrid(columns: twoGridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Scarfs.indices, clothesDisplayed.Scarfs)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Scarfs.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            } else if clothesDisplayed.Scarfs.count != 0 {
                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Scarfs.indices, clothesDisplayed.Scarfs)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Scarfs.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            }
            
            //JACKET
            if clothesDisplayed.Jackets.count == 1 {
                LazyVGrid(columns: oneGridLayout, spacing: 15, content: {
                    ForEach(Array(zip(clothesDisplayed.Jackets.indices, clothesDisplayed.Jackets)), id: \.0) { index, item in
                        ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Jackets.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                    }
                })
                .padding()
            } else if clothesDisplayed.Jackets.count == 2 {
                LazyVGrid(columns: twoGridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Jackets.indices, clothesDisplayed.Jackets)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Jackets.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            } else if clothesDisplayed.Jackets.count != 0 {
                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Jackets.indices, clothesDisplayed.Jackets)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Jackets.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            }
            
            if clothesDisplayed.Shirts.count == 1 {
                LazyVGrid(columns: oneGridLayout, spacing: 15, content: {
                    ForEach(Array(zip(clothesDisplayed.Shirts.indices, clothesDisplayed.Shirts)), id: \.0) { index, item in
                        ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Shirts.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                    }
                })
                .padding()
            } else if clothesDisplayed.Shirts.count == 2 {
                LazyVGrid(columns: twoGridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Shirts.indices, clothesDisplayed.Shirts)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Shirts.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            } else if clothesDisplayed.Shirts.count != 0 {
                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Shirts.indices, clothesDisplayed.Shirts)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Shirts.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            }
        
            //BRA
            if clothesDisplayed.Bras.count == 1 {
                LazyVGrid(columns: oneGridLayout, spacing: 15, content: {
                    ForEach(Array(zip(clothesDisplayed.Bras.indices, clothesDisplayed.Bras)), id: \.0) { index, item in
                        ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Bras.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                    }
                })
                .padding()
            } else if clothesDisplayed.Bras.count == 2 {
                LazyVGrid(columns: twoGridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Bras.indices, clothesDisplayed.Bras)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Bras.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            } else if clothesDisplayed.Bras.count != 0 {
                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Bras.indices, clothesDisplayed.Bras)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Bras.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            }
            
            //BELT
            if clothesDisplayed.Belts.count == 1 {
                LazyVGrid(columns: oneGridLayout, spacing: 15, content: {
                    ForEach(Array(zip(clothesDisplayed.Belts.indices, clothesDisplayed.Belts)), id: \.0) { index, item in
                        ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Belts.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                    }
                })
                .padding()
            } else if clothesDisplayed.Belts.count == 2 {
                LazyVGrid(columns: twoGridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Belts.indices, clothesDisplayed.Belts)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Belts.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            } else if clothesDisplayed.Belts.count != 0 {
                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Belts.indices, clothesDisplayed.Belts)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Belts.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            }
            
            if clothesDisplayed.Pants.count == 1 {
                LazyVGrid(columns: oneGridLayout, spacing: 15, content: {
                    ForEach(Array(zip(clothesDisplayed.Pants.indices, clothesDisplayed.Pants)), id: \.0) { index, item in
                        ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Pants.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                    }
                })
                .padding()
            } else if clothesDisplayed.Pants.count == 2 {
                LazyVGrid(columns: twoGridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Pants.indices, clothesDisplayed.Pants)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Pants.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            } else if clothesDisplayed.Pants.count != 0 {
                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Pants.indices, clothesDisplayed.Pants)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Pants.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            }
            
            //SHORTS
            if clothesDisplayed.Shorts.count == 1 {
                LazyVGrid(columns: oneGridLayout, spacing: 15, content: {
                    ForEach(Array(zip(clothesDisplayed.Shorts.indices, clothesDisplayed.Shorts)), id: \.0) { index, item in
                        ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Shorts.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                    }
                })
                .padding()
            } else if clothesDisplayed.Shorts.count == 2 {
                LazyVGrid(columns: twoGridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Shorts.indices, clothesDisplayed.Shorts)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Shorts.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            } else if clothesDisplayed.Shorts.count != 0 {
                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Shorts.indices, clothesDisplayed.Shorts)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Shorts.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            }
            }
            //UNDERWEAR
            if clothesDisplayed.Underwear.count == 1 {
                LazyVGrid(columns: oneGridLayout, spacing: 15, content: {
                    ForEach(Array(zip(clothesDisplayed.Underwear.indices, clothesDisplayed.Underwear)), id: \.0) { index, item in
                        ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Underwear.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                    }
                })
                .padding()
            } else if clothesDisplayed.Underwear.count == 2 {
                LazyVGrid(columns: twoGridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Underwear.indices, clothesDisplayed.Underwear)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Underwear.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            } else if clothesDisplayed.Underwear.count != 0 {
                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Underwear.indices, clothesDisplayed.Underwear)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Underwear.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            }
           
            if clothesDisplayed.Socks.count == 1 {
                LazyVGrid(columns: oneGridLayout, spacing: 15, content: {
                    ForEach(Array(zip(clothesDisplayed.Socks.indices, clothesDisplayed.Socks)), id: \.0) { index, item in
                        ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Socks.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                    }
                })
                .padding()
            } else if clothesDisplayed.Socks.count == 2 {
                LazyVGrid(columns: twoGridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Socks.indices, clothesDisplayed.Socks)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Socks.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            } else if clothesDisplayed.Socks.count != 0 {
                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Socks.indices, clothesDisplayed.Socks)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Socks.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            }
            
            if clothesDisplayed.Shoes.count == 1 {
                LazyVGrid(columns: oneGridLayout, spacing: 15, content: {
                    ForEach(Array(zip(clothesDisplayed.Shoes.indices, clothesDisplayed.Shoes)), id: \.0) { index, item in
                        ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Shoes.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                    }
                })
                .padding()
            } else if clothesDisplayed.Shoes.count == 2 {
                LazyVGrid(columns: twoGridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Shoes.indices, clothesDisplayed.Shoes)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Shoes.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            } else if clothesDisplayed.Shoes.count != 0 {
                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Shoes.indices, clothesDisplayed.Shoes)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Shoes.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            }
            
            //MISC
            if clothesDisplayed.Misc.count == 1 {
                LazyVGrid(columns: oneGridLayout, spacing: 15, content: {
                    ForEach(Array(zip(clothesDisplayed.Misc.indices, clothesDisplayed.Misc)), id: \.0) { index, item in
                        ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Misc.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                    }
                })
                .padding()
            } else if clothesDisplayed.Misc.count == 2 {
                LazyVGrid(columns: twoGridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Misc.indices, clothesDisplayed.Misc)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Misc.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            } else if clothesDisplayed.Misc.count != 0 {
                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                     ForEach(Array(zip(clothesDisplayed.Misc.indices, clothesDisplayed.Misc)), id: \.0) { index, item in
                         ImageView(image: item.image, deleteMode: deleteMode, clothesDisplayed: $clothesDisplayed, index: index)
                            .onTapGesture {
                                if deleteMode == true {
                                    clothesDisplayed.Misc.remove(at: index)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                deleteMode = true
                            }
                     }
                })
                .padding()
            }
            
             
        }) //: VSTACK
    }
}

// MARK: - PREVIEW
struct WardrobeSelectedClothesView_Previews: PreviewProvider {
    @State static var garbageClothesDisplayed: ClothesDisplayed = ClothesDisplayed()
    @State static var deleteMode: Bool = false
    
    static var previews: some View {
        WardrobeSelectedClothesView(clothesDisplayed: $garbageClothesDisplayed, deleteMode: deleteMode)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
