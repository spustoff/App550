//
//  LoadingView.swift
//  App550
//
//  Created by IGOR on 13/05/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(100)
                
                ProgressView()
            }
        }
    }
}

#Preview {
    LoadingView()
}
