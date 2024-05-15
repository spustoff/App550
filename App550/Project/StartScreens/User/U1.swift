//
//  U1.swift
//  App550
//
//  Created by IGOR on 13/05/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("U1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .ignoresSafeArea()

            VStack {
                
                Text("Explore your results in awesome way!")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding()
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Reviews()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color("prim")))
                })
                .padding()
            }
        }
    }
}

#Preview {
    U1()
}
