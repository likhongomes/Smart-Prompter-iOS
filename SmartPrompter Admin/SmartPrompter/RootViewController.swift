//
//  RootViewController.swift
//  SmartPrompter
//
//  Created by Likhon Gomes on 4/9/20.
//  Copyright © 2020 Likhon Gomes. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    let topLeftButton = UIButton()
    let topRightButton = UIButton()
    let viewContollerLabel = UILabel()
    let buttonStack = UIStackView()
    
    let topButtonSize = CGFloat(30)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        topLeftButtonSetup()
        viewControllerLabelSetup()
        topRightButtonSetup()
    }
    
    func topLeftButtonSetup(){
        view.addSubview(topLeftButton)
        topLeftButton.translatesAutoresizingMaskIntoConstraints = false
        topLeftButton.heightAnchor.constraint(equalToConstant: topButtonSize).isActive = true
        topLeftButton.widthAnchor.constraint(equalToConstant: topButtonSize).isActive = true
        topLeftButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        if #available(iOS 11.0, *) {
            topLeftButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        } else {
            topLeftButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        }
        topLeftButton.backgroundColor = .black
        topLeftButton.addTarget(self, action: #selector(topLeftButtonTapped), for: .touchUpInside)
    }
    
    @objc func topLeftButtonTapped(){
        print("Top Left Button Tapped")
    }
    
    func topRightButtonSetup(){
        view.addSubview(topRightButton)
        topRightButton.translatesAutoresizingMaskIntoConstraints = false
        topRightButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        topRightButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        topRightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        if #available(iOS 11.0, *) {
            topRightButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        } else {
            topRightButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        }
        topRightButton.backgroundColor = .black
        topRightButton.addTarget(self, action: #selector(topRightButtonTapped), for: .touchUpInside)
    }
    
    @objc func topRightButtonTapped(){
        print("Top Right Button Tapped")
    }
    
    func viewControllerLabelSetup(){
        view.addSubview(viewContollerLabel)
        viewContollerLabel.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            viewContollerLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10+topButtonSize).isActive = true
        } else {
            viewContollerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10+topButtonSize).isActive = true
        }
        viewContollerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewContollerLabel.font = UIFont.systemFont(ofSize: 25)
        viewContollerLabel.text = "View Controller"
    }
    
    func buttonStackSetup(){
        view.addSubview(buttonStack)
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        buttonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        buttonStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
    }

}
