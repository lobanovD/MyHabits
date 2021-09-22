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
        view.addSubviews(plugView, habitTableView)
        habitTableView.dataSource = self
        habitTableView.delegate = self
        setupConstraints()

        
    }

    override func viewWillAppear(_ animated: Bool) {
        addNewHabitButton.tintColor = ColorStyles.purple
    }

    // MARK: - UI elements

    private lazy var plugView: UIView = {
        let plugView = UIView()
        plugView.toAutoLayout()
        return plugView
    }()

    private lazy var habitTableView: UITableView = {
        let habitTableView = UITableView()
        habitTableView.register(HabitTableViewCell.self, forCellReuseIdentifier: HabitTableViewCell.id)
        habitTableView.toAutoLayout()
        return habitTableView
    }()

}

    // MARK: - Actions
extension HabitsViewController {

    private func setupConstraints() {
        NSLayoutConstraint.activate([

            plugView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            plugView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            plugView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            plugView.heightAnchor.constraint(equalToConstant: 0),


            habitTableView.topAnchor.constraint(equalTo: plugView.bottomAnchor),
            habitTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            habitTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            habitTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
    }

}

extension HabitsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HabitsStore.shared.habits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = habitTableView.dequeueReusableCell(withIdentifier: HabitTableViewCell.id, for: indexPath) as! HabitTableViewCell


        cell.configureCell(name: HabitsStore.shared.habits[indexPath.row].name,
                           date: HabitsStore.shared.habits[indexPath.row].date,
                           trackDates: HabitsStore.shared.habits[indexPath.row].trackDates,
                           color: HabitsStore.shared.habits[indexPath.row].color)


        return cell
    }


}
