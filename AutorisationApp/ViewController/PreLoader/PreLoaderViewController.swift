//
//  PreLoaderViewController.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 23.12.2021.
//

import UIKit

class PreLoaderViewController: BaseViewController, CAAnimationDelegate {
    
    @IBOutlet private weak var topLabel: UILabel!
    @IBOutlet private weak var smallView: UIView!
    @IBOutlet private weak var logoImage: UIImageView!
    @IBOutlet private weak var sky: UIImageView!
    @IBOutlet private weak var sky1: UIImageView!
    @IBOutlet private weak var rock5: UIImageView!
    @IBOutlet private weak var rock4: UIImageView!
    @IBOutlet private weak var rock3: UIImageView!
    @IBOutlet private weak var rock2: UIImageView!
    @IBOutlet private weak var rock1: UIImageView!
    
    private let color1: CGColor = AColor.preloadColor1.cgColor
    private let color2: CGColor = AColor.preloadColor2.cgColor
    private let color3: CGColor = AColor.preloadColor3.cgColor
    private let color4: CGColor = AColor.preloadColor4.cgColor
    
    private let gradient: CAGradientLayer = CAGradientLayer()
    private var gradientColorSet: [[CGColor]] = []
    private var viewArray = [UIImageView]()
    private var duration = 4.0
    private var scale: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        setView()
        self.view.backgroundColor = .white
        
        if UITraitCollection.current.userInterfaceStyle == .light {
            scale = 25.0
        } else {
            scale = 2.0
        }
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
        
        gradient.colors = gradientColorSet[0]
        gradient.frame = self.smallView.bounds
        self.smallView.layer.addSublayer(gradient)
    }
    
    private func animateGradient() {
        if UITraitCollection.current.userInterfaceStyle == .dark {
            self.logger.log("Dark mode")
            // Horizontal: left to right.
            gradient.startPoint = CGPoint(x: 0, y: 0.5) // Left side.
            gradient.endPoint = CGPoint(x: 1, y: 0.5) // Right side.
            
        } else {
            self.logger.log("Light mode")
            gradient.startPoint = CGPoint(x: 0.0, y: 1.0) // Top
            gradient.endPoint = CGPoint(x: 0.0, y: 0.0) // Bootom
        }
        
        let gradientAnimation = CABasicAnimation(keyPath: "colors")
        gradientAnimation.duration = 4
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
        topLabel.textColor = AColor.topTextColor
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
        
        UIView.animate(withDuration: duration) { [weak self] in
            self?.logoImage.transform = CGAffineTransform(scaleX: self?.scale ?? 0.0, y: self?.scale ?? 0.0)
            
            if UITraitCollection.current.userInterfaceStyle == .light {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
                    UIView.animate(withDuration: 0.33) {
                        self?.logoImage.alpha = 0
                    }
                }
            } else {
                self?.logoImage.alpha = 0
            }
        }
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.logger.log()
        animateRocks()
        animatedLabel()
    }
    
}
