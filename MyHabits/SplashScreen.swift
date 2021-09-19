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
        view.backgroundColor = .white
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
        splashTitle.text = "MyHabits"
        splashTitle.textTitle3()
        splashTitle.textColor = ColorStyles.purple
        splashTitle.toAutoLayout()
        return splashTitle
    }()
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            splashTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            splashTitle.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: SplashVCConstants.titleBottomMargin),
            splashTitle.widthAnchor.constraint(equalToConstant: SplashVCConstants.titleWidth),
            splashTitle.heightAnchor.constraint(equalToConstant: SplashVCConstants.titleHeight)
        ])
    }
}


