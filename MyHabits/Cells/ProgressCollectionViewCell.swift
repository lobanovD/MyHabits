//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Dmitrii Lobanov on 27.09.2021.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {

    static let id = "ProgressCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = ColorStyles.lightGray
        contentView.addSubview(habitsProgressBackView)
        habitsProgressBackView.addSubviews(habitsProgressTitle, habitsProgressPercent, habitsProgressView)
        setupConstraints()
    }

    // MARK: - UI elements

    private lazy var habitsProgressBackView: UIView = {
        let habitsProgressBackView = UIView()
        habitsProgressBackView.toAutoLayout()
        habitsProgressBackView.layer.cornerRadius = CellConstants.habitsProgressBackViewCornerRadius
        habitsProgressBackView.backgroundColor = .white
        return habitsProgressBackView
    }()

    private lazy var habitsProgressTitle: UILabel = {
        let habitsProgressTitle = UILabel()
        habitsProgressTitle.textFootnote(width: contentView.frame.width)
        habitsProgressTitle.textColor = .systemGray
        habitsProgressTitle.text = CellConstants.habitsProgressTitleText
        return habitsProgressTitle
    }()

    private lazy var habitsProgressPercent: UILabel = {
        let habitsProgressPercent = UILabel()
        habitsProgressPercent.textFootnote(width: contentView.frame.width)
        habitsProgressPercent.textColor = .systemGray
        return habitsProgressPercent
    }()

    lazy var habitsProgressView: UIProgressView = {
        let habitsProgressView = UIProgressView()
        habitsProgressView.toAutoLayout()
        habitsProgressView.progressViewStyle = .bar
        habitsProgressView.trackTintColor = ColorStyles.progressBackground
        habitsProgressView.progressTintColor = ColorStyles.purple
        habitsProgressView.layer.cornerRadius = CellConstants.habitsProgressViewHeight / 2
        habitsProgressView.clipsToBounds = true
        habitsProgressView.progress = HabitsStore.shared.todayProgress
        return habitsProgressView
    }()

    public func updateProgress() {
        habitsProgressView.setProgress(HabitsStore.shared.todayProgress, animated: true)
        habitsProgressPercent.text = "\(Int(HabitsStore.shared.todayProgress * 100))%"
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Actions
extension ProgressCollectionViewCell {

    private func setupConstraints() {
        NSLayoutConstraint.activate([

            habitsProgressBackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            habitsProgressBackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            habitsProgressBackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            habitsProgressBackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            habitsProgressTitle.topAnchor.constraint(equalTo: habitsProgressBackView.topAnchor, constant: CellConstants.habitsProgressTitleTopMargin),
            habitsProgressTitle.leadingAnchor.constraint(equalTo: habitsProgressBackView.leadingAnchor, constant: CellConstants.habitsProgressTitleLeadingMargin),

            habitsProgressPercent.topAnchor.constraint(equalTo: habitsProgressBackView.topAnchor, constant: CellConstants.habitsProgressPercentTopMargin),
            habitsProgressPercent.trailingAnchor.constraint(equalTo: habitsProgressBackView.trailingAnchor, constant: CellConstants.habitsProgressPercentTrailingMargin),

            habitsProgressView.leadingAnchor.constraint(equalTo: habitsProgressBackView.leadingAnchor, constant: CellConstants.habitsProgressViewLeadingMargin),
            habitsProgressView.trailingAnchor.constraint(equalTo: habitsProgressBackView.trailingAnchor, constant: CellConstants.habitsProgressViewTrailingMargin),
            habitsProgressView.bottomAnchor.constraint(equalTo: habitsProgressBackView.bottomAnchor, constant: CellConstants.habitsProgressViewBottomMargin),
            habitsProgressView.heightAnchor.constraint(equalToConstant: CellConstants.habitsProgressViewHeight)
        ])
    }
}
