//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Dmitrii Lobanov on 16.09.2021.
//

import UIKit

class HabitsViewController: UIViewController {
    
    static let id = "HabitsViewController"
    
    @IBOutlet weak var addNewHabitButton: UIBarButtonItem!
    
    @IBAction func addNewHabitAction(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: HabitsVCConstant.storyboardName, bundle: nil)
        let newHabitVC = storyboard.instantiateViewController(withIdentifier: HabitViewController.id) as! HabitViewController
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromTop
        navigationController?.view.layer.add(transition, forKey: nil)
        navigationController?.pushViewController(newHabitVC, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(plugView, habitCollectionView)
        habitCollectionView.dataSource = self
        habitCollectionView.delegate = self
        setupConstraints()
        correctTabBarTitle()
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
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        correctTabBarTitle()
        self.habitCollectionView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        title = ""
        correctTabBarTitle()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        title = HabitsVCConstant.title
        correctTabBarTitle()
    }
    
    private func correctTabBarTitle() {
        self.tabBarController?.viewControllers?[0].tabBarItem.title = NSLocalizedString("Привычки", comment: "")
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
        habitCollectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: ProgressCollectionViewCell.id)
        habitCollectionView.toAutoLayout()
        habitCollectionView.backgroundColor = ColorStyles.lightGray
        return habitCollectionView
    }()
}

// MARK: - Actions
extension HabitsViewController {
    
    func reloadView() {
        self.habitCollectionView.reloadData()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            plugView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            plugView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            plugView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            habitCollectionView.topAnchor.constraint(equalTo: plugView.bottomAnchor),
            habitCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            habitCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            habitCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
}

extension HabitsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 {
            let cell = habitCollectionView.dequeueReusableCell(withReuseIdentifier: HabitCollectionViewCell.id, for: indexPath) as! HabitCollectionViewCell
            var sortHabitArray = HabitsStore.shared.habits
            sortHabitArray.sort(by: {stripTime(from: $0.date) < stripTime(from: $1.date)})
            cell.configureCell(habit: sortHabitArray[indexPath.item])
            
            cell.habitTrackCircleAction = { [weak self] in
                if sortHabitArray[indexPath.item].isAlreadyTakenToday {
                    return
                }
                else {
                    let habit = sortHabitArray[indexPath.item]
                    HabitsStore.shared.track(habit)
                }
                self?.habitCollectionView.reloadData()
            }
            return cell
        }
        else {
            let cell = habitCollectionView.dequeueReusableCell(withReuseIdentifier: ProgressCollectionViewCell.id, for: indexPath) as! ProgressCollectionViewCell
            cell.updateProgress()
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return HabitsVCConstant.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return HabitsStore.shared.habits.count
        }
        else {
            return HabitsVCConstant.defaultNumberOfItemsInSection
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 1 {
            if view.frame.width <= 428 {
                let itemsPerRow: CGFloat = 1
                let paddingWidth: CGFloat = 16 * (itemsPerRow + 1)
                let availableWidth = habitCollectionView.frame.width - paddingWidth
                let widthPerItem = availableWidth / itemsPerRow
                return CGSize(width: widthPerItem, height: HabitsVCConstant.cellHeight)
            }
            else {
                let itemsPerRow: CGFloat = 2
                let paddingWidth:CGFloat = 16 * (itemsPerRow + 1)
                let availableWidth = habitCollectionView.frame.width - paddingWidth
                let widthPerItem = availableWidth / itemsPerRow
                return CGSize(width: widthPerItem, height: HabitsVCConstant.cellHeight)
            }
        }
        else {
            let itemsPerRow: CGFloat = 1
            let paddingWidth: CGFloat = 16 * (itemsPerRow + 1)
            let availableWidth = habitCollectionView.frame.width - paddingWidth
            let widthPerItem = availableWidth / itemsPerRow
            return CGSize(width: widthPerItem, height: HabitsVCConstant.progressCellHeight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
            return HabitsVCConstant.progressInsetForSectionAt
        }
        else {
            return HabitsVCConstant.mainInsetForSectionAt
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return HabitsVCConstant.minimumLineSpacingForSectionAt
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return HabitsVCConstant.minimumInteritemSpacingForSectionAt
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let storyboard = UIStoryboard(name: HabitsVCConstant.storyboardName, bundle: nil)
            guard let habitDetailsVC = storyboard.instantiateViewController(identifier: HabitDetailsViewController.id) as? HabitDetailsViewController else { return }
            habitDetailsVC.habitIndex = indexPath.item
            habitDetailsVC.modalTransitionStyle = .coverVertical
            habitDetailsVC.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(habitDetailsVC, animated: true)
        }
    }
}
