//
//  Cell.swift
//  TicTacTowSeiftUI
//
//  Created by Khushbu Tadvi on 2024-12-31.
//


import Foundation
import SwiftUICore

//   Represents a single cell on the game board.
struct Cell {
    
    // The tile in the cell (e.g., Nought, Cross, Empty).
    var tile: Tile
    
    // Returns a string representation of the tile for display.
    func displayTile() -> String {
        switch tile {
        case .Nought:
            return "O"
        case .Cross:
            return "X"
        default :
            return ""
        }
    }
    
    // Returns the color associated with the tile.
    func tileColor() -> Color {
        switch tile {
        case .Nought:
            return Color.red
        case .Cross:
            return Color.black
        default :
            return Color.black
        }
    }
    
}
// Enum representing the possible tile states in the game.
enum Tile {
    case Nought
    case Cross
    case Empty
}
