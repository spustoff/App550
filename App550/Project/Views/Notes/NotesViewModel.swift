//
//  NotesViewModel.swift
//  App550
//
//  Created by IGOR on 14/05/2024.
//

import SwiftUI
import CoreData

final class NotesViewModel: ObservableObject {

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isReset: Bool = false
    @Published var isDetail: Bool = false

    @Published var notTitle = ""
    @Published var notText = ""
    @Published var notDate: Date = Date()

    @Published var notes: [NotesModel] = []
    @Published var selectedNote: NotesModel?

    func addNote() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "NotesModel", into: context) as! NotesModel

        loan.notTitle = notTitle
        loan.notText = notText
        loan.notDate = notDate

        CoreDataStack.shared.saveContext()
    }
    
    func fetchNotes() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NotesModel>(entityName: "NotesModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.notes = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.notes = []
        }
    }
    
}
