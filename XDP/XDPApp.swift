//
//  XDPApp.swift
//  XDP
//
//  Created by Bartosz Rzechółka on 14/07/2022.
//

import SwiftUI

@main
struct XDPApp: App {
    @AppStorage("MainView") var isMainViewActive: Bool = true
    var body: some Scene {
        WindowGroup {
            if isMainViewActive{
            MainView()
            }else {
                ContentView()
            
            }
    }
}
}
