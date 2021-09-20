//
//  AddNewHabitVC.swift
//  MyHabits
//
//  Created by Dmitrii Lobanov on 19.09.2021.
//

import UIKit

class AddNewHabitVC: UIViewController {

    var habitColor: UIColor = ColorStyles.orange


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
                         newHabitColors)
        newHabitColors.addArrangedSubviews(orangeColor, greenColor, purpleColor, blueColor, indigoColor)
        setupConstraints()

    }


    // MARK: - UI elements

    private lazy var newHabitTitleLabel: UILabel = {
        let newHabitTitleLabel = UILabel()
        newHabitTitleLabel.text = "НАЗВАНИЕ"
        newHabitTitleLabel.footnote(width: view.frame.width)
        return newHabitTitleLabel
    }()

    private lazy var newHabitTitleTF: UITextField = {
        let newHabitTitleTF = UITextField()
        newHabitTitleTF.headline(width: view.frame.width)
        newHabitTitleTF.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        newHabitTitleTF.autocorrectionType = .no
        newHabitTitleTF.textColor = habitColor
        newHabitTitleTF.becomeFirstResponder()
        return newHabitTitleTF
    }()

    private lazy var newHabitColorLabel: UILabel = {
        let newHabitColorLabel = UILabel()
        newHabitColorLabel.text = "ЦВЕТ"
        newHabitColorLabel.footnote(width: view.frame.width)
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
    //----------------------------------------------------
    // панель цветов
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
        orangeColor.colorCircle(width: view.frame.width)
        orangeColor.addTarget(self, action: #selector(selectOrangeColor), for: .touchUpInside)
        return orangeColor
    }()

    private lazy var greenColor: UIButton = {
        let greenColor = UIButton()
        greenColor.toAutoLayout()
        greenColor.backgroundColor = ColorStyles.green
        greenColor.colorCircle(width: view.frame.width)
        greenColor.addTarget(self, action: #selector(selectGreenColor), for: .touchUpInside)
        return greenColor
    }()

    private lazy var purpleColor: UIButton = {
        let purpleColor = UIButton()
        purpleColor.toAutoLayout()
        purpleColor.backgroundColor = ColorStyles.purple
        purpleColor.colorCircle(width: view.frame.width)
        purpleColor.addTarget(self, action: #selector(selectPurpleColor), for: .touchUpInside)
        return purpleColor
    }()

    private lazy var blueColor: UIButton = {
        let blueColor = UIButton()
        blueColor.toAutoLayout()
        blueColor.backgroundColor = ColorStyles.blue
        blueColor.colorCircle(width: view.frame.width)
        blueColor.addTarget(self, action: #selector(selectBlueColor), for: .touchUpInside)
        return blueColor
    }()

    private lazy var indigoColor: UIButton = {
        let indigoColor = UIButton()
        indigoColor.toAutoLayout()
        indigoColor.backgroundColor = ColorStyles.indigo
        indigoColor.colorCircle(width: view.frame.width)
        indigoColor.addTarget(self, action: #selector(selectIndigoColor), for: .touchUpInside)
        return indigoColor
    }()



    //----------------------------------------------------


}




// MARK: - Actions
extension AddNewHabitVC {
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

    @objc func saveButton(){
        navigationController?.dismiss(animated: true, completion: nil)
        print("задача сохранена")
    }

    @objc func habitColorViewPresent() {
        newHabitColor.isHidden = true
        newHabitColors.isHidden = false
    }

    @objc func selectOrangeColor() {
        habitColor = ColorStyles.orange
        newHabitColor.isHidden = false
        newHabitColors.isHidden = true
        newHabitTitleTF.textColor = habitColor
        newHabitColor.backgroundColor = habitColor
    }

    @objc func selectGreenColor() {
        habitColor = ColorStyles.green
        newHabitColor.isHidden = false
        newHabitColors.isHidden = true
        newHabitTitleTF.textColor = habitColor
        newHabitColor.backgroundColor = habitColor
    }

    @objc func selectPurpleColor() {
        habitColor = ColorStyles.purple
        newHabitColor.isHidden = false
        newHabitColors.isHidden = true
        newHabitTitleTF.textColor = habitColor
        newHabitColor.backgroundColor = habitColor
    }

    @objc func selectBlueColor() {
        habitColor = ColorStyles.blue
        newHabitColor.isHidden = false
        newHabitColors.isHidden = true
        newHabitTitleTF.textColor = habitColor
        newHabitColor.backgroundColor = habitColor
    }

    @objc func selectIndigoColor() {
        habitColor = ColorStyles.indigo
        newHabitColor.isHidden = false
        newHabitColors.isHidden = true
        newHabitTitleTF.textColor = habitColor
        newHabitColor.backgroundColor = habitColor
    }

    // MARK: - Constraints

    private func setupConstraints() {
        NSLayoutConstraint.activate([

            newHabitTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21),
            newHabitTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),

            newHabitTitleTF.topAnchor.constraint(equalTo: newHabitTitleLabel.bottomAnchor, constant: 7),
            newHabitTitleTF.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            newHabitTitleTF.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            newHabitColorLabel.topAnchor.constraint(equalTo: newHabitTitleTF.bottomAnchor, constant: 15),
            newHabitColorLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),

            newHabitColor.topAnchor.constraint(equalTo: newHabitColorLabel.bottomAnchor, constant: 7),
            newHabitColor.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),

            newHabitColors.topAnchor.constraint(equalTo: newHabitColorLabel.bottomAnchor, constant: 7),
            newHabitColors.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),





        ])

    }
}
