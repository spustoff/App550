//
//  RulesView.swift
//  App550
//
//  Created by IGOR on 14/05/2024.
//

import SwiftUI

struct RulesView: View {
    
    @StateObject var viewModel = RulesViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Rules")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.bottom, 25)
                
                HStack {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            
                            
                            ForEach(viewModel.rules, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selRule = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(viewModel.selRule == index ? .black : .white)
                                        .font(.system(size: 15, weight: .medium))
                                        .padding(8)
                                        .padding(.horizontal, 7)
                                        .background(RoundedRectangle(cornerRadius: 6).fill(Color("prim2").opacity(viewModel.selRule == index ? 1 : 0)))
                                })
                            }
                        }
                    }
                    .frame(height: 50)
                }
                .padding(.bottom)
                
                if viewModel.selRule == "Start" {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        Text("Hold'em can be played by two to ten players at the same table. The figure shows a typical landing for this type of poker. In this example, there are three players sitting at the table.")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                        
                        Image("Start")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Text("Next, each player is dealt two cards face down (his hand) and the trading round begins.   After the player has assessed his chances of winning, he can do the following: • equalize (call) - equalize the bet. • fold - if a player is not ready to play with the cards he has, he can fold them and wait for the next hand. • raise - the player raises the bet/makes a bet more than the maximum amount placed on the table. • re-raise (reraise) - a player raises the bet in response to another player raising the bet • all-in (all-in) - the player bets all his available chips. • agree (check) - if the player does not want to bet anything and his current bet is equal to the maximum on the table, he can agree. The right to take action passes to the players clockwise. The player sitting to the left of the big blind moves first, and the big blind, respectively, moves last. The trading round ends when all the players who want to continue the game have leveled the highest bet. If no one has raised the maximum bet in the trading round, then the player, the one who made it is considered the winner and takes the whole pot.")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                    }
                    
                } else if viewModel.selRule == "Flop" {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack {
                            
                            Text("3 cards are laid out on the table in the open, which are called the Flop.")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Image("Flop")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            Text("Players can now make combinations by strengthening their starting hand. The second round of trading begins. The right to move is given to all active players in turn, also clockwise. The player sitting to the left of the dealer moves first, if he has thrown off the cards, then the right turn moves clockwise to the first active player. The trading rules are the same as in the first round")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        }
                    }
                    
                } else if viewModel.selRule == "Thorn" {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack {
                            
                            Text("Another card is laid out on the table in the open.")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Image("Thorn")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            Text("Now players can make five-card combinations out of the six cards they have. The third round of trading begins, identical to the previous one.")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        }
                    }
                    
                } else if viewModel.selRule == "River" {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack {
                            
                            Text("The last card is laid out on the table in the open.")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Image("River")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            Text("The fourth/last round of trading begins. The players make their last bets and actions before the showdown. All the cards open. The player who made the last bet opens his hand first.( if there were no bets, the player who is clockwise from the dealer opens first ) The combinations of the players are compared and a decision is made on the winner. The strongest combination wins.")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        }
                    }
                    
                } else if viewModel.selRule == "Combination" {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(spacing: 10) {
                            
                            ForEach(viewModel.combinations, id: \.self) { index in
                                
                                Image(index)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                    }

                } else if viewModel.selRule == "Kicker" {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack {
                            
                            Text("A kicker is a card that is not included in a poker combination, but is significant if two players have the same combinations. A kicker (one or more) has the following combinations: Pair, Two pairs, Three of a Kind, Four of a Kind. Let's give an example:")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Image("Kicker")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            Text("Both players have a 'pair of sevens' combination, but since the first one has an ace kicker and the second one has a king, the first player takes the bank.")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    RulesView()
}
