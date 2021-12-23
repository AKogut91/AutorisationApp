//
//  PreLoaderViewController.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 22.12.2021.
//

import UIKit

class PreLoaderViewController: BaseViewController, CAAnimationDelegate {

    @IBOutlet private weak var topLabel: UILabel!
    @IBOutlet private weak var smallView: UIView!
    @IBOutlet private var logoImage: UIImageView!
    @IBOutlet weak private var sky: UIImageView!
    @IBOutlet private weak var sky1: UIImageView!
    @IBOutlet private weak var rock5: UIImageView!
    @IBOutlet private weak var rock4: UIImageView!
    @IBOutlet private weak var rock3: UIImageView!
    @IBOutlet private weak var rock2: UIImageView!
    @IBOutlet private weak var rock1: UIImageView!
    
    private let color1: CGColor = UIColor(red: 0.09, green: 0.09, blue: 0.14, alpha: 1.0).cgColor
    private let color2: CGColor = UIColor(red: 0.35, green: 0.31, blue: 0.79, alpha: 1.0).cgColor
    private let color3: CGColor = UIColor(red: 0.56, green: 0.39, blue: 0.84, alpha: 1.0).cgColor
    private let color4: CGColor = UIColor(red: 0.73, green: 0.54, blue: 0.66, alpha: 1.0).cgColor
    
    private let gradient: CAGradientLayer = CAGradientLayer()
    private var gradientColorSet: [[CGColor]] = []
    private var viewArray = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        setView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupGradient()
        animateGradient()
    }
    
    private func setupGradient() {
        gradientColorSet = [
            [color1, color1, color1],
            [color1, color2, color2],
            [color2, color3, color3],
            [color2, color3, color4]
        ]
        
        gradient.colors = gradientColorSet[colorIndex]
        gradient.frame = self.smallView.bounds
        self.smallView.layer.addSublayer(gradient)
    }
    
    private func animateGradient() {
        gradient.colors = gradientColorSet[colorIndex]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        let gradientAnimation = CABasicAnimation(keyPath: "colors")
        gradientAnimation.duration = 4.0
        gradientAnimation.delegate = self
        gradientAnimation.toValue = gradientColorSet[3]
        gradientAnimation.fillMode = .both
        gradientAnimation.isRemovedOnCompletion = false
       gradient.add(gradientAnimation, forKey: "colors")
    }
    
    // MARK: - Label
    
    private func setupLabel() {
        topLabel.isHidden = true
        topLabel.alpha = 0
        topLabel.text = "We are here to build your better life together"
    }
    
    private func animatedLabel() {
        UIView.animate(withDuration: 1.0) { [weak self] in
            self?.topLabel.isHidden = false
            self?.topLabel.alpha = 1
        }
    }
    
    // MARK: - Views
    
    private func setView() {
        sky.isHidden = true
        sky.alpha = 0
        
        viewArray = [rock2, rock1, rock3, rock4, rock5, sky1]
        
        for view in viewArray {
            view.isHidden = true
            view.alpha = 0
        }
    }
    
    private func animateRocks() {
        var time = 0.0
        
        UIView.animate(withDuration: 0.33) { [weak self] in
            self?.sky.isHidden = false
            self?.sky.alpha = 1
        }
        
        for view in viewArray.enumerated() {
            time += 0.20
            view.element.frame = CGRect(x: view.element.frame.origin.x,
                                        y: view.element.frame.origin.y + 100,
                                        width: view.element.frame.width,
                                        height: view.element.frame.height)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + time) {
                UIView.animate(withDuration: 0.23) {
                    view.element.isHidden = false
                    view.element.alpha = 1
                    view.element.frame = CGRect(x: view.element.frame.origin.x,
                                                y: view.element.frame.origin.y - 100,
                                                width: view.element.frame.width,
                                                height: view.element.frame.height)
                }
            }
        }
    }
    
    // MARK: - Delegate
    
    func animationDidStart(_ anim: CAAnimation) {
        self.logger.log()
        
        UIView.animate(withDuration: 6.0) {
            self.logoImage.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            self.logoImage.alpha = 0
        }
    }
        
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.logger.log()
        animateRocks()
        animatedLabel()
    }
    
}
