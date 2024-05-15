//
//  TabBar.swift
//  App550
//
//  Created by IGOR on 13/05/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("prim") : Color.gray.opacity(0.4))
                            .frame(width: 15, height: 15)
                        
                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("prim") : Color.gray.opacity(0.4))
                            .font(.system(size: 11, weight: .regular))
                        
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 28)
        .background(RoundedRectangle(cornerRadius: 20).fill(.black))
        .ignoresSafeArea()
    }
}

enum Tab: String, CaseIterable {
    
    case Profile = "Profile"
    
    case Rules = "Rules"
    
    case Notes = "Notes"
        
    case Settings = "Settings"
    
}
