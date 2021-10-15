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
    
    var body: some Scene {
        WindowGroup {
            MemeScreen()
        }
    }
}
