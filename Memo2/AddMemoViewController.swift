//
//  AddMemoViewController.swift
//  Memo2
//
//  Created by 小野真治 on 2021/04/10.
//

import UIKit

class AddMemoViewController: UIViewController {
    
    @IBOutlet weak var memoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save(_ sender: Any) {
        let inputText = memoTextView.text
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil{  //テキストに何か書かれているか？
            //saveMemoArrayに取得
            var saveMemoArray = ud.array(forKey: "memoArray") as! [String]
            if inputText != ""{ //配列に追加
                saveMemoArray.append(inputText!)
            }else{
               print("何も入力されていません")
            }
            ud.set(saveMemoArray, forKey: "memoArray")
        }else{    //最初、何も書かれていない場合
            var newMemoArray = [String]()
            //nilを強制アンラップはエラーが出るから
            if inputText != ""{
                //inputtextはoptional型だから強制アンラップ
                newMemoArray.append(inputText!)
            }else{
                print("何も入っていません。")
            }
            ud.set(newMemoArray, forKey: "memoArray")
        }
        ud.synchronize()
        memoTextView.text = ""
        self.dismiss(animated: true, completion: nil)
    }

}

