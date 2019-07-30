//
//  Item.swift
//  FirstRealm
//
//  Created by 香川紗穂 on 2019/07/30.
//  Copyright © 2019 香川紗穂. All rights reserved.
//

//import Foundation
//①
import RealmSwift

//エクセルでitemというシートを作成するイメージ
//Objectを継承すること
class Item: Object{
//    タイトルを保存する列のイメージ
    @objc dynamic var title: String?
    
//    登録日時を保存する列のイメージ
     @objc dynamic var created = Date()
}
