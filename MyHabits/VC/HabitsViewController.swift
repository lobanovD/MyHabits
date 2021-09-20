//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Dmitrii Lobanov on 16.09.2021.
//

import UIKit

class HabitsViewController: UIViewController {

    @IBOutlet weak var addNewHabitButton: UIBarButtonItem!

    @IBAction func addNewHabitAction(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newHabitVC = storyboard.instantiateViewController(withIdentifier: "AddNewHabitVC") as! AddNewHabitVC
        let navController = UINavigationController(rootViewController: newHabitVC)
        navController.modalTransitionStyle = .coverVertical
        navController.modalPresentationStyle = .fullScreen

        self.navigationController?.present(navController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addNewHabitButton.tintColor = ColorStyles.purple
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
