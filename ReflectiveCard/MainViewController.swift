//
//  ViewController.swift
//  ReflectiveCard
//
//  Created by Caroline LaDouce on 1/26/22.
//

import UIKit

class MainViewController: UIViewController {
    
    let cardView = CardView()
    
    let testShinyView = TestShinyView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        //        view.addSubview(cardView)
        //        setupCardView()
        
        
        view.addSubview(testShinyView)
        setupShinyView()
        
        self.view = view
    }
    
    
    
    func setupShinyView() {
        testShinyView.backgroundColor = UIColor.clear
        
        testShinyView.translatesAutoresizingMaskIntoConstraints = false
        
        let testShinyViewConstraints = [
            testShinyView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testShinyView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            testShinyView.widthAnchor.constraint(equalToConstant: 350),
            testShinyView.heightAnchor.constraint(equalToConstant: 350)

        ]
        
        NSLayoutConstraint.activate(testShinyViewConstraints)
    }
    
    
    func setupCardView() {
        cardView.backgroundColor = UIColor.clear
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        let cardViewConstraints = [
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardView.widthAnchor.constraint(equalToConstant: 3.37 * 100),
            cardView.heightAnchor.constraint(equalToConstant: 2.125 * 100)
        ]
        
        NSLayoutConstraint.activate(cardViewConstraints)
    }
    
    
    
}

