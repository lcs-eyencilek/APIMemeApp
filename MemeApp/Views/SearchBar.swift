//
//  SearchBar.swift
//  MemeApp
//
//  Created by Efe Yencilek on 2021-10-16.
//

import SwiftUI
 
struct SearchBar: View {
    
    @Binding var text: String
    
    @Binding var arrayChange: [Meme]
    
    @ObservedObject var vm: MemeViewModel
 
    var body: some View {
        HStack {
 
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onChange(of: text) { _ in
                    arrayChange = vm.filteredMemes(searchText: text)
                }
        }
    }
}
