//
//  MemeScreen.swift
//  MemeApp
//
//  Created by Efe Yencilek on 2021-10-09.
//

import SwiftUI

struct MemeScreen: View {
    
    @Binding var selectedItem: Meme
    
    @ObservedObject var vm = MemeViewModel(
        caller: APICaller()
    )
    
    @State private var displayMemes: [Meme] = []
    
    @State private var showItem = Meme(id: "", name: "", url: "", width: 0, height: 0, box_count: 0)
    
    @State private var inputText: String = ""
    
    let layout: [GridItem] = [
        GridItem(.flexible(minimum: 120, maximum: 160)),
        GridItem(.flexible(minimum: 120, maximum: 160))
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            HStack {
                Spacer()
                if #available(iOS 15.0, *) {
                    VStack {
                        
                        Spacer()
                        
                        if vm.memeRes.data.memes.isEmpty {
                            LoadingView(text: "Fetching Data")
                        } else {
                            SearchBar(text: $inputText, arrayChange: $displayMemes, vm: vm)
                                .padding(.top)
                                .padding(.bottom)
                            ScrollView {
                                LazyVGrid(columns: layout) {
                                    ForEach(displayMemes, id: \.id) { item in
                                        MemeView(item: item, shouldShowItem: $showItem)
                                    }
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
                        displayMemes = vm.memeRes.data.memes
                    }
                } else {
                    // Fallback on earlier versions
                    List {
                        ForEach(Meme.dummyData, id: \.id) { item in
                            MemeView(item: item, shouldShowItem: $showItem)
                        }
                    }
                }
                Spacer()
            }
            .background(Color.gray)
            .edgesIgnoringSafeArea(.all)
            
            CollapseView(isShowingItem: $showItem)
        }
    }
}

//struct MemeScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        MemeScreen()
//    }
//}
