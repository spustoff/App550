//
//  ProfileViewModel.swift
//  App550
//
//  Created by IGOR on 13/05/2024.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    
    @AppStorage("userPhoto") var userPhoto = ""
    @AppStorage("userName") var userName = ""
    @AppStorage("posts") var posts = ""
    @AppStorage("bets") var bets = ""
    @AppStorage("games") var games = ""
    @AppStorage("moneyWon") var moneyWon = ""
    @AppStorage("moneyLost") var moneyLost = ""

    @Published var UPhoto = ""
    @Published var UName = ""
    @Published var UPosts = ""
    @Published var UBets = ""
    @Published var UGames = ""
    @Published var UWon = ""
    @Published var ULost = ""
    
    @Published var isEditProfile: Bool = false
    @Published var isEditStatistics: Bool = false


}

