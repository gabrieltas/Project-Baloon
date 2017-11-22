//
//  PuzzleDetailViewController.swift
//  project-baloon
//
//  Created by Gabriel Freitas on 09/11/17.
//  Copyright © 2017 Gabriel Freitas. All rights reserved.
//

import UIKit

class PuzzleDetailViewController: UIViewController {
    
    var numberOfSteps: Int!
    var storedNodes: Int!
    var winnerSteps = [[Int]]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    let cellScaling: CGFloat = 0.6
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
        print(winnerSteps.count)
    }
}

extension PuzzleDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return winnerSteps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "largeDetailCellReuser", for: indexPath) as! PuzzleDetailCollectionViewCell
        
        if indexPath.item == winnerSteps.count - 1{
            cell.backgroundColor = UIColor(red: 255.0/255.0, green: 111.0/255.0, blue: 185.0/255.0, alpha: 1.0)
            
        }
        
        print(indexPath.item)
        cell.label1.text = String(winnerSteps[indexPath.item][0])
        cell.label2.text = String(winnerSteps[indexPath.item][1])
        cell.label3.text = String(winnerSteps[indexPath.item][2])
        cell.label4.text = String(winnerSteps[indexPath.item][3])
        cell.label5.text = String(winnerSteps[indexPath.item][4])
        cell.label6.text = String(winnerSteps[indexPath.item][5])
        cell.label7.text = String(winnerSteps[indexPath.item][6])
        cell.label8.text = String(winnerSteps[indexPath.item][7])
        cell.label9.text = String(winnerSteps[indexPath.item][8])
        
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = true
        
        
        return cell
    }
}



extension PuzzleDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let edge = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 17)
        
        return edge
    }
}

extension PuzzleDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "puzzleDetailTableViewCell", for: indexPath) as! PuzzleDetailTableViewCell
        
        if indexPath.item == 0 {
            cell.titleLabel.text = "Steps"
            cell.infoLabel.text = String(winnerSteps.count)
        } else {
            cell.titleLabel.text = "Stored"
            cell.infoLabel.text = String(storedNodes)
        }
        
        return cell
    }
}





