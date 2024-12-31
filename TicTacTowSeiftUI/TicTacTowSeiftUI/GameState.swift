
//
//  is.swift
//  TicTacTowSeiftUI
//
//  Created by Khushbu Tadvi on 2024-12-31.
//


import Foundation

// The `GameState` class is responsible for managing the game board and logic.
class GameState: ObservableObject {
    
    // Published property to notify views about board updates.
    @Published var board = [[Cell]]()
    
    // Initializes the game state by resetting the board.
    init() {
        resetBoard()
    }
    
    // Resets the game board to an empty state.
    func resetBoard() {
        var newBoard = [[Cell]]()
        
        // Creates a 3x3 grid of empty cells.
        for _ in 0...2{
            var row = [Cell]()
            for _ in 0...2{
                row.append(Cell(tile: Tile.Empty))
            }
            newBoard.append(row)
        }
        
        // Updates the board with the new empty grid.
        board = newBoard
    }
}
