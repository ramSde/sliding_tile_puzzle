
//
//  TileView.swift
//  Puzzle15ChatGPT
//
//  Created by Tihomir RAdeff on 23.03.23.
//

import Foundation
import SwiftUI

struct TileView: View {
    let number: Int
    let size: CGFloat
    let onTap: () -> Void
    
    var body: some View {
        ZStack {
            if number != 0 {
                Color.white
                Image("tile")
                    .resizable()
                    .scaleEffect(CGSize(width: 1.4, height: 1.4))
                    .frame(width: 100, height: 100)
                Text("\(number)")
                    .font(.system(size: size * 0.4))
            } else {
                Text("\(number)")
                    .font(.system(size: size * 0.4))
                    .foregroundColor(Color.white)
            }
        }
        .frame(width: size, height: size)
        .onTapGesture {
            onTap()
        }
    }
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        TileView(number: 15, size: 100, onTap: {})
    }
}
