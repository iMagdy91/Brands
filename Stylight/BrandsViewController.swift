//
//  BrandsViewController.swift
//  Stylight
//
//  Created by Mohamed Magdy on 6/21/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import UIKit
import MBProgressHUD

fileprivate let headerHeight: CGFloat = 50.0

fileprivate enum BrandSections: Int {
    case selectedBrands
    case allBrands
    case brandsSections
}

fileprivate enum SectionTitle: String {
    case selectedBrands = "Selected Brands"
    case allBrands = "All Brands"
}

class BrandsViewController: BaseViewController {

    //MARK:- Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK:- Private Properties
    fileprivate var allBrands: [Brand]?
    fileprivate var selectedBrands: [Brand] = []
    
    
    
    //MARK:- ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getBrands()
    }


    //MARK:- Private Methods
    /**
     Get all brands from API
    */
    private func getBrands() {
        MBProgressHUD.showAdded(to: view, animated: true)
        BrandsPresenter.getAllBrandsWithSuccess(success: { [weak self](model) in
            guard let strongSelf = self else {return}
            MBProgressHUD.hide(for: strongSelf.view, animated: true)
            self?.allBrands = model as? [Brand]
            self?.tableView.reloadData()
        }) {[weak self] (error) in
            guard let strongSelf = self else {return}
            MBProgressHUD.hide(for: strongSelf.view, animated: true)
            self?.showMessage(message: error.localizedDescription)
        }
        
        
    }

    

}

extension BrandsViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK:- UITableViewDataSource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return BrandSections.brandsSections.rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == BrandSections.selectedBrands.rawValue {
            return selectedBrands.count
        }
        else if section == BrandSections.allBrands.rawValue {
            return allBrands?.count ?? 0
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier: String = UITableViewCellIndentifier.brandCellIdentifier
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? BrandsTableViewCell
        
        if indexPath.section == BrandSections.selectedBrands.rawValue {
            cell?.customizeCellForBrand(brand: selectedBrands[indexPath.row], checkmark: true)
        }
        else if indexPath.section == BrandSections.allBrands.rawValue {
            let checkmark: Bool? = selectedBrands.contains(where: { $0.id == allBrands?[indexPath.row].id})
            cell?.customizeCellForBrand(brand: allBrands?[indexPath.row], checkmark: checkmark ?? false)
        }
        
        return cell!
    }
    
    //MARK:- UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: HeaderView = HeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: headerHeight))
        
        headerView.viewText = (section == BrandSections.selectedBrands.rawValue) ? SectionTitle.selectedBrands.rawValue : SectionTitle.allBrands.rawValue

        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == BrandSections.selectedBrands.rawValue {
            let brand = selectedBrands[indexPath.row]
            brand.selected = false
            selectedBrands.remove(at: indexPath.row)
        }
        else if indexPath.section == BrandSections.allBrands.rawValue {
            
            if let brand = allBrands?[indexPath.row] {
                if brand.selected {
                    
                    if let index = selectedBrands.index(where: { $0.id == brand.id }) {
                        selectedBrands.remove(at: index)
                    }
                }
                else {
                    selectedBrands.append(brand)
                }
                
                brand.selected = !brand.selected

            }
            
        }
        selectedBrands = BrandsPresenter.sortBrandsArray(array: selectedBrands) ?? selectedBrands
        
        tableView.reloadData()
    }
}







