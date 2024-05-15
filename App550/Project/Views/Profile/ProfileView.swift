//
//  ProfileView.swift
//  App550
//
//  Created by IGOR on 13/05/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 12) {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isEditStatistics = true
                        }
                        
                    }, label: {
                        
                        Image("edit")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    })
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isEditProfile = true
                        }
                        
                    }, label: {
                                                
                        VStack {
                            
                            if viewModel.userPhoto.isEmpty {
                                
                                Image("cam")
                                    .padding(25)
                                    .background(Circle().fill(.black))
                                
                            } else {
                                
                                Image(viewModel.userPhoto)
           
                            }
                            
                            if viewModel.userName.isEmpty {
                                
                                Text("Username")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .semibold))
                                    .padding(.bottom)
                                
                            } else {
                                
                                Text(viewModel.userName)
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .semibold))
                                    .padding(.bottom)
                            }
                        }
                    })

                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                
                ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("Number of posts")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 14, weight: .medium))
                    
                    if viewModel.posts.isEmpty {
                        
                        Text("0")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                        
                    } else {
                        
                        Text(viewModel.posts)
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                    }
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("My Bets")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 14, weight: .medium))
                        
                        if viewModel.bets.isEmpty {
                            
                            Text("0")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                            
                        } else {
                            
                            Text(viewModel.bets)
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                        }
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("My Games")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 14, weight: .medium))
                        
                        if viewModel.games.isEmpty {
                            
                            Text("0")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                            
                        } else {
                            
                            Text(viewModel.games)
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                        }
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("Money won")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 14, weight: .medium))
                    
                    if viewModel.moneyWon.isEmpty {
                        
                        Text("+$0.00")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 22, weight: .semibold))
                        
                    } else {
                        
                        Text(viewModel.moneyWon)
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("Lost money")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 14, weight: .medium))
                    
                    if viewModel.moneyLost.isEmpty {
                        
                        Text("-$0.00")
                            .foregroundColor(.red)
                            .font(.system(size: 22, weight: .semibold))
                        
                        
                    } else {
                        
                        Text(viewModel.moneyLost)
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                
            }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isEditProfile, content: {
            
            EditProfile(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isEditStatistics, content: {
            
            EditStat(viewModel: viewModel)
        })
    }
}

#Preview {
    ProfileView()
}
