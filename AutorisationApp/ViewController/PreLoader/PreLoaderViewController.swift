//
//  PreLoaderViewController.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 23.12.2021.
//

import UIKit

class PreLoaderViewController: BaseViewController, CAAnimationDelegate {
    
    @IBOutlet private weak var centerLabel: UILabel!
    @IBOutlet private weak var gradientView: UIView!
    @IBOutlet private weak var backgroundView: UIImageView!
    @IBOutlet private weak var logoImage: UIImageView!
    
    private let color1: CGColor = AColor.preloadColor1.cgColor
    private let color2: CGColor = AColor.preloadColor2.cgColor
    private let color3: CGColor = AColor.preloadColor3.cgColor
    private let color3Alfa07: CGColor = AColor.preloadColor3.withAlphaComponent(0.5).cgColor
    private let color4: CGColor = AColor.preloadColor4.cgColor
    private let gradient: CAGradientLayer = CAGradientLayer()
    private var gradientColorSet: [[CGColor]] = []
    private var duration = 3.0
    private var scale: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        setupBackgroundView()
        setupScaleForLogo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupGradient()
    
        // Animation logo before before ger response
        UIView.animate(withDuration: 1.0, animations: {() -> Void in
            self.logoImage?.isHidden = false
            self.logoImage?.alpha = 1
            self.logoImage?.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }, completion: {(_ finished: Bool) -> Void in
            UIView.animate(withDuration: 1.0, animations: {() -> Void in
                self.logoImage?.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        })
        
        // Animation Gradient View
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.animateGradient()
        }
    }
    
    // MARK: - Gradient
    
    private func setupScaleForLogo() {
        if UITraitCollection.current.userInterfaceStyle == .light {
            scale = 25.0
        } else {
            scale = 3.0
        }
    }
    
    private func setupGradient() {
        gradientColorSet = [
            [color1, color1, color1],
            [color1, color2, color2],
            [color2, color3, color3]
        ]
        
        if UITraitCollection.current.userInterfaceStyle == .dark {
            self.gradientColorSet.append([color2, color3, color4])
        } else {
            self.gradientColorSet.append([color2, color3, color3Alfa07, color4])
        }
        
        gradient.colors = gradientColorSet[0]
        gradient.frame = self.gradientView.bounds
        self.gradientView.layer.addSublayer(gradient)
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
        centerLabel.isHidden = true
        centerLabel.alpha = 0
        centerLabel.textColor = AColor.topTextColor
        centerLabel.text = "We are here to build your better life together"
    }
    
    private func animatedLabel(delay: Double) {
        UIView.animate(withDuration: 0.33, delay: delay, options: .curveEaseIn) {  [weak self] in
            self?.centerLabel.isHidden = false
            self?.centerLabel.alpha = 1
        }
    }
    
    private func setupBackgroundView() {
        backgroundView.isHidden = true
        backgroundView.alpha = 0
    }
    
    // MARK: - Views
    
    private func setYPositionForView(yPosition: CGFloat, value: CGFloat) -> CGFloat {
        if UITraitCollection.current.userInterfaceStyle == .dark {
            return (yPosition - value)
        } else {
            return (yPosition + 10)
        }
    }
    
    private func animatebackgroundView() {
        UIView.animate(withDuration: 0.33) { [unowned self] in
            backgroundView.isHidden = false
            backgroundView.alpha = 1
        }
    }
    
    // MARK: - Delegate
    
    func animatedLogo() {
        UIView.animate(withDuration: duration) { [weak self] in
            self?.logoImage.transform = CGAffineTransform(scaleX: self?.scale ?? 0.0,
                                                          y: self?.scale ?? 0.0)
            
            if UITraitCollection.current.userInterfaceStyle == .light {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    UIView.animate(withDuration: 0.33) {
                        self?.logoImage.alpha = 0
                        self?.animatebackgroundView()
                        self?.animatedLabel(delay: 0)
                    }
                }
            } else {
                self?.logoImage.alpha = 0
                self?.animatebackgroundView()
                self?.animatedLabel(delay: 1)
            }
        }
    }
    
    func animationDidStart(_ anim: CAAnimation) {
        self.logger.log()
        animatedLogo()
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.logger.log()
        
        // MARK: - Make to Coordinator
        
        let presentedVC = WelcomeViewController()
        let presentedStoryborad = presentedVC.instance.instantiateViewController(withIdentifier: presentedVC.className) as? WelcomeViewController
        guard let presentVC = presentedStoryborad else {
            return
        }
        presentVC.modalPresentationStyle = .fullScreen
        self.present(presentVC, animated: true, completion: nil)
    }
    
}
