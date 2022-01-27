//
//  ViewController.swift
//  ReflectiveCard
//
//  Created by Caroline LaDouce on 1/26/22.
//

import UIKit

class MainViewController: UIViewController {
    
    let cardView = CardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        view.addSubview(cardView)
        setupCardView()
        
        self.view = view
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

