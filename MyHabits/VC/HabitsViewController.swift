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
        let newHabitVC = storyboard.instantiateViewController(withIdentifier: "AddNewHabitVC") as! HabitViewController
        let navController = UINavigationController(rootViewController: newHabitVC)
        navController.modalTransitionStyle = .coverVertical
        navController.modalPresentationStyle = .fullScreen

        self.navigationController?.present(navController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(plugView, habitCollectionView)
        habitCollectionView.dataSource = self
        habitCollectionView.delegate = self
        setupConstraints()

    }

    override func viewWillAppear(_ animated: Bool) {
        let navigationBar = navigationController?.navigationBar
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.shadowColor = ColorStyles.navigationBarSeparator
        navigationBar?.scrollEdgeAppearance = navigationBarAppearance
        let tabBar = tabBarController?.tabBar
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.shadowColor = ColorStyles.tabBarSeparator
        if #available(iOS 15.0, *) {
            tabBar?.scrollEdgeAppearance = tabBarAppearance
        }
        addNewHabitButton.tintColor = ColorStyles.purple
        reloadView()
    }

    // MARK: - UI elements

    private lazy var plugView: UIView = {
        let plugView = UIView()
        plugView.toAutoLayout()
        return plugView
    }()

    private lazy var habitCollectionView: UICollectionView = {
        let habitCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())

        habitCollectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: HabitCollectionViewCell.id)
        habitCollectionView.toAutoLayout()
        habitCollectionView.backgroundColor = ColorStyles.lightGray
        return habitCollectionView
    }()

}

    // MARK: - Actions
extension HabitsViewController {

    public func reloadView() {
        self.habitCollectionView.reloadData()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([

            plugView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            plugView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            plugView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            plugView.heightAnchor.constraint(equalToConstant: 0),


            habitCollectionView.topAnchor.constraint(equalTo: plugView.bottomAnchor),
            habitCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            habitCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            habitCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

        ])
    }

}

extension HabitsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = habitCollectionView.dequeueReusableCell(withReuseIdentifier: HabitCollectionViewCell.id, for: indexPath) as! HabitCollectionViewCell
        cell.configureCell(name: HabitsStore.shared.habits[indexPath.row].name,
                           date: HabitsStore.shared.habits[indexPath.row].date,
                           trackDates: HabitsStore.shared.habits[indexPath.row].trackDates,
                           color: HabitsStore.shared.habits[indexPath.row].color)


        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HabitsStore.shared.habits.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if view.frame.width <= 428 {
            let itemsPerRow: CGFloat = 1
            let paddingWidth: CGFloat = 16 * (itemsPerRow + 1)
            let availableWidth = habitCollectionView.frame.width - paddingWidth
            let widthPerItem = availableWidth / itemsPerRow
            return CGSize(width: widthPerItem, height: 130)
        }
        else {
            let itemsPerRow: CGFloat = 2
            let paddingWidth:CGFloat = 16 * (itemsPerRow + 1)
            let availableWidth = habitCollectionView.frame.width - paddingWidth
            let widthPerItem = availableWidth / itemsPerRow
            return CGSize(width: widthPerItem, height: 130)
        }



    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 22, left: 16, bottom: 22, right: 16)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }


}
