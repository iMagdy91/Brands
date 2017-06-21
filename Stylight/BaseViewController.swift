//
//  BaseViewController.swift
//  Stylight
//
//  Created by Mohamed Magdy on 6/21/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    func showMessage(message: String) {
        let alertController = UIAlertController.init(title: nil, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction.init(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        
        present(alertController, animated: true, completion: nil)
        
    }

}
