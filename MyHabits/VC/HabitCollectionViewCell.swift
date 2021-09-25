//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Dmitrii Lobanov on 23.09.2021.
//

import UIKit

class HabitCollectionViewCell: UICollectionViewCell {

    static let id = "HabitTableViewCell"

    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = ColorStyles.lightGray
                contentView.addSubview(habitCellBackView)
                habitCellBackView.addSubviews(habitTitle, habitTime)
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

    private lazy var habitTitle: UILabel = {
        let habitTitle = UILabel()
        habitTitle.textHeadline(width: contentView.frame.width)
        habitTitle.numberOfLines = 1
        return habitTitle
    }()

    private lazy var habitTime: UILabel = {
        let habitTime = UILabel()
        habitTime.textCaption(width: contentView.frame.width)
        habitTime.textColor = .systemGray2
        return habitTime
    }()



    override func prepareForReuse() {
        super.prepareForReuse()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




// MARK: - Actions
extension HabitCollectionViewCell {

    

//    public func configureCell(name: String, date: Date, trackDates: [Date], color: UIColor, dateString: String) {
//        habitTitle.text = name
//        habitTitle.textColor = color
////        let dateFormatter = DateFormatter()
////        dateFormatter.dateStyle = .none
////        dateFormatter.timeStyle = .short
////        let currentTime = dateFormatter.string(from: date)
////        habitTime.text = "Каждый день в \(currentTime)"
//        habitTime.text = dateString
//
//    }


    func configureCell(habit: Habit) {
        habitTitle.text = String(describing: habit.name)
        print(String(describing: habit.name))
        habitTitle.textColor = habit.color
        habitTime.text = habit.dateString

    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([

            habitCellBackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            habitCellBackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            habitCellBackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            habitCellBackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            habitTitle.topAnchor.constraint(equalTo: habitCellBackView.topAnchor, constant: 20),
            habitTitle.leadingAnchor.constraint(equalTo: habitCellBackView.leadingAnchor, constant: 20),
            habitTitle.trailingAnchor.constraint(equalTo: habitCellBackView.trailingAnchor, constant: -20),

            habitTime.topAnchor.constraint(equalTo: habitTitle.bottomAnchor, constant: 4),
            habitTime.leadingAnchor.constraint(equalTo: habitCellBackView.leadingAnchor, constant: 20),



        ])
    }

}
