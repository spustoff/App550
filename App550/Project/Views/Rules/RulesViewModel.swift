//
//  RulesViewModel.swift
//  App550
//
//  Created by IGOR on 14/05/2024.
//

import SwiftUI

final class RulesViewModel: ObservableObject {
    

    @Published var rules: [String] = ["Start", "Flop", "Thorn", "River", "Combination", "Kicker"]
    @Published var selRule = "Start"

    @Published var combinations: [String] = ["Royal Flush", "Straight Flush", "Four of a Kind", "Full Hause", "Flush", "Straight", "Three of a kind", "Two pair", "Pair", "High card"]

}
