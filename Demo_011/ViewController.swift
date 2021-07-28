//
//  ViewController.swift
//  Demo_011
//
//  Created by 鄭淳澧 on 2021/7/18.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //取得螢幕大小方便後面定位或設置元件大小用
        let fullScreenSize = UIScreen.main.bounds.size
        
        let myButton = UIButton(type: .system)
        myButton.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        //給第一個button一個title
        myButton.setTitle("簡單提示", for: .normal)
        myButton.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myButton.center = CGPoint(x: fullScreenSize.width/2, y: fullScreenSize.height * 0.15)
        //第一個buttonr加入點擊後的動作, 選擇器裡是下面編寫的方法
        //偵測點擊手勢是touchupinside, 此手勢才會觸發前一行所說的動作
        myButton.addTarget(nil, action: #selector(simpleHint), for: .touchUpInside)
        
        let myButton2 = UIButton(type: .system)
        myButton2.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        myButton2.setTitle("送出", for: .normal)
        myButton2.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myButton2.center = CGPoint(x: fullScreenSize.width/2, y: fullScreenSize.height * 0.3)
        myButton2.addTarget(nil, action: #selector(confirm), for: .touchUpInside)
        
        let myButton3 = UIButton(type: .system)
        myButton3.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        myButton3.setTitle("刪除", for: .normal)
        myButton3.backgroundColor = .green
        myButton3.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.45)
        myButton3.addTarget(nil, action: #selector(deleteSomething), for: .touchUpInside)
        
        let myButton4 = UIButton(type: .system)
        myButton4.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        myButton4.setTitle("登入", for: .normal)
        myButton4.backgroundColor = .green
        myButton4.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.6)
        myButton4.addTarget(nil, action: #selector(login), for: .touchUpInside)
        
        
        
        self.view.addSubview(myButton)
        self.view.addSubview(myButton2)
        self.view.addSubview(myButton3)
        self.view.addSubview(myButton4)
        
    }
    
    @objc func login() {
        let alertController = UIAlertController(title: "登入", message: "請輸入帳號密碼", preferredStyle: .alert
        )
        
        alertController.addTextField { (textField: UITextField) in
            textField.placeholder = "帳號"
        }
        
        alertController.addTextField { (textField2: UITextField) in
            textField2.placeholder = "密碼"
            textField2.isSecureTextEntry = true
        }
        
        
        let cancelAction = UIAlertAction(
            title: "取消", style: .cancel, handler: nil
        )
        alertController.addAction(cancelAction)
        
        
        let okAction = UIAlertAction(title: "登入", style: .default) {
            (action: UIAlertAction) in
            let account = (alertController.textFields?.first)! as UITextField
            let password = (alertController.textFields?.last)! as UITextField
            
            print("輸入的帳號是\(account.text ?? "")")
            print("輸入的密碼是\(password.text ?? "")")
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: showMe)
    }
    
    
    @objc func deleteSomething() {
        let alertController = UIAlertController(title: "刪除", message: "刪除變成紅字", preferredStyle: .alert
        )
        let cancelAction = UIAlertAction(
            title: "取消", style: .cancel, handler: nil
        )
        alertController.addAction(cancelAction)
        
        
        let okAction = UIAlertAction(title: "刪除", style: .destructive, handler: nil
        )
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: showMe)
        
    }
    
    
    func showMe() {
        print("show提示框時便會執行")
    }
    
    
    @objc func confirm() {
        let alertController = UIAlertController(
            title: "送出", message: "確認送出？", preferredStyle: .alert
        )
        let cancelAction = UIAlertAction(
            title: "取消", style: .cancel) { _ in
            print("按下取消後便會出現")
        }
        alertController.addAction(cancelAction)
        let okAction = UIAlertAction(
            title: "送出", style: .default)  { _ in
            print("按下送出後便會出現")
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //第一個button的方法
    @objc func simpleHint() {
        //宣告提示框, style是.alert
        let alertController = UIAlertController(
            title: "提示", message: "請按確認繼續", preferredStyle: .alert
        )
        //宣告點擊動作
        let okAction = UIAlertAction(
            //style有三種, 多個點擊動作裡cancel只能有一個
            title: "確認", style: .default) { _ in
            print("按下確認後，閉包裡的動作")
        }
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    struct ViewControllerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> ViewController {
             UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as! ViewController
        }
        
        func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        }
        
        typealias UIViewControllerType = ViewController
    }
    
    
    struct ViewControllerView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                ViewControllerView()
                    .previewDevice("iPhone 12 mini")
            }
        }
    }
    

}

