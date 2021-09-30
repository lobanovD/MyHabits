//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Dmitrii Lobanov on 19.09.2021.
//

import UIKit

class HabitViewController: UIViewController {

    static let id = "HabitViewController"

    var habitIndex: Int? = nil

    var habitColor: UIColor = ColorStyles.orange


    let currentDateTime = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Создать"

    }

    override func viewWillAppear(_ animated: Bool) {
        createCancelButton()
        createSaveButton()
        view.addSubviews(HabitTitleLabel,
                         HabitTitleTF,
                         HabitColorLabel,
                         HabitColor,
                         HabitTimeTitleLable,
                         HabitTimeLabel,
                         HabitDatePicker)
        setupConstraints()

    }


    // MARK: - UI elements

    private lazy var HabitTitleLabel: UILabel = {
        let HabitTitleLabel = UILabel()
        HabitTitleLabel.text = "НАЗВАНИЕ"
        HabitTitleLabel.textFootnote(width: view.frame.width)
        return HabitTitleLabel
    }()

    private lazy var HabitTitleTF: UITextField = {
        let HabitTitleTF = UITextField()
        HabitTitleTF.textHeadline(width: view.frame.width)
        HabitTitleTF.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        HabitTitleTF.autocorrectionType = .no

        if habitIndex != nil {
            HabitTitleTF.text = HabitsStore.shared.habits[habitIndex!].name
            habitColor = HabitsStore.shared.habits[habitIndex!].color
        }
        HabitTitleTF.textColor = habitColor
        HabitTitleTF.becomeFirstResponder()
        return HabitTitleTF
    }()

    private lazy var HabitColorLabel: UILabel = {
        let HabitColorLabel = UILabel()
        HabitColorLabel.text = "ЦВЕТ"
        HabitColorLabel.textFootnote(width: view.frame.width)
        return HabitColorLabel
    }()

    private lazy var HabitColor: UIView = {
        let HabitColor = UIView()
        HabitColor.toAutoLayout()
        if habitIndex != nil {
            habitColor = HabitsStore.shared.habits[habitIndex!].color
        }
        HabitColor.backgroundColor = habitColor
        HabitColor.colorCircle(width: view.frame.width)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(habitColorViewPresent))
        HabitColor.addGestureRecognizer(gesture)
        return HabitColor
    }()


    private lazy var HabitTimeTitleLable: UILabel = {
        let HabitTimeTitleLable = UILabel()
        HabitTimeTitleLable.text = "ВРЕМЯ"
        HabitTimeTitleLable.textFootnote(width: view.frame.width)
        return HabitTimeTitleLable
    }()

    private lazy var HabitTimeLabel: UILabel = {
        let HabitTimeLabel = UILabel()
        HabitTimeLabel.textBody(width: view.frame.width)
        return HabitTimeLabel
    }()

    private lazy var HabitDatePicker: UIDatePicker = {
        let HabitDatePicker = UIDatePicker()
        HabitDatePicker.toAutoLayout()
        HabitDatePicker.datePickerMode = .time
        if habitIndex != nil {
            HabitDatePicker.date = HabitsStore.shared.habits[habitIndex!].date
        } else {
            HabitDatePicker.date = currentDateTime
        }
        HabitDatePicker.preferredDatePickerStyle = .wheels
        HabitDatePicker.addTarget(self, action: #selector(HabitDatePickerSet), for: .valueChanged)

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        let date = HabitDatePicker.date
        let currentTime = dateFormatter.string(from: date)

        let attributedStringColor = [NSAttributedString.Key.foregroundColor : ColorStyles.purple]
        let attributedString1 = NSAttributedString(string: "Каждый день в ", attributes: nil)
        let attributedString2 = NSAttributedString(string: currentTime, attributes: attributedStringColor)

        var concate = NSMutableAttributedString(attributedString: attributedString1)
        concate.append(attributedString2)

        HabitTimeLabel.attributedText = concate

        if view.frame.width <= 428 {
            HabitDatePicker.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
        else {
            HabitDatePicker.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
        return HabitDatePicker
    }()
}

// MARK: - Actions
extension HabitViewController: UIColorPickerViewControllerDelegate {
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
        if habitIndex != nil {
            HabitsStore.shared.habits[habitIndex!].name = HabitTitleTF.text ?? ""
            HabitsStore.shared.habits[habitIndex!].color = habitColor
            HabitsStore.shared.habits[habitIndex!].date = HabitDatePicker.date
        } else {
            let Habit = Habit(name: HabitTitleTF.text ?? "", date: HabitDatePicker.date, color: habitColor)
            HabitsStore.shared.habits.append(Habit)
        }

    }

    @objc func habitColorViewPresent() {
        let colorVC = UIColorPickerViewController()
        colorVC.delegate = self
        self.present(colorVC, animated: true) {

        }
    }


    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        habitColor = viewController.selectedColor
        HabitColor.backgroundColor = habitColor
        HabitTitleTF.textColor = habitColor
    }


    @objc func HabitDatePickerSet() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        let date = HabitDatePicker.date
        let currentTime = dateFormatter.string(from: date)
        let attributedStringColor = [NSAttributedString.Key.foregroundColor : ColorStyles.purple]
        let attributedString1 = NSAttributedString(string: "Каждый день в ", attributes: nil)
        let attributedString2 = NSAttributedString(string: currentTime, attributes: attributedStringColor)
        let concate = NSMutableAttributedString(attributedString: attributedString1)
        concate.append(attributedString2)
        HabitTimeLabel.attributedText = concate
    }

    // MARK: - Constraints

    private func setupConstraints() {
        NSLayoutConstraint.activate([

            HabitTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: HabitVCConstants.topMargin * 3),
            HabitTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: HabitVCConstants.leadingMargin),

            HabitTitleTF.topAnchor.constraint(equalTo: HabitTitleLabel.bottomAnchor, constant: HabitVCConstants.topMargin),
            HabitTitleTF.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: HabitVCConstants.leadingMargin),
            HabitTitleTF.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: HabitVCConstants.trailingMargin),

            HabitColorLabel.topAnchor.constraint(equalTo: HabitTitleTF.bottomAnchor, constant: (HabitVCConstants.topMargin * 2) - 1),
            HabitColorLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: HabitVCConstants.leadingMargin),

            HabitColor.topAnchor.constraint(equalTo: HabitColorLabel.bottomAnchor, constant: HabitVCConstants.topMargin),
            HabitColor.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: HabitVCConstants.leadingMargin),

            HabitTimeTitleLable.topAnchor.constraint(equalTo: HabitColor.bottomAnchor, constant: HabitVCConstants.topMargin),
            HabitTimeTitleLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: HabitVCConstants.leadingMargin),

            HabitTimeLabel.topAnchor.constraint(equalTo: HabitTimeTitleLable.bottomAnchor, constant: HabitVCConstants.topMargin),
            HabitTimeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: HabitVCConstants.leadingMargin),

            HabitDatePicker.topAnchor.constraint(equalTo: HabitTimeLabel.bottomAnchor, constant: (HabitVCConstants.topMargin * 2) - 1),
            HabitDatePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            HabitDatePicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
