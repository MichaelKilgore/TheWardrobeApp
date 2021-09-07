//
//  NewOutfitView.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 9/6/21.
//

import SwiftUI

struct NewOutfitView: View {
    // MARK: - PROPERTY
    
    let itemIDs: [UUID]
    
    @State var name: String = ""
    
    @Environment(\.colorScheme) var colorScheme
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    private var isButtonDisabled: Bool {
        name.isEmpty
    }
    
    // MARK: - FUNCTION
    func addOutfit() {
        withAnimation {
            let outfit = Outfit(context: viewContext)
            outfit.name = name
            //outfit.addToItem(newItem)
            
            print("outfit being made.")
            for i in 0..<items.count {
                for j in itemIDs {
                    if items[i].id == j {
                        //items[i].origin =
                        items[i].origin = outfit
                        print("item added!")
                        outfit.addToItem(items[i])
                    }
                } //: LOOP
            } //: LOOP
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        } //: ANIMATION
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                TextField("New Outfit Name", text: $name)
                    .foregroundColor(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(
                        colorScheme == .dark ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                    )
                    .cornerRadius(10)
                
                Button(action: {
                    //TODO: addItem()
                    addOutfit()
                    playSound(sound: "sound-ding", type: "mp3")
                    feedback.notificationOccurred(.success)
                }, label: {
                    Spacer()
                    Text("SAVE")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                })
                .disabled(isButtonDisabled)
                .onTapGesture {
                    if isButtonDisabled {
                        playSound(sound: "sound-tap", type: "mp3")
                    }
                }
                .padding()
                .font(.headline)
                .foregroundColor(.white)
                .background(isButtonDisabled ? Color.blue : Color.pink)
                .cornerRadius(10)
            } //: VSTACK
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(
                colorScheme == .dark ? Color(UIColor.secondarySystemBackground) : Color.white
            )
            .cornerRadius(16)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
            .frame(maxWidth: 640)
        } //: VSTACK
        .padding()
    }
}

// MARK: - PREVIEW
/*struct NewOutfitView_Previews: PreviewProvider {
    static var previews: some View {
        NewOutfitView(itemIDs: [UUID]())
    }
}*/
