//
//  SeatGeekDetailsViewController.swift
//  Seat-Geek-App
//
//  Created by abdallah ragab on 19/02/2022.
//

import UIKit
import RxCocoa
import RxSwift

class SeatGeekDetailsViewController: BaseViewController {
    
    @IBOutlet var imgViewEvent: UIImageView!
    @IBOutlet var lblEventName: UILabel!
    @IBOutlet var lblAddress: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var btnBack: UIButton!
    
    var model:Event? = nil
    
    // MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bindUI() {
        bindingData()
        btnBack.rx.tap.subscribe(onNext: ({ [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        })).disposed(by: dispose)
    }
    
    func bindingData(){
        lblEventName.text = model?.title ?? ""
        lblAddress.text = model?.venue?.extendedAddress ?? ""
        lblDate.text = model?._date ?? ""
        if ( model?.performers?.count ?? 0) >  0 {
            imgViewEvent.loadWebImage(imageUrl: model?.performers?[0].image ?? "", placeHolder: UIImage())
        }
    }
}

