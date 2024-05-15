//
//  R3.swift
//  App550
//
//  Created by IGOR on 13/05/2024.
//

import SwiftUI

struct R3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("R3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .ignoresSafeArea()

            VStack {
                
                Text("Learn poker combinations")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
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
    R3()
}
