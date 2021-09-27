//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Dmitrii Lobanov on 27.09.2021.
//

import UIKit

class HabitDetailsViewController: UITableViewController {

    var habitIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        var tempHabitArray = HabitsStore.shared.habits
        tempHabitArray.sort(by: {stripTime(from: $0.date) < stripTime(from: $1.date)})
        title = tempHabitArray[habitIndex].name
        view.backgroundColor = .red
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Something Else", style: .plain, target: nil, action: nil)
    }

    
    


}

// MARK: - Actions
extension HabitDetailsViewController {

  


}
