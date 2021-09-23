//
//  ViewModel.swift
//  TimeManagement
//
//  Created by TERANAKA RYO on 2021/09/05.
//
import Foundation

protocol ViewModelDelegate {
    func onChangedValue(viewModel: ViewModel)
    func navigateAuthentication()
    func navigateItemList()
    func navigateItemDetail(item: SubjectInfo)
}

class ViewModel {
    private(set) var imageURLs: [String] = []
    private(set) var isSigningIn: Bool = false
    private(set) var items: [SubjectInfo] = []
    private(set) var subjectItems: [SubjectInfo] = []
    
    var delegate: ViewModelDelegate?
    
    func signState(isSigningIn: Bool) {
        self.isSigningIn = isSigningIn
        delegate?.onChangedValue(viewModel: self)
    }
    
    func fireAuthenticate() {
        delegate?.navigateAuthentication()
    }
    
    func navigateItemList() {
        delegate?.navigateItemList()
    }
    
    func navigateItemDetail(item: SubjectInfo) {
        delegate?.navigateItemDetail(item: item)
    }
    
    
    func fetchTopPage() {
        /*
        ApiClient.shared.getTopPage { [weak self] response in
            guard let self = self else { return }
            self.parseResponse(response)
        }
         */
    }
    
    func makeSectionTypes() -> [SectionType] {
        var sections: [SectionType] = []
        if imageURLs.count > 0 {
            //sections.append(.carousel)
        }
        if isSigningIn == false {
            sections.append(.enthusiasm)
            sections.append(.subjectHead)
        }
        if items.isEmpty == false {
            //sections.append(.itemSelection)
        }
        if subjectItems.isEmpty == false {
            sections.append(.subjectItem)
        }
        return sections
    }
    
    
    func rowCount(for section: SectionType) -> Int {
        switch section {
        //case .carousel: return imageURLs.isEmpty ? 0 : 1
        case .enthusiasm: return isSigningIn ? 0 : 1
        case .subjectHead: return isSigningIn ? 0 : 1
        case .subjectItem: return subjectItems.isEmpty ? 0 : 1 + subjectItems.count
        //case .itemSelection: return items.isEmpty ? 0 : 2
        }
    }
    /*
    func isTouchableCell(path indexPath: IndexPath) -> Bool {
        let section = makeSectionTypes()[indexPath.section]
        return section == .itemRanking && indexPath.row != 0
    }
     */
    
    func touchCell(path indexPath: IndexPath) {
        //guard isTouchableCell(path: indexPath) else { return }
        /*
        let index = indexPath.row - 1
        let item = rankingItems[index]
        navigateItemDetail(item: item)
        */
    }
    
    func touchSelectionItem(path indexPath: IndexPath) {
        let item = items[indexPath.item]
        navigateItemDetail(item: item)
    }
    
    /*
    private func parseResponse(_ response: TopPageResponse) {
        defer {
            delegate?.onChangedValue(viewModel: self)
        }
        imageURLs = response.carouselImageURLs
        items = response.items
        rankingItems = response.rankingItems
    }
    */
}
