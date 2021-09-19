//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Dmitrii Lobanov on 16.09.2021.
//

import UIKit

/*
TODO:
 - убрать параметры в констрейнты
 - мб сократить код через цикл создания лейблов
 */
class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
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
        infoStackView.spacing = 12
        return infoStackView
    }()

    private lazy var infoTextTitle: UILabel = {
        let infoTextTitle = UILabel()
        infoTextTitle.text = InfoVCConstants.infoTextTitle
        infoTextTitle.textTitle3()
        infoTextTitle.toAutoLayout()
        infoTextTitle.numberOfLines = 0
        return infoTextTitle
    }()

    private lazy var infoTextFirst: UILabel = {
        let infoTextFirst = UILabel()
        infoTextFirst.text = InfoVCConstants.infoTextFirst
        infoTextFirst.textBody()
        infoTextFirst.toAutoLayout()
        infoTextFirst.numberOfLines = 0
        return infoTextFirst
    }()

    private lazy var infoTextSecond: UILabel = {
        let infoTextSecond = UILabel()
        infoTextSecond.text = InfoVCConstants.infoTextSecond
        infoTextSecond.textBody()
        infoTextSecond.toAutoLayout()
        infoTextSecond.numberOfLines = 0
        return infoTextSecond
    }()

    private lazy var infoTextThird: UILabel = {
        let infoTextThird = UILabel()
        infoTextThird.text = InfoVCConstants.infoTextThird
        infoTextThird.textBody()
        infoTextThird.toAutoLayout()
        infoTextThird.numberOfLines = 0
        return infoTextThird
    }()

    private lazy var infoTextFourth: UILabel = {
        let infoTextFourth = UILabel()
        infoTextFourth.text = InfoVCConstants.infoTextFourth
        infoTextFourth.textBody()
        infoTextFourth.toAutoLayout()
        infoTextFourth.numberOfLines = 0
        return infoTextFourth
    }()

    private lazy var infoTextFifth: UILabel = {
        let infoTextFifth = UILabel()
        infoTextFifth.text = InfoVCConstants.infoTextFifth
        infoTextFifth.textBody()
        infoTextFifth.toAutoLayout()
        infoTextFifth.numberOfLines = 0
        return infoTextFifth
    }()

    private lazy var infoTextSixth: UILabel = {
        let infoTextSixth = UILabel()
        infoTextSixth.text = InfoVCConstants.infoTextSixth
        infoTextSixth.textBody()
        infoTextSixth.toAutoLayout()
        infoTextSixth.numberOfLines = 0
        return infoTextSixth
    }()

    private lazy var infoTextSeventh: UILabel = {
        let infoTextSeventh = UILabel()
        infoTextSeventh.text = InfoVCConstants.infoTextSeventh
        infoTextSeventh.textBody()
        infoTextSeventh.toAutoLayout()
        infoTextSeventh.numberOfLines = 0
        return infoTextSeventh
    }()

    private lazy var infoTextEighth: UILabel = {
        let infoTextEighth = UILabel()
        infoTextEighth.text = InfoVCConstants.infoTextEighth
        infoTextEighth.textBody()
        infoTextEighth.toAutoLayout()
        infoTextEighth.numberOfLines = 0
        return infoTextEighth
    }()

    private func setupViews() {
        view.addSubview(infoScrollView)
        infoScrollView.addSubview(infoContentView)
        infoContentView.addSubviews(infoTextTitle, infoStackView)
        infoStackView.addArrangedSubviews(infoTextFirst, infoTextSecond, infoTextThird, infoTextFourth, infoTextFifth, infoTextSixth, infoTextSeventh, infoTextEighth)

        NSLayoutConstraint.activate([

            infoTextTitle.centerXAnchor.constraint(equalTo: infoContentView.centerXAnchor),
            infoTextTitle.topAnchor.constraint(equalTo: infoContentView.topAnchor, constant: 22),
            infoTextTitle.widthAnchor.constraint(equalTo: infoContentView.widthAnchor),

            infoScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            infoScrollView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            infoScrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            infoScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            infoContentView.topAnchor.constraint(equalTo: infoScrollView.topAnchor),
            infoContentView.bottomAnchor.constraint(equalTo: infoScrollView.bottomAnchor),
            infoContentView.centerXAnchor.constraint(equalTo: infoScrollView.centerXAnchor),
            infoContentView.leadingAnchor.constraint(equalTo: infoScrollView.leadingAnchor, constant: 16),
            infoContentView.trailingAnchor.constraint(equalTo: infoScrollView.trailingAnchor, constant: -16),

            infoStackView.topAnchor.constraint(equalTo: infoTextTitle.bottomAnchor, constant: 16),
            infoStackView.leadingAnchor.constraint(equalTo: infoContentView.leadingAnchor),
            infoStackView.trailingAnchor.constraint(equalTo: infoContentView.trailingAnchor),
            infoStackView.bottomAnchor.constraint(equalTo: infoContentView.bottomAnchor)

        ])

    }




}
