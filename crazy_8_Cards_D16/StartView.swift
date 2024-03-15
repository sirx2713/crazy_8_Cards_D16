//
//  StartView.swift
//  crazy_8_Cards_D16
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/15.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Image("background1")
                VStack{
                    Image("logo")
                    
                    NavigationLink{
                        GameView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Image("play")
                    }
                }
            }
        }
    }
}

#Preview {
    StartView()
}
