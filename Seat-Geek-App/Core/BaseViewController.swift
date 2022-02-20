//
//  BaseViewController.swift
//  Seat-Geek-App
//
//  Created by abdallah ragab on 19/02/2022.
//


import RxCocoa
import RxSwift
import UIKit

class BaseViewController: UIViewController {
    let dispose = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindUI()
        bindData()
        bindValidations()
        bindCallbacks()
        
        // Do any additional setup after loading the view.
    }
    
    /// setup ui like configure header view and ui styling
    func setupUI() {}
    
    /// any subject related to ui like(Buttons, textfield ...etc)
    func bindUI() {}
    
    func bindData() {}
    
    /// any subject related to validation like(isValidPhone ...etc)
    func bindValidations() {}
    
    /// any subject related to apis calls like(loading, error, success)
    func bindCallbacks() {}
    
    
}
