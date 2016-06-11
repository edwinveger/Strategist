//
//  TreeSearchPolicy.swift
//  Strategist
//
//  Created by Vincent Esche on 09/06/16.
//  Copyright © 2016 Vincent Esche. All rights reserved.
//

import Darwin

public protocol TreeSearchPolicy {
    associatedtype Game: Strategist.Game
    func filterMoves(state: Game, depth: Int, moves: AnyGenerator<Game.Move>) -> AnyGenerator<Game.Move>
    func hasReachedMaxDepth(depth: Int) -> Bool
}

public struct SimpleTreeSearchPolicy<G: Game>: TreeSearchPolicy {
    public typealias Game = G

    public let maxMoves: Int
    public let maxDepth: Int

    public init(maxMoves: Int, maxDepth: Int) {
        self.maxMoves = maxMoves
        self.maxDepth = maxDepth
    }

    public func filterMoves(state: Game, depth: Int, moves: AnyGenerator<Game.Move>) -> AnyGenerator<Game.Move> {
        return AnyGenerator(moves.generate().take(self.maxMoves))
    }

    public func hasReachedMaxDepth(depth: Int) -> Bool {
        return depth >= self.maxDepth
    }
}
