//
//  SettingsView.swift
//  App550
//
//  Created by IGOR on 15/05/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.bottom, 25)
                
                VStack(spacing: 14) {
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://docs.google.com/document/d/1zP83gohsbZRsSkek8FVZ84_tQ3JC8oRwNUgw5uulums/edit?usp=sharing") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "doc.text.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                                .padding(5)
                                .background(RoundedRectangle(cornerRadius: 7).fill(Color("prim3")))
                            
                            Text("Usage Policy")
                                .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 15, weight: .regular))
                        }
                    })
                    
                    Rectangle()
                        .fill(.white.opacity(0.1))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                                .padding(5)
                                .background(RoundedRectangle(cornerRadius: 7).fill(Color("prim3")))
                            
                            Text("Rate Us")
                                .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 15, weight: .regular))
                        }
                    })
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color("bg2")))
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
