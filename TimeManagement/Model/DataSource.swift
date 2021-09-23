//
//  DataSource.swift
//  TimeManagement
//
//  Created by TERANAKA RYO on 2021/09/05.
//

import Foundation
import UIKit

class DataSource: NSObject, UITableViewDataSource {
    private var viewModel: ViewModel!
    private var sections: [SectionType] = []
    private weak var tableView: UITableView?
    
    func setup(tableView: UITableView, viewModel: ViewModel) {
        self.tableView = tableView
        self.viewModel = viewModel
        self.sections = viewModel.makeSectionTypes()
    }
    
    func refresh() {
        sections = viewModel.makeSectionTypes()
        tableView?.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = sections[section]
        return viewModel.rowCount(for: sectionType)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]

        let ret: UITableViewCell
        
        switch section {
        /*
        case .carousel:
            let cell = tableView.dequeueReusableCell(CarouselTableViewCell.self, for: indexPath)
            cell.setup(imageURLs: viewModel.imageURLs)
            ret = cell
        */
        case .enthusiasm:
            let cell = tableView.dequeueReusableCell(EnthusiasmTableViewCell.self, for: indexPath)
            cell.setup { [weak self] in
                self?.viewModel?.fireAuthenticate()
            }
            ret = cell
        case .subjectHead:
             let cell = tableView.dequeueReusableCell(SubjectTableHeadViewCell.self, for: indexPath)
             ret = cell
        case .subjectItem:
            let cell = tableView.dequeueReusableCell(SubjectTableViewCell.self, for: indexPath)
            //cell.setup(item: subjectList[items])
            //cell.setup(item: viewModel.items[indexPath.row - 1])
            ret = cell
        }
        return ret

    }
}

extension DataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        //return viewModel.isTouchableCell(path: indexPath)
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.touchCell(path: indexPath)
    }
}
