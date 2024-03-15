//
//  ContentView.swift
//  crazy_8_Cards_D16
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/15.
//

import SwiftUI

struct GameView: View {
    
    @State var playerCard = "back"
    @State var cpuCard = "back"
    @State var backGround = "background1"
    @State var cpuScore = 0
    @State var playerScore = 0
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image(backGround)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .ignoresSafeArea()
                
                VStack{
                    Spacer()
                    Image("logo")
                    Spacer()
                    HStack{
                        Spacer()
                        Image(playerCard)
                        Spacer()
                        Image(cpuCard)
                        Spacer()
                    }
                    Spacer()
                    Button(action: {
                        deal()
                    }, label: {
                        Image("button")
                    })
                    Spacer()
                    HStack{
                        Spacer()
                        VStack{
                            Text("Player")
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .padding(.bottom)
                            Text(String(playerScore))
                                .font(.largeTitle)
                                .foregroundColor(Color.white)
                        }
                        Spacer()
                        VStack{
                            Text("CPU")
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .padding(.bottom)
                            Text(String(cpuScore))
                                .font(.largeTitle)
                                .foregroundColor(Color.white)
                        }
                        Spacer()
                    }
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink{
                        StartView()
                                .navigationBarBackButtonHidden()
                    } label: {
                        VStack{ Image(systemName: "house.circle.fill")
                                .padding(.bottom, 3)
                            Text("Exit")
                                .font(.footnote)
                                .bold()
                        }.foregroundColor(.white)
                    }
                    Spacer()
                    Button(action: {
                        back()
                    }, label: {
                        VStack {
                            Image(systemName: "person.and.background.striped.horizontal")
                                .padding(.bottom, 3)
                            Text("Change Background")
                                .font(.footnote)
                                .bold()
                        }.foregroundColor(.white)
                    })
                    Spacer()
                    Button(action: {
                        reset()
                    }, label: {
                        VStack {
                            Image(systemName: "repeat.circle")
                                .padding(.bottom, 3)
                            Text("Restart")
                                .font(.footnote)
                                .bold()
                        }.foregroundColor(.white)
                    })
                    Spacer()
                }
                    Spacer()
                        }
                    }
                    Spacer()
                }
            }
    
    func deal(){
        
        //Randomise the player cards
        let playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        //Randomise the cpu cards
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        //Add 4 to player score
        if playerCard > cpuCard {
            playerScore += 4
        }
        
        //Add 4 to cpu score
        if cpuCard > playerCard {
            cpuScore += 4
        }
        
        //Add 1 to both if it's a tie
        else if playerCard == cpuCard {
            playerScore += 1
            cpuScore += 1
        }
    }
    
    func back(){
        
        //Randomise the background
        let backGroundValue = Int.random(in: 1...4)
        backGround = "background" + String(backGroundValue)
        
    }
    
    func reset(){
        
        //Reset scores, cards and background to default
        playerCard = "back"
        cpuCard = "back"
        backGround = "background1"
        playerScore = 0
        cpuScore = 0
    }
}

#Preview {
    GameView()
}
