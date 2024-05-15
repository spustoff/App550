//
//  NotesView.swift
//  App550
//
//  Created by IGOR on 14/05/2024.
//

import SwiftUI

struct NotesView: View {

    @StateObject var viewModel = NotesViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Notes")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                 
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                        })
                        .opacity(viewModel.notes.isEmpty ? 0 : 1)
                    }
                }
                .padding(.bottom, 25)
                
                if viewModel.notes.isEmpty {
                    
                    VStack(spacing: 16) {
                        
                        Image("empty")
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .regular))
                        
                        Text("Add your first note. It will definitely help in the games")
                            .foregroundColor(.white.opacity(0.5))
                            .font(.system(size: 16, weight: .regular))
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("New note")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                                .frame(width: 140, height: 50)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color("prim")))
                        })
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.notes, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedNote = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        
                                        Text((index.notDate ?? Date()).convertDate(format: "dd MM YY"))
                                            .foregroundColor(.white.opacity(0.5))
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Text(index.notTitle ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                        
                                        Text(index.notText ?? "")
                                            .foregroundColor(.white.opacity(0.5))
                                            .font(.system(size: 14, weight: .regular))
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(Color("bg2")))
                                    .padding(.bottom, 5)
                                })
                            }
                        }
                    }
                }

            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchNotes()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            NotesDetail(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddNote(viewModel: viewModel)
        })
    }
}

#Preview {
    NotesView()
}
