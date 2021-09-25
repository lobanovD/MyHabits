//
//  InfoVC.swift
//  MyHabits
//
//  Created by Dmitrii Lobanov on 16.09.2021.
//

import UIKit

class InfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        let navigationBar = navigationController?.navigationBar
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.shadowColor = ColorStyles.navigationBarSeparator
        navigationBar?.scrollEdgeAppearance = navigationBarAppearance
        let tabBar = tabBarController?.tabBar
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.shadowColor = ColorStyles.tabBarSeparator
        if #available(iOS 15.0, *) {
            tabBar?.scrollEdgeAppearance = tabBarAppearance
        }
    }

    private lazy var infoScrollView: UIScrollView = {
        let infoScrollView = UIScrollView()
        infoScrollView.toAutoLayout()
        return infoScrollView
    }()

    private lazy var infoContentView: UIView = {
        let infoContentView = UIView()
        infoContentView.toAutoLayout()
        return infoContentView
    }()

    private lazy var infoStackView: UIStackView = {
        let infoStackView = UIStackView()
        infoStackView.toAutoLayout()
        infoStackView.axis = .vertical
        infoStackView.distribution = .fillProportionally
        infoStackView.spacing = InfoVCConstants.infoStackViewSpacing
        return infoStackView
    }()

    private lazy var infoTextTitle: UILabel = {
        let infoTextTitle = UILabel()
        infoTextTitle.text = InfoVCConstants.infoTextTitle
        infoTextTitle.textTitle3(width: view.frame.width)
        return infoTextTitle
    }()

    private lazy var infoTextFirst: UILabel = {
        let infoTextFirst = UILabel()
        infoTextFirst.text = InfoVCConstants.infoTextFirst
        infoTextFirst.textBody(width: view.frame.width)
        return infoTextFirst
    }()

    private lazy var infoTextSecond: UILabel = {
        let infoTextSecond = UILabel()
        infoTextSecond.text = InfoVCConstants.infoTextSecond
        infoTextSecond.textBody(width: view.frame.width)
        return infoTextSecond
    }()

    private lazy var infoTextThird: UILabel = {
        let infoTextThird = UILabel()
        infoTextThird.text = InfoVCConstants.infoTextThird
        infoTextThird.textBody(width: view.frame.width)
        return infoTextThird
    }()

    private lazy var infoTextFourth: UILabel = {
        let infoTextFourth = UILabel()
        infoTextFourth.text = InfoVCConstants.infoTextFourth
        infoTextFourth.textBody(width: view.frame.width)
        return infoTextFourth
    }()

    private lazy var infoTextFifth: UILabel = {
        let infoTextFifth = UILabel()
        infoTextFifth.text = InfoVCConstants.infoTextFifth
        infoTextFifth.textBody(width: view.frame.width)
        return infoTextFifth
    }()

    private lazy var infoTextSixth: UILabel = {
        let infoTextSixth = UILabel()
        infoTextSixth.text = InfoVCConstants.infoTextSixth
        infoTextSixth.textBody(width: view.frame.width)
        return infoTextSixth
    }()

    private lazy var infoTextSeventh: UILabel = {
        let infoTextSeventh = UILabel()
        infoTextSeventh.text = InfoVCConstants.infoTextSeventh
        infoTextSeventh.textBody(width: view.frame.width)
        return infoTextSeventh
    }()

    private lazy var infoTextEighth: UILabel = {
        let infoTextEighth = UILabel()
        infoTextEighth.text = InfoVCConstants.infoTextEighth
        infoTextEighth.textBody(width: view.frame.width)
        return infoTextEighth
    }()

    private func setupViews() {
        view.addSubview(infoScrollView)
        infoScrollView.addSubview(infoContentView)
        infoContentView.addSubviews(infoTextTitle, infoStackView)
        infoStackView.addArrangedSubviews(infoTextFirst, infoTextSecond, infoTextThird, infoTextFourth, infoTextFifth, infoTextSixth, infoTextSeventh, infoTextEighth)

        NSLayoutConstraint.activate([

            infoTextTitle.centerXAnchor.constraint(equalTo: infoContentView.centerXAnchor),
            infoTextTitle.topAnchor.constraint(equalTo: infoContentView.topAnchor, constant: InfoVCConstants.topMargin),
            infoTextTitle.widthAnchor.constraint(equalTo: infoContentView.widthAnchor),

            infoScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            infoScrollView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            infoScrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            infoScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            infoContentView.topAnchor.constraint(equalTo: infoScrollView.topAnchor),
            infoContentView.bottomAnchor.constraint(equalTo: infoScrollView.bottomAnchor),
            infoContentView.centerXAnchor.constraint(equalTo: infoScrollView.centerXAnchor),
            infoContentView.leadingAnchor.constraint(equalTo: infoScrollView.leadingAnchor, constant: InfoVCConstants.leadingMargin),
            infoContentView.trailingAnchor.constraint(equalTo: infoScrollView.trailingAnchor, constant: InfoVCConstants.trailingMargin),

            infoStackView.topAnchor.constraint(equalTo: infoTextTitle.bottomAnchor, constant: InfoVCConstants.topMargin),
            infoStackView.leadingAnchor.constraint(equalTo: infoContentView.leadingAnchor),
            infoStackView.trailingAnchor.constraint(equalTo: infoContentView.trailingAnchor),
            infoStackView.bottomAnchor.constraint(equalTo: infoContentView.bottomAnchor)

        ])

    }

}
