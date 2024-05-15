//
//  EditProfile.swift
//  App550
//
//  Created by IGOR on 13/05/2024.
//

import SwiftUI

struct EditProfile: View {
    
    @StateObject var viewModel: ProfileViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.white.opacity(0.2))
                    .frame(width: 50, height: 4)
                
                Text("Editing profile")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .medium))
                    .padding()
                
                Rectangle()
                    .fill(.gray.opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                Menu(content: {
                    
                    Button(action: {
                        
                        viewModel.userPhoto = "men"
                        
                    }, label: {
                        
                        Image("men")
                    })
                    
                }, label: {
                    
                    if viewModel.userPhoto.isEmpty {
                        
                        Image("cam")
                            .padding(25)
                            .background(Circle().fill(.black))
                        
                    } else {
                        
                        Image(viewModel.userPhoto)
                    }
                    
                })
                .padding(.top, 60)

                        ZStack(content: {
                            
                            if viewModel.userName.isEmpty {
                                
                                Text("Username")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .semibold))
                                    .opacity(viewModel.UName.isEmpty ? 1 : 0)
                                
                            } else {
                                
                                Text(viewModel.userName)
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .semibold))
                                    .opacity(viewModel.UName.isEmpty ? 1 : 0)
                            }
                            
                            TextField("", text: $viewModel.UName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                                .padding(.leading, 100)
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))

                
                Button(action: {
                    
                    viewModel.userName = viewModel.UName
                    
                    viewModel.UName = ""
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isEditProfile = false
                    }
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                .padding()
                .padding(.top, 60)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    EditProfile(viewModel: ProfileViewModel())
}
