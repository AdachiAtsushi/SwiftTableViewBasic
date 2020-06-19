//
//  NextViewController.swift
//  SwiftTableViewBasic
//
//  Created by 安達篤史 on 2020/06/19.
//  Copyright © 2020 Adachi Atsushi. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    // ========== 画面項目　==========
    @IBOutlet weak var todoLabel: UILabel!
    
    var toDoString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoLabel.text = toDoString

    }
    
    // ナビゲーションバーを外すメソッド
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
    
}
