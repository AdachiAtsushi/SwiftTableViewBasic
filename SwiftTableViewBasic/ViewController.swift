//
//  ViewController.swift
//  SwiftTableViewBasic
//
//  Created by 安達篤史 on 2020/06/19.
//  Copyright © 2020 Adachi Atsushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    // ===== 画面項目定義 =====
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    // テキストフィールドの値を格納する配列
    var textArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self

    }
    
    // ナビゲーションバーを外すメソッド
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    
    // ========= TableViewで必要なDelegateメソッドを定義 =========
    // セクションの中の行の数を指定するメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }

    // セクションの数を指定するメソッド
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // セル構築時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // セルのハイライトを消す
        cell.selectionStyle = .none
        
        cell.textLabel?.text = textArray[indexPath.row]
        cell.imageView!.image = UIImage(named: "checkImage")
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セル押下時に入力されていた値をNextViewControllerへ渡す
        let nextVC = storyboard?.instantiateViewController(identifier: "next") as! NextViewController
        
        nextVC.toDoString = textArray[indexPath.row]
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    // セルの高さを指定するメソッド
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height / 6
    }
    
    // キーボードのリターンキーが押下された時に実行されるメソッド
    // テキストフィールドの値を格納する配列に値を詰め込んでいる。
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 配列に値を格納
        textArray.append(textField.text!)
        
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        // テキストフィールドに入力されている値をクリア
        textField.text = ""
        
        tableView.reloadData()
        
        return true
    }
}

