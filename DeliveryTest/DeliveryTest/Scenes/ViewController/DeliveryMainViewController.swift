//
//  DeliveryMainViewController.swift
//  DeliveryTest
//
//  Created by Bowie Tso on 6/1/2022.
//

import UIKit

class DeliveryMainViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var viewModel: DeliveryMainViewModel?
    
    lazy var tvMenu: UITableView = {
        let tv = UITableView()
        tv.register(DeliveryMainTableViewCell.self, forCellReuseIdentifier: DeliveryMainTableViewCell.cell)
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .none
        tv.bounces = false
        tv.backgroundColor = .white
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = DeliveryMainViewModel()
        viewModel?.syncDelivery(start: 0, limit: 10, completed: nil)
        // Do any additional setup after loading the view.
        initUI()
        setupNavBar()
        setupBinding()
        initConstraints()
        
    }
    
    func initUI(){
        self.view.addSubview(tvMenu)
        self.view.backgroundColor = .white
    }
    
    func setupBinding() {
        viewModel?.output.deliveryListRelay.subscribe(onNext:{[weak self]_ in
            self?.tvMenu.reloadData()
        }).disposed(by: disposeBag)
    }
    
    func initConstraints() {
        tvMenu.snp.makeConstraints{(maker) in
            maker.top.leading.equalToSuperview().offset(10)
            maker.trailing.bottom.equalToSuperview().inset(10)
        }
    }
    
    func setupNavBar(){
        navigationItem.title = "DeliveryList"
        navigationItem.setRightBarButton(UIBarButtonItem(image:UIImage.init(systemName: "arrow.clockwise"), style: .plain, target: .none, action: #selector(refreshClicked)), animated: false)
    }
    
    @objc func refreshClicked(){
        viewModel?.syncDelivery(start: 0, limit: 10, completed: { [weak self]_ in
            self?.viewModel?.fetchDeliveryFromRealm()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.output.deliveryListRelay.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryMainTableViewCell.cell, for: indexPath) as! DeliveryMainTableViewCell
        cell.uiBind(delivery: viewModel?.output.deliveryListRelay.value[indexPath.row] ?? DeliveriesObject())
        return cell
    }
}
