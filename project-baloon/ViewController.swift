//
//  ViewController.swift
//  project-baloon
//
//  Created by Gabriel Freitas on 08/11/17.
//  Copyright © 2017 Gabriel Freitas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var winner = GridValue()
    var player = GridValue()
    
    /*let winner = [ 1, 2, 3,
                   8, 0, 4,
                   7, 6, 5 ]*/
    
    //var player = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    /*var player = [ 1, 2, 3,
                   8, 6, 4,
                   0, 7, 5 ]*/
    
    var steps = [[Int]]()
    var numberOfSteps = 0
    var storedNodes = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winner.value = [ 1, 2, 3,
                         8, 0, 4,
                         7, 6, 5 ]
        
        player.value = [ 1, 2, 3,
                         8, 6, 4,
                         0, 7, 5 ]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let PuzzleDetailVC = segue.destination as? PuzzleDetailViewController {
            PuzzleDetailVC.winnerSteps = steps
            PuzzleDetailVC.numberOfSteps = numberOfSteps
            PuzzleDetailVC.storedNodes = storedNodes
        }
    }
    
    @IBAction func myUnwindAction(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func runButtonAction(_ sender: UIButton) {
        
        Puzzle.queue = [GridValue]()
        steps = [[Int]]()
        
        Puzzle.queue.append(player)
        var i = 0
        
        while(true) {
            if winner.value == Puzzle.queue[i].value {
                print("Winner!")
                
                print("Father: \(String(describing: Puzzle.queue[i].father))")
                
                //Debug
                let aux = Puzzle.queue[i].value
                print("\(aux[0]) | \(aux[1]) | \(aux[2])")
                print("\(aux[3]) | \(aux[4]) | \(aux[5])")
                print("\(aux[6]) | \(aux[7]) | \(aux[8])")
                
                print("Steps: \(i)")
                print("Stored Nodes: \(Puzzle.queue.count)")
                numberOfSteps = i
                storedNodes = Puzzle.queue.count
                
                break
            } else {
                Puzzle.father = i
                
                let nullNodePosition = Puzzle.searchNullNode(Puzzle.queue[i].value)
                
                Puzzle.check(position: nullNodePosition, inPuzzle: Puzzle.queue[i].value)
                
                print("Father: \(String(describing: Puzzle.queue[i].father))")
                
                //Debug
                let aux = Puzzle.queue[i].value
                print("---[\(i)]---")
                print("\(aux[0]) | \(aux[1]) | \(aux[2])")
                print("\(aux[3]) | \(aux[4]) | \(aux[5])")
                print("\(aux[6]) | \(aux[7]) | \(aux[8])")
                print("---------")
            }
            i = i + 1
        }
        
        steps.append(Puzzle.queue[i].value)
        
        var dad = Puzzle.queue[i].father
        
        while(dad != nil) {
            let dadAux = Puzzle.queue[dad!]
            print("Father: \(String(describing: dadAux.father))")
            
            steps.append(dadAux.value)
            
            dad = dadAux.father
        }
        
        print(steps.count)
        
        steps.reverse()
        
        performSegue(withIdentifier: "PuzzleDetailVCSegue", sender: self)
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! PuzzleCollectionViewCell
        
        if player.value[indexPath.item] == 9 {
            player.value[indexPath.item] = 0
        } else {
            player.value[indexPath.item] = player.value[indexPath.item] + 1
        }
        
        let aux: NSNumber = player.value[indexPath.item] as NSNumber
        cell.puzzleLabelNumber.text = aux.stringValue
        
        print(player.value[indexPath.item])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "puzzleCell", for: indexPath) as! PuzzleCollectionViewCell
        
        cell.layer.cornerRadius = 38
        
        cell.layer.masksToBounds = true
        
        return cell
    }
}

