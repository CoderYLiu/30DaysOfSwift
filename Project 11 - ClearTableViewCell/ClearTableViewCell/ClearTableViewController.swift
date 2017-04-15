//
//  ClearTableViewController.swift
//  ClearTableViewCell <https://github.com/DeveloperLY/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/17.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

private let ID = "ClearCell"

class ClearTableViewController: UITableViewController {
    
    var tableData = ["当誓言再次复苏", "吞噬暗夜中舞动的黑翅", "是永不停息的黑洞", "亦是未曾沉睡的赤夜", "永无止尽的锁链只是在宣示", "缠绕里不曾见缔的血眸", "是虚幻中无形的鬼魅", "冷艳犹存的心墙不曾有过融化", "得不到救赎的蓝颜", "独自在罪恶的边缘徘徊", "最后一丝晨光被掠夺", "坠入无边黑夜的灵魂", "祈求地上帝并出现", "让灵魂再一次消逝", "燃放烟火的蔷薇", "黑暗中泯灭的心灵", "阳光下消逝的希望", "墨色洗礼的暗色赤魔", "蓝颜中冰冷的血眸独自叹息", "是因为无法因悲伤", "而选择哭泣"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView.rowHeight = 60
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: ID)
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ID, for: indexPath)
        
        cell.textLabel?.text = tableData[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18.0)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = colorforIndex(indexPath.row)
    }
    
    func colorforIndex(_ index: Int) -> UIColor {
        let itemCount = tableData.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
        
    }

}
