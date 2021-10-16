//
//  CollapseView.swift
//  MemeApp
//
//  Created by Efe Yencilek on 2021-10-14.
//

import SwiftUI

struct CollapseView: View {
    
    @Binding var isShowingItem: Meme
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if (isShowingItem.id != "") {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowingItem = Meme(id: "", name: "", url: "", width: 0, height: 0, box_count: 0)
                    }
                
                VStack {
                    Text("Title: \(isShowingItem.name)")
                    Image(uiImage: isShowingItem.url.loadUIImage())
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                    Text("Width: \(isShowingItem.width)")
                    Text("Height: \(isShowingItem.height)")
                    Text("Box Count: \(isShowingItem.box_count)")
                }
                .padding()
                .padding()
                .frame(height: 500)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut)
    }
}

//struct CollapseView_Previews: PreviewProvider {
//    static var previews: some View {
//        CollapseView()
//    }
//}
