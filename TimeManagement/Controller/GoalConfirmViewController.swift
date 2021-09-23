//
//  GoalConfirmViewController.swift
//  TimeManagement
//
//  Created by TERANAKA RYO on 2021/09/01.
//

import Foundation
import UIKit

class GoalConfirmViewController: UIViewController{

    @IBOutlet weak var goalTableView: UITableView!
    private let dataSource = DataSource()
    private let viewModel = ViewModel()

    var subjectList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Refresh control
        goalTableView.refreshControl = UIRefreshControl()
        goalTableView.refreshControl?.addTarget(self, action: #selector(onRefresh(_:)), for: .valueChanged)
        
        // Table
        goalTableView.dataSource = dataSource
        goalTableView.delegate = dataSource
        goalTableView.tableFooterView = UIView()
        goalTableView.delaysContentTouches = false
        
        dataSource.setup(tableView: goalTableView, viewModel: viewModel)
        viewModel.delegate = self
        
    }
    
    @objc private func onRefresh(_ sender: AnyObject) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.goalTableView.refreshControl?.endRefreshing()
        }
    }

}

extension GoalConfirmViewController: ViewModelDelegate {
    func navigateAuthentication() {
        print("Navigate authentication view controller")
    }
    
    func navigateItemDetail(item: SubjectInfo) {
        print("Navigate item detail view controller. \(item)")
    }
    
    func navigateItemList() {
        print("Navigate item list view controller.")
    }
    
    func onChangedValue(viewModel: ViewModel) {
        dataSource.refresh()
    }
}
