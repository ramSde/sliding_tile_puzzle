//
//  GameView.swift
//  Puzzle15ChatGPT
//
//  Created by Tihomir RAdeff on 23.03.23.
//

import Foundation
import SwiftUI

struct GameView: View {
    let size: Int
    let tileSize: CGFloat
    
    @State var tiles: [Int] = Array(1...15).shuffled() + [0]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<size) { row in
                HStack(spacing: 0) {
                    ForEach(0..<size) { column in
                        TileView(
                            number: tiles[row * size + column],
                            size: tileSize
                        ) {
                            self.tapTile(at: (row, column))
                        }
                    }
                }
            }
        }
        .onAppear(perform: {
            while !isSolvable(size: size, tiles: tiles) {
                tiles.shuffle()
            }
        })
    }
    
    func tapTile(at position: (row: Int, column: Int)) {
        let index = position.row * size + position.column
        
        // Check if the tapped tile can be moved
        if canMoveTile(at: position) {
            // Swap the tapped tile with the empty tile
            let emptyIndex = tiles.firstIndex(of: 0)!
            tiles.swapAt(index, emptyIndex)
            
            //check for win
            if tiles == [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0] {
                print("you win")
            }
        }
    }

    func canMoveTile(at position: (row: Int, column: Int)) -> Bool {
        //let index = position.0 * size + position.1
        
        // Check if the tapped tile is adjacent to the empty tile
        let emptyIndex = tiles.firstIndex(of: 0)!
        let emptyPosition = (emptyIndex / size, emptyIndex % size)
        return abs(emptyPosition.0 - position.0) + abs(emptyPosition.1 - position.1) == 1
    }
    
    func isSolvable(size: Int, tiles: [Int]) -> Bool {
        var inversions = 0
        for i in 0..<tiles.count {
            if tiles[i] == 0 { continue }
            for j in (i+1)..<tiles.count {
                if tiles[j] == 0 { continue }
                if tiles[j] < tiles[i] {
                    inversions += 1
                }
            }
        }
        return inversions % 2 == 0
    }
}
