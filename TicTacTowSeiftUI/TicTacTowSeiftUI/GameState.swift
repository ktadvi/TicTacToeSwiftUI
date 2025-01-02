
//
//  is.swift
//  TicTacTowSeiftUI
//
//  Created by Khushbu Tadvi on 2024-12-31.
//


import Foundation

// The `GameState` class is responsible for managing the game board and logic.
class GameState: ObservableObject {
    
    // A 2D array representing the game board, each cell contains a `Tile`.
    @Published var board = [[Cell]]()
    
    // Keeps track of the current player's turn (either Cross or Nought).
    @Published var turn = Tile.Cross
    
    // Stores the scores for Cross and Nought players.
    @Published var noughtScore = 0
    @Published var crossScore = 0
    
    // Controls the display of an alert in case of a win or draw.
    @Published var showAlert = false
    
    // Message to be displayed in the alert.
    @Published var alertMessage = "Draw"
    
    // A flag indicating whether the game resulted in a draw.
    @Published var gameDraw = false
    
    // Initializes the game state by resetting the board.
    init() {
        resetBoard()
    }
    
    // Returns the text indicating whose turn it is.
    func turnText() -> String {
        return turn == Tile.Cross ? "Turn : X" : "Turn : O"
    }
    
    // Places a tile on the board at the specified row and column.
    func placeTile(_ row : Int, _ column : Int) {
        
        // If the cell is not empty, do nothing.
        if(board[row][column].tile != Tile.Empty){
            return
        }
        
        // Set the tile for the current turn.
        board[row][column].tile = turn == Tile.Cross ? Tile.Cross : Tile.Nought
        
        // Check for victory after placing the tile.
        if(checkForVictory()){
            if(turn == Tile.Cross){
                crossScore += 1
            }
            else{
                noughtScore += 1
            }
            
            // Set the alert message to indicate the winner.
            let winner = turn == Tile.Cross ? "Cross" : "Nought"
            alertMessage = winner + " Wins!"
            showAlert = true
        }
        else {
            // Switch the turn to the other player.
            turn = turn == Tile.Cross ? Tile.Nought : Tile.Cross
        }
        
        // Check for a draw after placing the tile.
        if(checkForDraw()){
            alertMessage = "Draw"
            showAlert = true
        }
    }
    
    // Checks if the game has ended in a draw.
    func checkForDraw() -> Bool{
        for row in board {
            for cell in row {
                // If any cell is empty, the game is not a draw.
                if cell.tile == Tile.Empty{
                    return false
                }
            }
        }
        return true
    }
    
    // Checks if the current player has achieved victory.
    func checkForVictory() -> Bool{
        
        //vertical victory
        if isTurnTile(0, 0) && isTurnTile(1, 0) && isTurnTile(2, 0){
            return true
        }
        if isTurnTile(0, 1) && isTurnTile(1, 1) && isTurnTile(2, 1){
            return true
        }
        if isTurnTile(0, 2) && isTurnTile(1, 2) && isTurnTile(2, 2){
            return true
        }
        
        //horizontal victory
        if isTurnTile(0, 0) && isTurnTile(0, 1) && isTurnTile(0, 2){
            return true
        }
        if isTurnTile(1, 0) && isTurnTile(1, 1) && isTurnTile(1, 2){
            return true
        }
        if isTurnTile(2, 0) && isTurnTile(2, 1) && isTurnTile(2, 2){
            return true
        }
        
        //diagonal victory
        if isTurnTile(0, 0) && isTurnTile(1, 1) && isTurnTile(2, 2){
            return true
        }
        if isTurnTile(0, 2) && isTurnTile(1, 1) && isTurnTile(2, 0){
            return true
        }
        
        return false
    }
    
    // Checks if the tile at the specified position matches the current turn's tile.
    func isTurnTile(_ row : Int, _ column : Int) -> Bool{
        return board[row][column].tile == turn
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
