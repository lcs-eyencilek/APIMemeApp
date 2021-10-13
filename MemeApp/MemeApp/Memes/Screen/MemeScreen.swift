//
//  MemeScreen.swift
//  MemeApp
//
//  Created by Efe Yencilek on 2021-10-09.
//

import SwiftUI

struct MemeScreen: View {
    
    @StateObject private var vm = MemeViewModel(
        caller: APICaller()
    )
    
    var body: some View {
        HStack {
            Spacer()
            if #available(iOS 15.0, *) {
                VStack {
                    Spacer()
                    if vm.memeRes.data.memes.isEmpty {
                        LoadingView(text: "Fetching Data")
                    } else {
                        ScrollView {
                            ForEach(vm.memeRes.data.memes, id: \.id) { item in
                                MemeView(item: item)
                            }
                        }
                    }
                    Spacer()
                }
                .padding(.top)
                .padding(.top)
                .task {
                    // With task method, you make the view wait for the code inside the task block to be executed before appearing, or loading
                    await vm.getMemes()
                }
            } else {
                // Fallback on earlier versions
                List {
                    ForEach(Meme.dummyData, id: \.id) { item in
                        MemeView(item: item)
                    }
                }
            }
            Spacer()
        }
        .background(Color.gray)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MemeScreen_Previews: PreviewProvider {
    static var previews: some View {
        MemeScreen()
    }
}
