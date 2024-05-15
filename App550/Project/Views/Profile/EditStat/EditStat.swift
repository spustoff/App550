//
//  EditStat.swift
//  App550
//
//  Created by IGOR on 13/05/2024.
//

import SwiftUI

struct EditStat: View {

    @StateObject var viewModel: ProfileViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color("bg2"))
                    .frame(width: 50, height: 4)
                
                Text("Editing statistics")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .medium))
                    .padding()
                
                Rectangle()
                    .fill(.gray.opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 10) {
                        
                        Text("Number of posts")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("0")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.UPosts.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.UPosts)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        Text("My Bets")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("0")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.UBets.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.UBets)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        Text("My Games")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("0")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.UGames.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.UGames)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        .padding(.bottom)
                        
                        Text("Money won")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("$0.00")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.UWon.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.UWon)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        Text("Lost money")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("$0.00")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.ULost.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.ULost)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                    }
                }
                .padding()
                
                Button(action: {
                    
                    viewModel.posts = viewModel.UPosts
                    viewModel.bets = viewModel.UBets
                    viewModel.games = viewModel.UGames
                    viewModel.moneyWon = viewModel.UWon
                    viewModel.moneyLost = viewModel.ULost
                    
                    viewModel.UPosts = ""
                    viewModel.UBets = ""
                    viewModel.UGames = ""
                    viewModel.UWon = ""
                    viewModel.ULost = ""
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isEditStatistics = false
                        
                    }
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                .padding()
                
            }
        }
    }
}

#Preview {
    EditStat(viewModel: ProfileViewModel())
}
