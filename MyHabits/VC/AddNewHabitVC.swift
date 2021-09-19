//
//  AddNewHabitVC.swift
//  MyHabits
//
//  Created by Dmitrii Lobanov on 19.09.2021.
//

import UIKit

class AddNewHabitVC: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Создать"





    }

    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.navigationBar.prefersLargeTitles = false

        createCancelButton()
    }

    @objc func cancelButton() {
        navigationController?.dismiss(animated: true, completion: nil)
    }



}


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

        navigationItem.leftBarButtonItem = cancelButton
    }
}
