//
//  CharacterView.swift
//  BBquotes
//
//  Created by Aymeric Pilaert on 29/01/2023.
//

import SwiftUI

struct CharacterView: View {
    let show: String
    let character: Character
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    Image(show.lowercased().filter { $0 != " "})
                        .resizable()
                        .scaledToFit()
                    
                    Spacer()
                }
                
                
                VStack {
                    
                    AsyncImage(url: character.image) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(25)
                            .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 2)
                            .padding(.top, 50)
                    } placeholder: {
                        ProgressView()
                    }
                    VStack(alignment: .leading) {
                        Text(character.name)
                            .font(.largeTitle)
                        
                        Text("Portrayed by: \(character.portrayedBy)")
                            .font(.subheadline)
                        
                        Text("\(character.name) character info")
                            .font(.title2)
                            .padding(.top, 7)
                        
                        Text("Born: \(character.birthday)")
                        
                        Text("Occupations: \(character.occupation.joined(separator: ", "))")
                        
                        Text("Nickname: \(character.nickname)")
                        
                    }
                    .padding()
                    
                }
                
                
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(show: "Breaking Bad", character: try! JSONDecoder().decode(Character.self, from: Data(contentsOf: Bundle.main.url(forResource: "samplecharacter", withExtension: "json")!)))
    }
}
