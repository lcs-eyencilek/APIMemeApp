//
//  MemeView.swift
//  MemeApp
//
//  Created by Efe Yencilek on 2021-10-09.
//

import SwiftUI

struct MemeView: View {
    
    let item: Meme
    
    @Binding var shouldShow: Bool

    var body: some View {
        if #available(iOS 15.0, *) {
            VStack(alignment: .center) {
                //Text("\(item.name)")
                    //.font(.title2)
            }
            .padding()
            .frame(width: 150, height: 150, alignment: .center)
            .background {
                Image(uiImage: item.url.loadUIImage())
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .cornerRadius(5.0)
            }
            .onTapGesture {
                shouldShow = true
            }
        } else {
            // Fallback on earlier versions
            VStack(alignment: .center) {
                Text("\(item.name)")
                    .font(.title2)
                Image(uiImage: item.url.loadUIImage())
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
            }
            .padding()
            .cornerRadius(10.0)
            .frame(width: 150, height: 150, alignment: .center)
            .onTapGesture {
                shouldShow = true
            }
        }
    }
}
