//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Dmitrii Lobanov on 27.09.2021.
//

import UIKit

class HabitDetailsViewController: UIViewController {

    var habitIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(habitActivityTable)
        setupConstraints()
        habitActivityTable.delegate = self
        habitActivityTable.dataSource = self
        habitActivityTable.register(HabitDetailsViewCell.self, forCellReuseIdentifier: HabitDetailsViewCell.id)
    }

    override func viewWillAppear(_ animated: Bool) {
        var tempHabitArray = HabitsStore.shared.habits
        tempHabitArray.sort(by: {stripTime(from: $0.date) < stripTime(from: $1.date)})
        title = tempHabitArray[habitIndex].name
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        self.navigationItem.rightBarButtonItem = rightButtonItem
    }

    // MARK: - UI elements

    let rightButtonItem = UIBarButtonItem.init(title: "Править", image: nil, primaryAction: UIAction.init(handler: { _ in
        print(0)
    }), menu: nil)

    private lazy var habitActivityTable: UITableView = {
        let habitActivityTable = UITableView()
        habitActivityTable.toAutoLayout()
        habitActivityTable.backgroundColor = ColorStyles.lightGray
        return habitActivityTable
    }()

    private lazy var habitCheckMarkImageView: UIImageView = {
        let habitCheckMarkImageView = UIImageView(image: UIImage.init(systemName: "checkmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 17, weight: .bold)))
        habitCheckMarkImageView.tintColor = ColorStyles.purple
        habitCheckMarkImageView.toAutoLayout()
        return habitCheckMarkImageView
    }()
}


// MARK: - Actions
extension HabitDetailsViewController: UITableViewDelegate, UITableViewDataSource {

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            habitActivityTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            habitActivityTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            habitActivityTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            habitActivityTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HabitsStore.shared.dates.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.doesRelativeDateFormatting = true

        let cell = habitActivityTable.dequeueReusableCell(
            withIdentifier: HabitDetailsViewCell.id,
            for: indexPath
        ) as! HabitDetailsViewCell

        let dateArray : [Date] = Array(HabitsStore.shared.dates.reversed())
        cell.textLabel?.text = dateFormatter.string(from: dateArray[indexPath.row])
        if HabitsStore.shared.habit(HabitsStore.shared.habits[habitIndex], isTrackedIn: dateArray[indexPath.row]) {
            cell.accessoryView = habitCheckMarkImageView
            cell.accessoryView?.frame = CGRect(x: 0, y: 0, width: 17, height: 17)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "АКТИВНОСТЬ"
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        habitActivityTable.deselectRow(at: indexPath, animated: true)
    }







    }




