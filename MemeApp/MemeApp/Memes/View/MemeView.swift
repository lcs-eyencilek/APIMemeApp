//
//  MemeView.swift
//  MemeApp
//
//  Created by Efe Yencilek on 2021-10-09.
//

import SwiftUI

struct MemeView: View {
    
    let item: Meme

    var body: some View {
        VStack(alignment: .center) {
            Text("\(item.name)")
                .font(.title2)
            Image(uiImage: item.url.loadUIImage())
                .resizable()
                .frame(width: 300, height: 300, alignment: .center)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15.0)
    }
}
