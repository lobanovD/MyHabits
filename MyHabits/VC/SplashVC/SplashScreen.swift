//
//  SplashScreen.swift
//  MyHabits
//
//  Created by Dmitrii Lobanov on 16.09.2021.
//

import UIKit

class SplashScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(splashTitle)
        setupConstraints()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBar = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
            tabBar.modalPresentationStyle = .fullScreen
            tabBar.modalTransitionStyle = .crossDissolve
            self.present(tabBar, animated: true, completion: nil)
        }
    }
    
    private lazy var splashTitle: UILabel = {
        let splashTitle = UILabel()
        splashTitle.text = SplashVCConstants.splashTitle
        splashTitle.textTitle3(width: view.frame.width)
        splashTitle.textColor = ColorStyles.purple
        return splashTitle
    }()
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            splashTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            splashTitle.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: SplashVCConstants.titleBottomMargin),
        ])
    }
}
