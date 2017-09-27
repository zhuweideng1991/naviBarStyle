//
//  ViewController.swift
//  naviBarStyle
//
//  Created by zhu on 2017/9/27.
//  Copyright © 2017年 alwayslight. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "11"
        //Navigation bar height是140
//        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView = UITableView.init(frame: self.view.bounds)
        view.backgroundColor = .blue
        tableView.backgroundColor = .clear
        navigationItem.leftBarButtonItem = addNavBtn(title: "back")
        navigationItem.rightBarButtonItem = addNavBtn(title: "test")
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addNavBtn(title: String) -> UIBarButtonItem {
        let btn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 44, height: 44))
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return UIBarButtonItem.init(customView: btn)
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "ceshi \(indexPath.row)"
        return cell
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        if offsetY <= 0 {
            let alpha = offsetY / -kTopHeight
            setNavAlpha(alpha: alpha)
        } else {
            setNavAlpha(alpha: 0.0)
        }
    }
    
    func setNavAlpha(alpha: CGFloat) -> Void {
        navigationController?.zh_setBackgroundColor(color: UIColor.red, alpha: alpha)
    }
}

