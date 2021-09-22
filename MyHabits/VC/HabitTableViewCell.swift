//
//  HabitTableViewCell.swift
//  MyHabits
//
//  Created by Dmitrii Lobanov on 23.09.2021.
//

import UIKit

class HabitTableViewCell: UITableViewCell {

    static let id = "HabitTableViewCell"


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(title)
        setupConstraints()
    }

    // MARK: - UI elements

    private lazy var title: UILabel = {
        let title = UILabel()
        title.text = "123"
        title.toAutoLayout()
        return title
    }()





    override func prepareForReuse() {
        super.prepareForReuse()
    }



    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Actions
extension HabitTableViewCell {

    

    public func configureCell(name: String, date: Date, trackDates: [Date], color: UIColor) {
        self.title.text = name
//        self.postImage.image = UIImage(named: image)
//        self.postDescription.text = description
//        self.postLikes.text = "Likes: \(likes)"
//        self.postViews.text = "Views: \(views)"
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5),

        ])
    }

}
