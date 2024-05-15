//
//  Not.swift
//  App550
//
//  Created by IGOR on 13/05/2024.
//

import SwiftUI

struct Not: View {
    
    @AppStorage("status") var status: Bool = false

    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("Not")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .ignoresSafeArea()

            VStack {
                
                Text("Don’t miss anything")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    
                    
                    
                }, label: {
                    
                    Text("Enable notification")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color("prim")))
                })
                .padding()
            }
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .font(.system(size: 13, weight: .regular))
                        .padding(4)
                        .background(Circle().fill(.white))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    Not()
}
