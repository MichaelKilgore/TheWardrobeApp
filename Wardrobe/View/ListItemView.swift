//
//  ListItemView.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 8/25/21.
//

import SwiftUI

struct ListItemView: View {
    // MARK: - PROPERTY
    //@ObservedObject
    let item: Item
    //ListItemView(item: item, equipModeActive: equipModeActive, clothesDisplayed: clothesDisplayed)
    @Binding var equipModeActive: Bool
    @Binding var clothesDisplayed: ClothesDisplayed
    
    // MARK: - FUNCTION
    func stringOfColors() -> String {
        var ans: String = ""
        for i in 0..<item.colors!.count {
            if item.colors![i] == "1" {
                ans += colorNames[i] + ", "
            }
        }
        if ans != "" {
            ans.remove(at: ans.index(before: ans.endIndex))
            ans.remove(at: ans.index(before: ans.endIndex))
        }
        return ans
    }
    func stringOfTypes() -> String {
        var ans: String = ""
        for i in 0..<item.attireTypes!.count {
            if item.attireTypes![i] == "1" {
                ans += attireTypes[i] + ", "
            }
        }
        if ans != "" {
            ans.remove(at: ans.index(before: ans.endIndex))
            ans.remove(at: ans.index(before: ans.endIndex))
        }
        return ans
    }
    func stringOfTemps() -> String {
        var ans: String = ""
        for i in 0..<item.temps!.count {
            if item.temps![i] == "1" {
                ans += staticTemps[i] + ", "
            }
        }
        if ans != "" {
            ans.remove(at: ans.index(before: ans.endIndex))
            ans.remove(at: ans.index(before: ans.endIndex))
        }
        return ans
    }
    
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Image(uiImage: UIImage(data: item.image!)!)
                .resizable()
                .frame(width: 128, height: 128)
                .cornerRadius(12)
            
            VStack(alignment: .leading) {
                Text(item.name ?? "fail")
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                HStack {
                    if equipModeActive {
                        Spacer()
                            Text("Equip")
                                .font(.title2)
                                .fontWeight(.heavy)
                                .padding(.vertical, 25)
                                .padding(.horizontal, 10)
                                .background(
                                    Capsule()
                                        .fill(Color.green)
                                        .frame(width: 100, height: 50)
                                )
                                .onTapGesture {
                                    if item.type == "Hat" {
                                        clothesDisplayed.Hats.append( ClothingPiece(image: Image(uiImage: UIImage(data: item.image!)!), idOfWardrobeItem: item.id!) )
                                    }else if item.type == "Glasses" {
                                        clothesDisplayed.Glasses.append( ClothingPiece(image: Image(uiImage: UIImage(data: item.image!)!), idOfWardrobeItem: item.id!) )
                                    } else if item.type == "Jewelry" {
                                        clothesDisplayed.Jewelry.append( ClothingPiece(image: Image(uiImage: UIImage(data: item.image!)!), idOfWardrobeItem: item.id!) )
                                    } else if item.type == "Scarf" {
                                        clothesDisplayed.Scarfs.append( ClothingPiece(image: Image(uiImage: UIImage(data: item.image!)!), idOfWardrobeItem: item.id!) )
                                    } else if item.type == "Jacket" {
                                        clothesDisplayed.Jackets.append( ClothingPiece(image: Image(uiImage: UIImage(data: item.image!)!), idOfWardrobeItem: item.id!) )
                                    } else if item.type == "Shirt" {
                                        clothesDisplayed.Shirts.append( ClothingPiece(image: Image(uiImage: UIImage(data: item.image!)!), idOfWardrobeItem: item.id!) )
                                    } else if item.type == "Bra" {
                                        clothesDisplayed.Bras.append( ClothingPiece(image: Image(uiImage: UIImage(data: item.image!)!), idOfWardrobeItem: item.id!) )
                                    } else if item.type == "Belt" {
                                        clothesDisplayed.Belts.append( ClothingPiece(image: Image(uiImage: UIImage(data: item.image!)!), idOfWardrobeItem: item.id!) )
                                    } else if item.type == "Pants" {
                                        clothesDisplayed.Pants.append( ClothingPiece(image: Image(uiImage: UIImage(data: item.image!)!), idOfWardrobeItem: item.id!) )
                                    } else if item.type == "Shorts" {
                                        clothesDisplayed.Shorts.append( ClothingPiece(image: Image(uiImage: UIImage(data: item.image!)!), idOfWardrobeItem: item.id!) )
                                    }  else if item.type == "Underwear" {
                                        clothesDisplayed.Underwear.append( ClothingPiece(image: Image(uiImage: UIImage(data: item.image!)!), idOfWardrobeItem: item.id!) )
                                    } else if item.type == "Socks" {
                                        clothesDisplayed.Socks.append( ClothingPiece(image: Image(uiImage: UIImage(data: item.image!)!), idOfWardrobeItem: item.id!) )
                                    } else if item.type == "Shoes" {
                                        clothesDisplayed.Shoes.append( ClothingPiece(image: Image(uiImage: UIImage(data: item.image!)!), idOfWardrobeItem: item.id!) )
                                    } else if item.type == "Misc" {
                                        clothesDisplayed.Misc.append( ClothingPiece(image: Image(uiImage: UIImage(data: item.image!)!), idOfWardrobeItem: item.id!) )
                                    }
                                    print("Yeet.")
                                    
                                }
                        Spacer()
                    } else {
                        // all the filters shown
                        VStack(alignment: .leading) {
                            Text(item.type ?? "")
                                .font(.footnote)
                                .lineLimit(1)
                            Text(stringOfTypes())
                                .font(.footnote)
                                .lineLimit(1)
                            Text(stringOfColors())
                                .font(.footnote)
                                .lineLimit(1)
                            Text(stringOfTemps())
                                .font(.footnote)
                                .lineLimit(1)
                        } //: VSTACK
                        .padding(.horizontal)
                        .padding(.top, 10)
                    }
                } //: HSTACK
                Spacer()
            } //: VSTACK
        } //: HSTACK
    }
}
