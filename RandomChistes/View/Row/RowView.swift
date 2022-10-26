//
//  RowView.swift
//  RandomChistes
//
//  Created by Brandon Alexis Martinez Cortes on 26/10/22.
//

import SwiftUI

struct RowView: View {
    let model : RandomOutput
    
    var body: some View {
        VStack(alignment: .leading){
            VStack{
                HStack(alignment: .top){
                    VStack{
                        Text("Joke: ")
                            .font(.caption)
                        ///Set value
                        Text(model.value)
                            .font(.body)

                        
                    }.padding(.all, 10)
                                    
                    Spacer()
                    ///Set image URL
                    AsyncImage(url: URL(string: model.icon_url),
                               content: {image in
                        
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100, maxHeight: 100)
                    },
                               placeholder: {
                        ProgressView()
                    }).padding(.all, 15)
                        
                        

                }
            }
            
        }.overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor(Color(red: 0.851, green: 0.851, blue: 0.851))).padding(.leading, 15).padding(.trailing, 15)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(model: RandomOutput(value: "Demo", icon_url: "https://rickandmortyapi.com/api/character/avatar/361.jpeg", updated_at: "", created_at: "", url: ""))
    }
}
