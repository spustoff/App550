//
//  AddNote.swift
//  App550
//
//  Created by IGOR on 14/05/2024.
//

import SwiftUI

struct AddNote: View {

    @StateObject var viewModel: NotesViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color("bg2"))
                    .frame(width: 50, height: 4)
                
                Text("New note")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .medium))
                    .padding()
                
                Rectangle()
                    .fill(.gray.opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 10) {

                        ZStack(alignment: .leading, content: {
                            
                            Text("Title")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.notTitle.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.notTitle)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))

                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))

                        ZStack(alignment: .leading, content: {
                            
                            Text("Text")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.notText.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.notText)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))

                    }
                }
                .padding()
                
                Button(action: {
                    
                    viewModel.addNote()
                    
                    viewModel.notTitle = ""
                    viewModel.notText = ""
                    
                    viewModel.fetchNotes()
                    
                    viewModel.isAdd = false
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                .padding()
                .opacity(viewModel.notText.isEmpty || viewModel.notTitle.isEmpty ? 0.5 : 1)
                .disabled(viewModel.notText.isEmpty || viewModel.notTitle.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    AddNote(viewModel: NotesViewModel())
}
