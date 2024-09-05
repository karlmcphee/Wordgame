//
//  ContentView.swift
//  WordGame
//
//  Created by Karl McPhee on 1/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var filename: String =  "/5_letter_words.txt"
    
    private let rows: Int
    private let columns: Int
    @State private var guessWord : String = ""
    @State private var realWord : String = ""
    @State private var randInt: Int = 0
    @State private var lines: Array<Substring>
    @State private var score: Int = 0
    
    private var letters = ["Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Enter", "Z","X","C","V","B","N","M", "BSpace", "Clear", "New Game"]
  
    init () {
        let filePath = Bundle.main.path(forResource: "5_letter_words", ofType: "txt")!
        let contents = try! String(contentsOfFile: filePath)
        rows = 2
        columns = 10
        guessWord = ""

        // Split the file into separate lines
        lines = contents.split(separator:"\n")
        username = String(lines[0])
        let randInt3 = Int.random(in: 5 ..< 1000)
        realWord = String(lines[randInt])
        print(String(lines[0]))
    }
    func button_Click(val: Int) {
        if (val == 19) {
            print("Submit") }
        else if(val == 27){
            if guessWord.count > 0 {
                guessWord = String(guessWord.dropLast())
            }}
        else if(val == 28) {
            guessWord = ""
        } else if(val == 29) {
            print("new game")
            guessWord = ""
            randInt = Int.random(in:0..<500)
            realWord = String(lines[randInt])
        } else {
            if guessWord.count < 5 {
                guessWord += letters[val]
            }
        }
        }

    var body: some View {
        VStack {
            Text("Score: " + String(score))
            Spacer()
            Text(realWord).font(.headline)
            Text(guessWord).font(.headline)
            ForEach(0...rows,  id: \.self) { row in
                HStack(spacing: 10) { ForEach(0 ..< columns, id: \.self) { number in
                   // Text(String(row*10 + number))
                    Button(
                        letters[row*10 + number], //action: {}
                        action: {
                            button_Click(val: row*10 + number)}
                    ).padding(3)
                    .border(.green, width: 1)
                }
                }
                }
            Spacer()
                }
            .padding()
        }
        

}

struct LetterView: View {
    var letter: String
    @State var isSelected: Bool = false
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        if isSelected {
            shape.fill().foregroundColor(.green)
        }
    }
}
//https://api.dictionaryapi.dev/api/v2/entries/en/foow
#Preview {
    ContentView()
}
