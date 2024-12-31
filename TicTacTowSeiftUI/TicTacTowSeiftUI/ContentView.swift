//
//  ContentView.swift
//  TicTacTowSeiftUI
//
//  Created by Khushbu Tadvi on 2024-12-31.
//

import SwiftUI

// Main view for displaying the Tic Tac Toe game board.
struct ContentView: View {
    var body: some View {
        
        // Defines the spacing between cells.
        let borderSize = CGFloat(5)
        
        VStack(spacing: borderSize){
            
            // Loops through each row of the board.
            ForEach(0...2, id: \.self){
                row in
                HStack(spacing: borderSize){
                    
                    // Loops through each column of the row.
                    ForEach(0...2, id: \.self){
                        column in
                        
                        // Placeholder for displaying a tile (currently always "X").
                        Text("X")
                            .font(.system(size: 60))
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1,contentMode: .fit)
                            .background(Color.white)
                    }
                }
            }
        }
        .background(Color.black)  // Sets the board background color.
        .padding() // Adds padding around the board.
    }
}

// Preview provider for displaying the ContentView in Xcode previews.
#Preview {
    ContentView()
}
