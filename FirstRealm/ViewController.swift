//
//  ViewController.swift
//  FirstRealm
//
//  Created by 香川紗穂 on 2019/07/30.
//  Copyright © 2019 香川紗穂. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var textField: UITextField!
    
//   ② テーブルに表示するデータを保持した配列
    var items: [Item] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
//        ⑤Realm からItemを全件取得する
        let realm = try! Realm()
//        レルムの中から、アイテムクラスを全件とってくるって意味
        items = realm.objects(Item.self).reversed()
        
//        ⑥おまじない
        tableView.delegate = self
        tableView.dataSource = self
    }

//
    @IBAction func addItem(_ sender: UIButton) {
//       ④ 新しいItemクラス(インスタンスを作成）を作成
        let item = Item()
//        Itemクラスに入力されたタイトルを設定
         item.title = textField.text
//        Realmに保存する  定型文！！（item)のところが毎回変わるだけ。
        let realm = try! Realm()
        try! realm.write {
            realm.add(item)
        }
        
//        ⑦最新のアイテム一覧を取得
        items = realm.objects(Item.self).reversed()
//        テーブルを更新
        tableView.reloadData()
        
//        テキストフィールドをからにする
        textField.text = ""

    }
    
}
//③
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        表示するItemクラスを取得
        let item = items[indexPath.row]
//        セルのラベルにItemクラスのタイトルを設定
        cell.textLabel?.text = item.title
        
        return cell
    }
    
    
}
