//
//  CollapseView.swift
//  MemeApp
//
//  Created by Efe Yencilek on 2021-10-14.
//

import SwiftUI

struct CollapseView: View {
    
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack {
            if (isShowing) {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                
                VStack {
                    Text("Hello")
                }
                .frame(height: 400)
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
