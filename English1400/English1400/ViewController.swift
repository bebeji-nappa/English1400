//
//  ViewController.swift
//  English1400
//
//  Created by 梁川 将和 on 2018/02/19.
//  Copyright © 2018年 Yanagawa Masakazu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //ディスプレイサイズ取得
    let w = UIScreen.main.bounds.size.width
    let h = UIScreen.main.bounds.size.height
    override func viewDidLoad() {
        super.viewDidLoad()
        //背景色
        let back = UIImageView(image: UIImage(named: "back2"))
        back.frame =  CGRect(x: 0, y: 0, width: w, height: h)
        view.addSubview(back)
        
        //タイトル
        let mainTitle = UIImageView(image: UIImage(named: "title2"))
        mainTitle.frame =  CGRect(x: (w - 350) / 2, y: 200, width: 350, height: 170)
        view.addSubview(mainTitle)
        
        //はじめるボタン
        let start = UIButton(frame: CGRect(x: (w - 300) / 2, y: 480, width: 300, height: 50))
        start.backgroundColor = UIColor.rgb(r: 255, g: 189, b: 35, a: 1.0)
        start.layer.cornerRadius = 15.0
        start.setTitle("はじめる", for: UIControlState())
        start.setTitleColor(.white, for: UIControlState())
        start.addTarget(self, action: #selector(ViewController.StartButton(_:)), for: .touchUpInside)
        view.addSubview(start)
        
        //CopyLight
        let copylight = UILabel(frame: CGRect(x: (w - 200) / 2, y: h - 30, width: 200, height: 20))
        copylight.text = "©︎ 2018 英単語Basic1400"
        copylight.font = UIFont.systemFont(ofSize: CGFloat(12))
        copylight.textAlignment = .center
        copylight.textColor = .black
        view.addSubview(copylight)
        
    }
    
    //はじめるボタン押下時の処理(暗記ページに遷移)
    @objc func StartButton(_ b: UIButton) {
        let storyboard: UIStoryboard = self.storyboard!
        let second = storyboard.instantiateViewController(withIdentifier: "List")
        present(second, animated: true, completion: nil)
    }
}

//RGBAカラーコード処理
extension UIColor {
    class func rgb(r: Int, g: Int, b: Int, a: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: a)
    }
}
