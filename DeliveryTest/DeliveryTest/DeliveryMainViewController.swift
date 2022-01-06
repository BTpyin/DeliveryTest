//
//  DeliveryMainViewController.swift
//  DeliveryTest
//
//  Created by Bowie Tso on 6/1/2022.
//

import UIKit

class DeliveryMainViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    lazy var tvMenu: UITableView = {
        let tv = UITableView()
        tv.register(DeliveryMainTableViewCell.self, forCellReuseIdentifier: DeliveryMainTableViewCell.cell)
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .none
        tv.bounces = false
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
        setupBinding()
        initConstraints()
        
    }
    
    func initUI(){
        
    }
    
    func setupBinding() {

    }
    
    func initConstraints() {
        tvMenu.snp.makeConstraints{(maker) in
            maker.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryMainTableViewCell.cell, for: indexPath) as! DeliveryMainTableViewCell
        return cell
    }
}
