//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Dmitrii Lobanov on 27.09.2021.
//

import UIKit

class HabitDetailsViewController: UIViewController {
    
    static let id = "HabitDetailsViewController"
    
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
        createRightNavigationBarItem()
        self.habitActivityTable.reloadData()
        
        
    }
    
    // MARK: - UI elements
    
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
            cell.accessoryView?.frame = HabitDetailsVCConstant.checkImageFrame
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return HabitDetailsVCConstant.titleForHeaderInSection
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        habitActivityTable.deselectRow(at: indexPath, animated: true)
    }
    
    
    func createRightNavigationBarItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .done, target: self, action: #selector(rightButtonAction))
        let saveButtonAttributes = [
            NSAttributedString.Key.font: UIFont(name: "SFProText-Regular", size: 17)!,
            NSAttributedString.Key.foregroundColor: ColorStyles.purple,
        ]
        self.navigationItem.rightBarButtonItem!.setTitleTextAttributes(saveButtonAttributes, for: .normal)
        self.navigationItem.rightBarButtonItem!.setTitleTextAttributes(saveButtonAttributes, for: .highlighted)
    }
    
    
    @objc func rightButtonAction(sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: HabitsVCConstant.storyboardName, bundle: nil)
        let newHabitVC = storyboard.instantiateViewController(withIdentifier: HabitViewController.id) as! HabitViewController
        let navController = UINavigationController(rootViewController: newHabitVC)
        navController.modalTransitionStyle = .coverVertical
        navController.modalPresentationStyle = .fullScreen
        newHabitVC.habitIndex = self.habitIndex
        
        self.navigationController?.present(navController, animated: true, completion: nil)
    }
}
