//
//  QuestionViewController.swift
//  spaltacampApp
//
//  Created by 阿部輝明 on 2018/11/10.
//  Copyright © 2018 阿部輝明. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var QuestionField: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
         QuestionField.delegate = self
        
        

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 編集中に変更があるたびに呼び出されるデリゲートメソッド（変換が適用されない）
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let writtenText = QuestionField.text! as NSString
        let replaceString = writtenText.replacingCharacters(in: range, with: string)
        if replaceString != "" {
            // ユーザーデフォルトに保存する
            let defaults = UserDefaults.standard
            defaults.set(writtenText, forKey: "memo")
        } else {
            print("Error")
        }
        return true
    }
    
    //TOPに戻るボタンが押されたときの処理
    @IBAction func tapBackToTopButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //テキストを保存ボタンが押されたときの処理
    @IBAction func tapSaveButton(_ sender: Any) {
        
        let writtenText = QuestionField.text! as NSString
        let defaults = UserDefaults.standard
        defaults.set(writtenText, forKey: "memo")
        view.endEditing(true)
        
        //問題内容のFieldが入力されているかどうか
        if QuestionField.text! != "" {
            //QuestionTextFieldになにか文字が入力されていたときの処理
        } else {
            //何も文字が入力されていなかったときの処理
            showAlert(message: "問題文を入力してください。")
        }
        
    }
    

    
    
    
    
    
    
    //テキストをすべて削除ボタンを押されたときの処理
    
    @IBAction func tapAllDeleteButton(_ sender: Any) {
    }
    
    
    // アラートを表示する関数
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
