//
//  SubjectTableViewCell.swift
//  TimeManagement
//
//  Created by TERANAKA RYO on 2021/09/01.
//
import Foundation
import UIKit

class EnthusiasmTableViewCell: UITableViewCell, Nibable {
    typealias EnthusiasmHandler = () -> Void
    private var handler: EnthusiasmHandler?
    
    func setup(handler: @escaping EnthusiasmHandler) {
        self.handler = handler
    }
    
    @IBAction func onTouchedButton(_ sender: Any) {
        handler?()
    }

}
