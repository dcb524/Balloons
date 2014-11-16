//
//  ViewController.swift
//  Balloons
//
//  Created by Daniel Bienkowski on 11/16/14.
//  Copyright (c) 2014 Daniel Bienkowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    var myBalloons:[Balloon] = []
    
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadBalloons()
        let initialBalloon = self.myBalloons[0]
        self.myImage.image = initialBalloon.image
        self.myLabel.text = initialBalloon.numberofBalloons
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func myNextButtonPressed(sender: UIBarButtonItem) {
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
    
            let currentBalloon = self.myBalloons[self.currentIndex]
            
            self.myImage.image = currentBalloon.image
            self.myLabel.text = currentBalloon.numberofBalloons
            
            self.currentIndex += 1
            
            }, completion: { (finished: Bool) -> () in
        })
    }
    
    func loadBalloons () {
        var randomIndex: Int
        var loadBalloon = Balloon()
        
        for var i = 1; i <= 100; i++ {

            randomIndex = Int(arc4random_uniform(UInt32(4)))
            
            switch randomIndex {
                case 1:
                    loadBalloon.image = UIImage(named: "RedBalloon1.jpg")
                case 2:
                    loadBalloon.image = UIImage(named: "RedBalloon2.jpg")
                case 3:
                    loadBalloon.image = UIImage(named: "RedBalloon3.jpg")
                default:
                    loadBalloon.image = UIImage(named: "RedBalloon1.jpg")
            }
            if i == 1 {
                loadBalloon.numberofBalloons = "\(i)" + " Balloon"
            }
            else {
                loadBalloon.numberofBalloons = "\(i)" + " Balloons"
            }
            myBalloons += [loadBalloon]
        }
    }

}

