//
//  ContentView.swift
//  App550
//
//  Created by IGOR on 13/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Profile

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            if status {
            
            VStack(spacing: 0, content: {
            
                    TabView(selection: $current_tab, content: {
                        
                        ProfileView()
                            .tag(Tab.Profile)
                        
                        RulesView()
                            .tag(Tab.Rules)

                        NotesView()
                            .tag(Tab.Notes)
                        
                        SettingsView()
                            .tag(Tab.Settings)
                        
                    })
                    
                    TabBar(selectedTab: $current_tab)
                })
                    .ignoresSafeArea(.all, edges: .bottom)
                
            } else {
                
                R1()
            }
        }
    }
}

#Preview {
    ContentView()
}
