//
//  Puzzle.swift
//  project-baloon
//
//  Created by Gabriel Freitas on 10/11/17.
//  Copyright © 2017 Gabriel Freitas. All rights reserved.
//

import Foundation

class Puzzle {
    
    static var queue = [GridValue]()
    
    static var father: Int!
    
    //Metodo que procura o espaco em branco de um estado
    static public func searchNullNode(_ array: [Int]) -> Int {
        for i in 0...8 {
            if(array[i] == 0) {
                return i
            }
        }
        
        //queue[0][0] = 1
        
        return 0
    }
    
    //Metodo que identifica qual posicao devera ser trocada e a possibilidade de estados
    static public func check(position nullPosition : Int, inPuzzle puzzle: [Int]) {
        if nullPosition == 0 {
            changePosition(inPuzzle: puzzle, nullPosition: 0, numberPosition: 1)
            changePosition(inPuzzle: puzzle, nullPosition: 0, numberPosition: 3)
        } else if nullPosition == 1 {
            changePosition(inPuzzle: puzzle, nullPosition: 1, numberPosition: 0)
            changePosition(inPuzzle: puzzle, nullPosition: 1, numberPosition: 2)
            changePosition(inPuzzle: puzzle, nullPosition: 1, numberPosition: 4)
        } else if nullPosition == 2 {
            changePosition(inPuzzle: puzzle, nullPosition: 2, numberPosition: 1)
            changePosition(inPuzzle: puzzle, nullPosition: 2, numberPosition: 5)
        } else if nullPosition == 3 {
            changePosition(inPuzzle: puzzle, nullPosition: 3, numberPosition: 0)
            changePosition(inPuzzle: puzzle, nullPosition: 3, numberPosition: 4)
            changePosition(inPuzzle: puzzle, nullPosition: 3, numberPosition: 6)
        } else if nullPosition == 4 {
            changePosition(inPuzzle: puzzle, nullPosition: 4, numberPosition: 1)
            changePosition(inPuzzle: puzzle, nullPosition: 4, numberPosition: 3)
            changePosition(inPuzzle: puzzle, nullPosition: 4, numberPosition: 5)
            changePosition(inPuzzle: puzzle, nullPosition: 4, numberPosition: 7)
        } else if nullPosition == 5 {
            changePosition(inPuzzle: puzzle, nullPosition: 5, numberPosition: 2)
            changePosition(inPuzzle: puzzle, nullPosition: 5, numberPosition: 4)
            changePosition(inPuzzle: puzzle, nullPosition: 5, numberPosition: 8)
        } else if nullPosition == 6 {
            changePosition(inPuzzle: puzzle, nullPosition: 6, numberPosition: 3)
            changePosition(inPuzzle: puzzle, nullPosition: 6, numberPosition: 7)
        } else if nullPosition == 7 {
            changePosition(inPuzzle: puzzle, nullPosition: 7, numberPosition: 4)
            changePosition(inPuzzle: puzzle, nullPosition: 7, numberPosition: 6)
            changePosition(inPuzzle: puzzle, nullPosition: 7, numberPosition: 8)
        } else if nullPosition == 8 {
            changePosition(inPuzzle: puzzle, nullPosition: 8, numberPosition: 5)
            changePosition(inPuzzle: puzzle, nullPosition: 8, numberPosition: 7)
        }
    }
    
    //Metodo de troca de posicoes
    static public func changePosition(inPuzzle puzzle: [Int], nullPosition: Int, numberPosition: Int) {
        let auxPuzzle = GridValue()
        auxPuzzle.value = puzzle
        
        let aux = auxPuzzle.value[numberPosition]
        auxPuzzle.value[numberPosition] = 0
        auxPuzzle.value[nullPosition] = aux
        
        auxPuzzle.father = father
        
        queue.append(auxPuzzle)
    }
}
