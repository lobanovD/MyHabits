//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Dmitrii Lobanov on 19.09.2021.
//

import UIKit

class HabitViewController: UIViewController {

    var habitColor: UIColor = ColorStyles.orange

    let currentDateTime = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Создать"

    }

    override func viewWillAppear(_ animated: Bool) {
        createCancelButton()
        createSaveButton()
        view.addSubviews(newHabitTitleLabel,
                         newHabitTitleTF,
                         newHabitColorLabel,
                         newHabitColor,
                         newHabitColors,
                         newHabitTimeTitleLable,
                         newHabitTimeLabel,
                         newHabitDatePicker)
        newHabitColors.addArrangedSubviews(orangeColor, greenColor, purpleColor, blueColor, indigoColor)
        setupConstraints()

    }


    // MARK: - UI elements

    private lazy var newHabitTitleLabel: UILabel = {
        let newHabitTitleLabel = UILabel()
        newHabitTitleLabel.text = "НАЗВАНИЕ"
        newHabitTitleLabel.textFootnote(width: view.frame.width)
        return newHabitTitleLabel
    }()

    private lazy var newHabitTitleTF: UITextField = {
        let newHabitTitleTF = UITextField()
        newHabitTitleTF.textHeadline(width: view.frame.width)
        newHabitTitleTF.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        newHabitTitleTF.autocorrectionType = .no
        newHabitTitleTF.textColor = habitColor
        newHabitTitleTF.becomeFirstResponder()
        return newHabitTitleTF
    }()

    private lazy var newHabitColorLabel: UILabel = {
        let newHabitColorLabel = UILabel()
        newHabitColorLabel.text = "ЦВЕТ"
        newHabitColorLabel.textFootnote(width: view.frame.width)
        return newHabitColorLabel
    }()

    private lazy var newHabitColor: UIView = {
        let newHabitColor = UIView()
        newHabitColor.toAutoLayout()
        newHabitColor.backgroundColor = habitColor
        newHabitColor.colorCircle(width: view.frame.width)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(habitColorViewPresent))
        newHabitColor.addGestureRecognizer(gesture)
        return newHabitColor
    }()

    private lazy var newHabitColors: UIStackView = {
        let newHabitColors = UIStackView()
        newHabitColors.toAutoLayout()
        newHabitColors.axis = .horizontal
        newHabitColors.spacing = 7
        newHabitColors.distribution = .fillEqually
        newHabitColors.isHidden = true
        return newHabitColors
    }()

    private lazy var orangeColor: UIButton = {
        let orangeColor = UIButton()
        orangeColor.toAutoLayout()
        orangeColor.backgroundColor = ColorStyles.orange
        let color = orangeColor.backgroundColor
        orangeColor.colorCircle(width: view.frame.width)
        orangeColor.addTarget(self, action: #selector(selectColor(button:)), for: .touchUpInside)
        return orangeColor
    }()

    private lazy var greenColor: UIButton = {
        let greenColor = UIButton()
        greenColor.toAutoLayout()
        greenColor.backgroundColor = ColorStyles.green
        greenColor.colorCircle(width: view.frame.width)
        greenColor.addTarget(self, action: #selector(selectColor(button:)), for: .touchUpInside)
        return greenColor
    }()

    private lazy var purpleColor: UIButton = {
        let purpleColor = UIButton()
        purpleColor.toAutoLayout()
        purpleColor.backgroundColor = ColorStyles.purple
        purpleColor.colorCircle(width: view.frame.width)
        purpleColor.addTarget(self, action: #selector(selectColor(button:)), for: .touchUpInside)
        return purpleColor
    }()

    private lazy var blueColor: UIButton = {
        let blueColor = UIButton()
        blueColor.toAutoLayout()
        blueColor.backgroundColor = ColorStyles.blue
        blueColor.colorCircle(width: view.frame.width)
        blueColor.addTarget(self, action: #selector(selectColor(button:)), for: .touchUpInside)
        return blueColor
    }()

    private lazy var indigoColor: UIButton = {
        let indigoColor = UIButton()
        indigoColor.toAutoLayout()
        indigoColor.backgroundColor = ColorStyles.indigo
        indigoColor.colorCircle(width: view.frame.width)
        indigoColor.addTarget(self, action: #selector(selectColor(button:)), for: .touchUpInside)
        return indigoColor
    }()

    private lazy var newHabitTimeTitleLable: UILabel = {
        let newHabitTimeTitleLable = UILabel()
        newHabitTimeTitleLable.text = "ВРЕМЯ"
        newHabitTimeTitleLable.textFootnote(width: view.frame.width)
        return newHabitTimeTitleLable
    }()

    private lazy var newHabitTimeLabel: UILabel = {
        let newHabitTimeLabel = UILabel()
        newHabitTimeLabel.textBody(width: view.frame.width)
        return newHabitTimeLabel
    }()

    private lazy var newHabitDatePicker: UIDatePicker = {
        let newHabitDatePicker = UIDatePicker()
        newHabitDatePicker.toAutoLayout()
        newHabitDatePicker.datePickerMode = .time
        newHabitDatePicker.date = currentDateTime
        newHabitDatePicker.preferredDatePickerStyle = .wheels
        newHabitDatePicker.addTarget(self, action: #selector(newHabitDatePickerSet), for: .valueChanged)

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        let date = newHabitDatePicker.date
        let currentTime = dateFormatter.string(from: date)

        let attributedStringColor = [NSAttributedString.Key.foregroundColor : ColorStyles.purple]
        let attributedString1 = NSAttributedString(string: "Каждый день в ", attributes: nil)
        let attributedString2 = NSAttributedString(string: currentTime, attributes: attributedStringColor)

        var concate = NSMutableAttributedString(attributedString: attributedString1)
        concate.append(attributedString2)

        newHabitTimeLabel.attributedText = concate

        if view.frame.width <= 428 {
            newHabitDatePicker.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
        else {
            newHabitDatePicker.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
        return newHabitDatePicker
    }()
}

// MARK: - Actions
extension HabitViewController {
    private func createCancelButton() {
        let cancelButton = UIBarButtonItem(title: "Отменить",
                                           style: UIBarButtonItem.Style.plain,
                                           target: self,
                                           action: #selector(cancelButton))

        let cancelButtonAttributes = [
            NSAttributedString.Key.font: UIFont(name: "SFProText-Regular", size: 17)!,
            NSAttributedString.Key.foregroundColor: ColorStyles.purple,
        ]

        cancelButton.setTitleTextAttributes(cancelButtonAttributes, for: .normal)
        cancelButton.setTitleTextAttributes(cancelButtonAttributes, for: .highlighted)

        navigationItem.leftBarButtonItem = cancelButton
    }

    private func createSaveButton() {
        let saveButton = UIBarButtonItem(title: "Сохранить",
                                           style: UIBarButtonItem.Style.plain,
                                           target: self,
                                           action: #selector(saveButton))

        let saveButtonAttributes = [
            NSAttributedString.Key.font: UIFont(name: "SFProText-Semibold", size: 17)!,
            NSAttributedString.Key.foregroundColor: ColorStyles.purple,
        ]

        saveButton.setTitleTextAttributes(saveButtonAttributes, for: .normal)
        saveButton.setTitleTextAttributes(saveButtonAttributes, for: .highlighted)

        navigationItem.rightBarButtonItem = saveButton
    }

    @objc func cancelButton() {
        navigationController?.dismiss(animated: true, completion: nil)
    }

    @objc func saveButton() {
        navigationController?.dismiss(animated: true, completion: nil)
        print("задача сохранена")
        let newHabit = Habit(name: "\(String(describing: newHabitTitleTF.text))", date: newHabitDatePicker.date, color: habitColor)
        HabitsStore.shared.habits.append(newHabit)
        for i in HabitsStore.shared.habits {
            print(i.name, i.dateString)
        }
        
    }

    @objc func habitColorViewPresent() {
        newHabitColor.isHidden = true
        newHabitColors.isHidden = false
    }

    @objc func selectColor(button: UIButton) {
        if let color = button.backgroundColor {
            habitColor = color
            newHabitTitleTF.textColor = button.backgroundColor
            newHabitColor.isHidden = false
            newHabitColors.isHidden = true
            newHabitTitleTF.textColor = button.backgroundColor
            newHabitColor.backgroundColor = button.backgroundColor
        }
    }

    @objc func newHabitDatePickerSet() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        let date = newHabitDatePicker.date
        let currentTime = dateFormatter.string(from: date)
        let attributedStringColor = [NSAttributedString.Key.foregroundColor : ColorStyles.purple]
        let attributedString1 = NSAttributedString(string: "Каждый день в ", attributes: nil)
        let attributedString2 = NSAttributedString(string: currentTime, attributes: attributedStringColor)
        let concate = NSMutableAttributedString(attributedString: attributedString1)
        concate.append(attributedString2)
        newHabitTimeLabel.attributedText = concate
    }

    // MARK: - Constraints

    private func setupConstraints() {
        NSLayoutConstraint.activate([

            newHabitTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: AddNewHabitVCConstants.topMargin * 3),
            newHabitTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: AddNewHabitVCConstants.leadingMargin),

            newHabitTitleTF.topAnchor.constraint(equalTo: newHabitTitleLabel.bottomAnchor, constant: AddNewHabitVCConstants.topMargin),
            newHabitTitleTF.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: AddNewHabitVCConstants.leadingMargin),
            newHabitTitleTF.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: AddNewHabitVCConstants.trailingMargin),

            newHabitColorLabel.topAnchor.constraint(equalTo: newHabitTitleTF.bottomAnchor, constant: (AddNewHabitVCConstants.topMargin * 2) - 1),
            newHabitColorLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: AddNewHabitVCConstants.leadingMargin),

            newHabitColor.topAnchor.constraint(equalTo: newHabitColorLabel.bottomAnchor, constant: AddNewHabitVCConstants.topMargin),
            newHabitColor.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: AddNewHabitVCConstants.leadingMargin),

            newHabitColors.topAnchor.constraint(equalTo: newHabitColorLabel.bottomAnchor, constant: AddNewHabitVCConstants.topMargin),
            newHabitColors.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: AddNewHabitVCConstants.leadingMargin),

            newHabitTimeTitleLable.topAnchor.constraint(equalTo: newHabitColors.bottomAnchor, constant: AddNewHabitVCConstants.topMargin),
            newHabitTimeTitleLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: AddNewHabitVCConstants.leadingMargin),

            newHabitTimeLabel.topAnchor.constraint(equalTo: newHabitTimeTitleLable.bottomAnchor, constant: AddNewHabitVCConstants.topMargin),
            newHabitTimeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: AddNewHabitVCConstants.leadingMargin),

            newHabitDatePicker.topAnchor.constraint(equalTo: newHabitTimeLabel.bottomAnchor, constant: (AddNewHabitVCConstants.topMargin * 2) - 1),
            newHabitDatePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            newHabitDatePicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
