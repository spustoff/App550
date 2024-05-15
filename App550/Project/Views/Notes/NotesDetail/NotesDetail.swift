//
//  NotesDetail.swift
//  App550
//
//  Created by IGOR on 14/05/2024.
//

import SwiftUI

struct NotesDetail: View {
    
    @StateObject var viewModel: NotesViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.white.opacity(0.2))
                    .frame(width: 50, height: 4)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading ,spacing: 10) {
                        
                        Text(viewModel.selectedNote?.notTitle ?? "")
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .regular))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                        
                        Text(viewModel.selectedNote?.notText ?? "")
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .regular))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                        
                    }
                }
                .padding()
                
                HStack {
                    
                    Button(action: {
                        
                        viewModel.isDetail = false
                        
                    }, label: {
                        
                        Text("Back")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    
                    Button(action: {
                        
                        viewModel.isDelete = true
                        
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(Color("prim3"))
                            .font(.system(size: 15, weight: .medium))
                            .frame(width: 110, height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim3")))
                    })
                }
                .padding()
            }
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    HStack {
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteNote(withNoteTitle: viewModel.selectedNote?.notTitle ?? "", completion: {
                            
                            viewModel.fetchNotes()
                        })
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            viewModel.isDetail = false
                            
                        }
                        
                    }, label: {
                        
                        Text("Yes")
                            .foregroundColor(.blue)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("No")
                            .foregroundColor(.blue)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    NotesDetail(viewModel: NotesViewModel())
}
