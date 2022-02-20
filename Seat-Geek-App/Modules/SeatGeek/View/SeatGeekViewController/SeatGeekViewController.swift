//
//  SeatGeekViewController.swift
//  Seat-Geek-App
//
//  Created by abdallah ragab on 19/02/2022.
//

import UIKit
import RxSwift

class SeatGeekViewController: BaseViewController {
    // MARK: - IBOutlet
    
    @IBOutlet var tblSeatGeek: UITableView!
    @IBOutlet  var searchBar: UISearchBar!
    
    
    // MARK: - Var
    var viewModel: SeatGeekViewModel!
    
    // MARK: - override
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        searchBar.searchTextField.textColor = .white
        setupTblView()
    }
    
    override func bindUI() {
        
        searchBar.rx.searchButtonClicked
            .subscribe(onNext: { [unowned self] in
                searchBar.resignFirstResponder()
                if let searchKey = searchBar.text  ,  searchKey != "" {
                    self.viewModel.getSeatGeek(searchTxt:searchKey )
                }else {
                    self.viewModel.seatGeekList.accept([])
                    self.viewModel.noResult.onNext(true)
                }
            }).disposed(by: dispose)
        
        searchBar.rx.cancelButtonClicked
            .subscribe(onNext: { [unowned self] in
                searchBar.text = ""
            }).disposed(by: dispose)
        
        viewModel.seatGeekList
            .bind(to: tblSeatGeek.rx.items(cellIdentifier: R.reuseIdentifier.eventCell.identifier, cellType: EventCell.self)) { _, model, cell in
                cell.selectionStyle = .none
                cell.bindData(model: model)
            }.disposed(by: dispose)
        
        
        tblSeatGeek.rx.itemSelected
            .subscribe(onNext: { [weak self] index in
                guard let self = self else { return }
                if let vc  = R.storyboard.seatGeek.seatGeekDetailsViewController(){
                    vc.model = self.viewModel.seatGeekList.value[index.row]
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }).disposed(by: dispose)
        
    }
    
    override func bindCallbacks() {
        viewModel.noResult.bind { result in
            if let isNoRes = result, isNoRes {
                self.tblSeatGeek.setEmptyMessage("No Data")
            } else {
                self.tblSeatGeek.restore()
            }
        }.disposed(by: dispose)
        
        viewModel.loading.bind { [weak self] loading in
            if let isLoading = loading {
                isLoading ? Loader.show() : Loader.hide()
            }
        }.disposed(by: dispose)
        
        viewModel.error.bind { [weak self] error in
            if let err = error {
                self?.alert(message: err)
            }
        }.disposed(by: dispose)
    }
}

// MARK: - Helper Functions

extension SeatGeekViewController {
    func setupTblView() {
        tblSeatGeek.tableFooterView = UIView()
        tblSeatGeek.separatorStyle = .none
        tblSeatGeek.rowHeight = UITableView.automaticDimension
        tblSeatGeek.estimatedRowHeight = 225
    }
}
