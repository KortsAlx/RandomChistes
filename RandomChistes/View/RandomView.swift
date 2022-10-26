//
//  RandomView.swift
//  RandomChistes
//
//  Created by Brandon Alexis Martinez Cortes on 25/10/22.
//

import SwiftUI

struct RandomView: View {
    ///Intance View Model
    @StateObject var RandomVM = RandomViewModel()
    
    var body: some View {
        Text("Jokes Random")
        VStack{
            ///List Items Joke
            List(RandomVM.getItems, id: \.id) { random in
                RowView(model: random)
                
            }.listStyle(.plain)
            
        }.task {
            ///Condition Items Random Joke
            while RandomVM.viewList {
                RandomVM.getRandomItems()

            }
            
        }
    }
}

struct RandomView_Previews: PreviewProvider {
    static var previews: some View {
        RandomView()
    }
}
