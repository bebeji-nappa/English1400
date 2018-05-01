//
//  ListViewController.swift
//  English1400
//
//  Created by 梁川 将和 on 2018/02/19.
//  Copyright © 2018年 Yanagawa Masakazu. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //ディスプレイサイズを取得
    let w = UIScreen.main.bounds.size.width
    let h = UIScreen.main.bounds.size.height
    
    //ページ遷移用の配列
    let unit = ["Section1", "Section2", "Section3", "Section4", "Section5", "Section6", "Section7",
                "Section8", "Section9", "Section10", "Section11", "Section12", "Section13", "Section14"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //メニューリスト
        let tv = UITableView(frame: CGRect(x: 0, y: 40, width: w, height: h - 200), style: .plain)
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Q")
        tv.delegate = self
        tv.dataSource = self
        view.addSubview(tv)
        
        //トップへ戻るボタン
        let lb = UIButton(frame: CGRect(x: (w - 200) / 2, y: h - 100, width: 200, height: 50))
        lb.backgroundColor = UIColor.rgb3(r: 255, g: 189, b: 35, a: 1.0)
        lb.setTitle("トップへ戻る", for: UIControlState())
        lb.setTitleColor(.white, for: UIControlState())
        lb.layer.cornerRadius = 15.0
        lb.addTarget(self, action: #selector(goTop), for: .touchUpInside)
        view.addSubview(lb)
    }
    
    
    //リストページの処理
    //リストの項目を押下時に、ページ遷移を行う
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = self.storyboard!
        let main = storyboard.instantiateViewController(withIdentifier: unit[indexPath.row])
        present(main, animated: true, completion: nil)
    }
    
    //項目(セル)の行数を格納
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return unit.count
    }
    
    //上部のタイトルを表示
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "英単語リスト"
    }
    
    //表示する項目(セル)の内容を返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let c = UITableViewCell(style: .default, reuseIdentifier: "Q")
        c.textLabel!.text = unit[indexPath.row]
        return c
    }
    
    //トップへ戻るボタンを押下時の処理
    @objc func goTop(_ b: UIButton) {
        let storyboard: UIStoryboard = self.storyboard!
        let main = storyboard.instantiateViewController(withIdentifier: "Main")
        present(main, animated: true, completion: nil)
    }
}


extension UIColor {
    class func rgb3(r: Int, g: Int, b: Int, a: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: a)
    }
}
