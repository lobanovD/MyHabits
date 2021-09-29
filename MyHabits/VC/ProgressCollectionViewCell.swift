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
        contentView.addSubview(habitCellBackView)
        setupConstraints()
    
}

    // MARK: - UI elements

    private lazy var habitCellBackView: UIView = {
        let habitCellBackView = UIView()
        habitCellBackView.toAutoLayout()
        habitCellBackView.layer.cornerRadius = 8
        habitCellBackView.backgroundColor = .white
        return habitCellBackView
    }()

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

            habitCellBackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            habitCellBackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            habitCellBackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            habitCellBackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

        ])
    }

}
