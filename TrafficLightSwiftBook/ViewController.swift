//
//  ViewController.swift
//  TrafficLightSwiftBook
//
//  Created by Сергей Бабич on 17.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainButton: UIButton!
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    private var currentColor = CurrentColor.red
    private let lightOnAlpha: CGFloat = 1
    private let lightOffAlpha: CGFloat = 0.3
    
    enum CurrentColor {
        case red, yellow, green
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        mainButton.configuration = setupConfiguration(with: "Start")
        redView.layer.cornerRadius = redView.frame.size.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.size.width / 2
        greenView.layer.cornerRadius = greenView.frame.size.width / 2
        redView.alpha = lightOffAlpha
        yellowView.alpha = lightOffAlpha
        greenView.alpha = lightOffAlpha
    }
    
    @IBAction func mainButtonPressed() {
        guard mainButton.configuration?.title != "Start" else {
            redView.alpha = lightOnAlpha
            currentColor = .yellow
            return mainButton.setTitle("Next", for: .normal)
        }
        
        switch currentColor {
        case .red:
            greenView.alpha = lightOffAlpha
            redView.alpha = lightOnAlpha
            currentColor = .yellow
        case .yellow:
            redView.alpha = lightOffAlpha
            yellowView.alpha = lightOnAlpha
            currentColor = .green
        case .green:
            yellowView.alpha = lightOffAlpha
            greenView.alpha = lightOnAlpha
            currentColor = .red
        }
    }
    
    private func setupConfiguration(with title: String) -> UIButton.Configuration {
        var buttonConfiguration = UIButton.Configuration.filled()
        
        buttonConfiguration.cornerStyle = .large
        buttonConfiguration.buttonSize = .large
        buttonConfiguration.attributedTitle?.font = UIFont.systemFont(ofSize: 36)
        buttonConfiguration.title = title
        
        return buttonConfiguration
    }

}
