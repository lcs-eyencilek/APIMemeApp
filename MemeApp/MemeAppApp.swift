//
//  MemeAppApp.swift
//  MemeApp
//
//  Created by Efe Yencilek on 2021-10-08.
//

import SwiftUI

@main
struct MemeAppApp: App {
    
    @StateObject private var vm = MemeViewModel(
        caller: APICaller()
    )
    
    @State private var selectedItem = Meme(id: "", name: "", url: "", width: 0, height: 0, box_count: 0)
    
    var body: some Scene {
        WindowGroup {
            MemeScreen(selectedItem: $selectedItem, vm: vm)
        }
    }
}
