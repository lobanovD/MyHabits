//
//  SplashViewController.swift
//  MyHabits
//
//  Created by Dmitrii Lobanov on 16.09.2021.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubviews(splashTitle)
        setupConstraints()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let VC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            VC.modalPresentationStyle = .fullScreen
            self.present(VC, animated: false, completion: nil)
            
    }
    }
    

    
    
//    private lazy var splashLogo: UIImageView = {
//        let splashLogo = UIImageView()
//        splashLogo.image = UIImage(named: "main_icon")
//        splashLogo.toAutoLayout()
//        return splashLogo
//    }()
    
    private lazy var splashTitle: UILabel = {
        let splashTitle = UILabel()
        splashTitle.text = "MyHabits"
        splashTitle.font = UIFont(name: "SF Pro Display", size: 20)
        splashTitle.toAutoLayout()
        return splashTitle
    }()
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
//            splashLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            splashLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            splashLogo.widthAnchor.constraint(equalToConstant: SplashVCConstants.imageWidth),
//            splashLogo.heightAnchor.constraint(equalToConstant: SplashVCConstants.imageHeight),
            
            splashTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            splashTitle.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: SplashVCConstants.titleBottom),
            splashTitle.widthAnchor.constraint(equalToConstant: SplashVCConstants.titleWidth),
            splashTitle.heightAnchor.constraint(equalToConstant: SplashVCConstants.titleHeight)
        
        ])
    }

}


