//
//  LangViewController6.swift
//  English1400
//
//  Created by 梁川 将和 on 2018/02/19.
//  Copyright © 2018年 Yanagawa Masakazu. All rights reserved.
//

import UIKit

class LangViewController6: UIViewController {

    //ディスプレイサイズ取得
    let w = UIScreen.main.bounds.size.width
    let h = UIScreen.main.bounds.size.height
    
    //英単語配列
    var i = 0
    var E_textFirst = UILabel()
    var J_textFirst = UILabel()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //背景色
        let back = UIImageView(image: UIImage(named: "back2"))
        back.frame =  CGRect(x: 0, y: 0, width: w, height: h)
        self.view.addSubview(back)
        
        //英単語表示部分の背景色
        let langView = UIView(frame: CGRect(x: (w - 350) / 2, y: (h - 350) / 2 - 50, width: 350, height:350))
        langView.backgroundColor = .white
        langView.layer.borderColor = UIColor.black.cgColor
        langView.layer.borderWidth = 2.0
        self.view.addSubview(langView)
        
        //英単語・意訳表示
        E_textFirst.frame = CGRect(x: (w - 300) / 2, y: (h - 300) / 2 - 50, width: 300, height: 300)
        J_textFirst.frame = CGRect(x: (w - 350) / 2, y: (h - 250) / 2 + 40, width: 350, height: 200)
        E_textFirst.text = "\(LangArray.E_langArray6[i])"
        E_textFirst.textAlignment = .center
        E_textFirst.font = UIFont.systemFont(ofSize: CGFloat(42))
        self.view.addSubview(E_textFirst)
        
        J_textFirst.text = "\(LangArray.J_langArray6[i])"
        J_textFirst.textAlignment = .center
        J_textFirst.numberOfLines = 0;
        J_textFirst.textColor = .red
        J_textFirst.font = UIFont.systemFont(ofSize: CGFloat(15))
        self.view.addSubview(J_textFirst)
        
        //次へボタン
        let nextword = UIButton(frame: CGRect(x: (w - (w - 350) / 2) - 80, y: (h - 80) / 2 + 180, width: 80, height: 80))
        nextword.setImage(UIImage(named: "button1"), for: .normal)
        nextword.addTarget(self, action: #selector(LangViewController.next(_:)), for: .touchUpInside)
        self.view.addSubview(nextword)
        
        //前へボタン
        let backword = UIButton(frame: CGRect(x: (w - 350) / 2, y: (h - 80) / 2 + 180, width: 80, height: 80))
        backword.setImage(UIImage(named: "button2"), for: .normal)
        backword.addTarget(self, action: #selector(LangViewController.backword(_:)), for: .touchUpInside)
        self.view.addSubview(backword)
        
        //メニューリスト
        let list = UIButton(frame: CGRect(x: (w - 80) / 2, y: (h - 80) / 2 + 180, width: 80, height: 80))
        list.setImage(UIImage(named: "button3"), for: .normal)
        list.addTarget(self, action: #selector(LangViewController.List(_:)), for: .touchUpInside)
        self.view.addSubview(list)
        
        
    }
    
    //次へボタンを押下時の処理
    @objc func next(_ b: UIButton) {
        //カウントアップ
        i += 1
        //テキストを初期化
        E_textFirst.text = ""
        J_textFirst.text = ""
        
        if i < 100 {
            //次の配列の要素を表示する
            E_textFirst.text = "\(LangArray.E_langArray6[i])"
            self.view.addSubview(E_textFirst)
            
            J_textFirst.text = "\(LangArray.J_langArray6[i])"
            self.view.addSubview(J_textFirst)
        } else {
            //次の配列の要素がない場合、　メッセージを表示
            E_textFirst.frame = CGRect(x: (w - 300) / 2, y: (h - 300) / 2 - 50, width: 300, height: 300)
            E_textFirst.text = "次、いってみよう！"
            E_textFirst.font = UIFont.systemFont(ofSize: CGFloat(35))
            E_textFirst.numberOfLines = 0
            E_textFirst.textColor = .red
            self.view.addSubview(E_textFirst)
        }
    }
    
    //前へボタン押下時の処理
    @objc func backword(_ b: UIButton) {
        if i > 0 && i < 100 {
            i -= 1
            E_textFirst.text = ""
            J_textFirst.text = ""
            E_textFirst.textColor = .black
            E_textFirst.text = "\(LangArray.E_langArray6[i])"
            self.view.addSubview(E_textFirst)
            J_textFirst.text = "\(LangArray.J_langArray6[i])"
            self.view.addSubview(J_textFirst)
        }
        
    }
    
    //メニューリストボタン押下時の処理
    @objc func List(_ b : UIButton) {
        let storyboard: UIStoryboard = self.storyboard!
        let list = storyboard.instantiateViewController(withIdentifier: "List")
        self.present(list, animated: true, completion: nil)
    }
    
}
