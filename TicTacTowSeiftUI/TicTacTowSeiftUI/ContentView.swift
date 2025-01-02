//
//  ContentView.swift
//  TicTacTowSeiftUI
//
//  Created by Khushbu Tadvi on 2024-12-31.
//

import SwiftUI

// Main view for displaying the Tic Tac Toe game board.
struct ContentView: View {
    
    // StateObject to manage the game state.
    @StateObject var gameState =  GameState()
    
    var body: some View {
        
        // Defines the spacing between cells on the board.
        let borderSize = CGFloat(5)
        
        // Displays the current player's turn at the top.
        Text(gameState.turnText())
            .font(.title)
            .bold()
            .padding()
        Spacer()// Adds spacing between elements.
        
        // Displays the score for "Crosses".
        Text(String(format: "Crosses: %d", gameState.crossScore))
            .font(.title)
            .bold()
            .padding()
        
        // Vertical stack to represent the game board.
        VStack(spacing: borderSize){
            
            // Loops through each row of the board.
            ForEach(0...2, id: \.self){
                row in
                // Horizontal stack for each row.
                HStack(spacing: borderSize){
                    
                    // Loops through each column of the row.
                    ForEach(0...2, id: \.self){
                        column in
                        
                        // Retrieves the cell at the current row and column.
                        let cell = gameState.board[row][column]
                        
                        // Placeholder for displaying a tile
                        Text(cell.displayTile())
                            .font(.system(size: 60))
                            .foregroundColor(cell.tileColor())
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1,contentMode: .fit)
                            .background(Color.white)
                            .onTapGesture {
                                gameState.placeTile(row, column)
                            }
                    }
                }
            }
        }
        .background(Color.black)  // Sets the board background color.
        .padding() // Adds padding around the board.
        .alert(isPresented: $gameState.showAlert){
            Alert(
                title: Text(gameState.alertMessage),
                dismissButton:.default(Text("Okay")){
                    gameState.resetBoard()
                }
            )
        }
        // Displays the score for "Noughts".
        Text(String(format: "Noughts: %d", gameState.noughtScore))
            .font(.title)
            .bold()
            .padding()
        Spacer()
    }
}

// Preview provider for displaying the ContentView in Xcode previews.
#Preview {
    ContentView()
}
