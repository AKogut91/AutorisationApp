//
//  WelcomeViewController.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 24.12.2021.
//

import UIKit

extension WelcomeViewController {
    
    fileprivate struct WelcodeData {
        var top: String = ""
        var secondary: String = ""
    }
}

class WelcomeViewController: BaseViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var testButton: AButton!
    @IBOutlet private weak var haveAccountTextView: ATextView!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    private lazy var cell = WelcomeTextCollectionViewCell()
    private var data = [WelcodeData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupCollectionView()
        setupPageController()
        setupButton()
        setupTextView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        var time = 0.0
        for row in 0...data.count - 1 {
            time += 3
            DispatchQueue.main.asyncAfter(deadline: .now() + time) { [weak self] in
                self?.collectionView.scrollToItem(at: IndexPath(row: row, section: 0), at: .centeredHorizontally, animated: true)
            }
        }
    }
    
    // MARK: - Setup Data
    
    private func setupData() {
        self.data.append(WelcodeData.init(top: "Track your mood progress",
                                          secondary: "You will always monitor your progress by tracking your mood and watched materials"))
        self.data.append(WelcodeData.init(top: "Keep your journal, secondary",
                                          secondary: "Note everything on your mind. This will help us make you feel better"))
        self.data.append( WelcodeData.init(top: "Unlimited access to hundreds of workouts, secondary",
                                           secondary: "All you need to do is to make at least 10 minutes per day and create it into your daily routine"))
        self.data.append(WelcodeData.init(top: "Motivation reward system",
                                          secondary: "Get bonuses for completing tasks and exchange it for special propositions "))
    }
    
    // MARK: - Setups UI
    
    private func setupPageController() {
        self.pageControl.numberOfPages = data.count
        self.pageControl.currentPage = 0
        
        self.pageControl.pageIndicatorTintColor = AColor.purpleColor.withAlphaComponent(0.5)
        self.pageControl.currentPageIndicatorTintColor = AColor.purpleColor
    }
    
    private func setupButton() {
        testButton.style(buttonStyle: .standart, buttonCornerStyle: .default, text: "Take a test")
    }
    
    private func setupTextView() {
        haveAccountTextView.aTextViewDelegate = self
        haveAccountTextView.style(type: .undeline,
                                  text: "Already have an account? Log in")
        haveAccountTextView.addAttr(AttributesText(text: "Log in", type: .link, value: "000"))
        haveAccountTextView.addAttr(AttributesText(text: "Log in", type: .color, value: AColor.purpleColor))
        haveAccountTextView.setup()
    }
    
    private func setupCollectionView() {
        self.collectionView.backgroundColor = .clear
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.isScrollEnabled = true
        self.collectionView.isPagingEnabled = true
        self.collectionView.registerCell(whith: cell.className)
    }
    
    // MARK: - Actions
    
    @IBAction func testButtonAction(_ sender: Any) {
        
    }
    
}

// MARK: - UICollectionView
extension WelcomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellData = data[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionView.getCellId(whith: cell.className), for: indexPath) as? WelcomeTextCollectionViewCell else {
            return UICollectionViewCell()}
        cell.setupHeaderCell(text: cellData.top)
        cell.setupFooterCell(text: cellData.secondary)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellsize = CGSize(width: collectionView.frame.width,
                              height: collectionView.frame.height)
        return cellsize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

// MARK: - UIScrollViewDelegate
extension WelcomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        pageControl.currentPage = index
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

// MARK: - ATextViewDelegate
extension WelcomeViewController: ATextViewDelegate {
    
    func didSelected(item: String) {
        if item == "000" {
            self.showComingSoonAlert()
        }
    }
}
