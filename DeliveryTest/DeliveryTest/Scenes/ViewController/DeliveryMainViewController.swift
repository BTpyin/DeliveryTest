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
    lazy var refreshBtn : UIButton = {
        
        let btn = UIButton()
        btn.setTitle("Refresh", for: .normal)
        btn.setTitleColor(UIColor.gray, for: .normal)
        btn.addTarget(self, action: #selector(refreshBtnClicked(_:)), for: .touchUpInside)
        return btn
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = DeliveryMainViewModel()
        viewModel?.syncDelivery(start: 0, limit: 10, completed: {_ in
            self.viewModel?.fetchDeliveryFromRealm()
            
        })
        // Do any additional setup after loading the view.
        initUI()
        setupNavBar()
        setupBinding()
        initConstraints()
        
    }
    
    func initUI(){
        self.view.addSubviews(refreshBtn, tvMenu)
        self.view.backgroundColor = .white
    }
    
    func setupBinding() {
        viewModel?.output.deliveryListRelay.subscribe(onNext:{[weak self]_ in
            self?.tvMenu.reloadData()
        }).disposed(by: disposeBag)
    }
    
    func initConstraints() {
        
        refreshBtn.snp.makeConstraints{(maker) in
            maker.top.leading.equalToSuperview().offset(10)
            maker.trailing.equalToSuperview().inset(10)
        }
        
        tvMenu.snp.makeConstraints{(maker) in
            maker.top.equalTo(refreshBtn.snp.bottom).offset(10)
            maker.leading.equalToSuperview().offset(10)
            maker.trailing.bottom.equalToSuperview().inset(10)
        }
        
        
    }
    
    func setupNavBar(){
        navigationItem.title = "DeliveryList"
        navigationItem.setRightBarButton(UIBarButtonItem(image:UIImage.init(systemName: "arrow.clockwise"), style: .plain, target: .none, action: #selector(refreshClicked)), animated: false)
    }
    
    @objc func refreshClicked(){

    }
    
    @IBAction func refreshBtnClicked(_ sender: UIButton) {
        viewModel?.syncDelivery(start: 0, limit: 10, completed: { [weak self]_ in
            self?.viewModel?.fetchDeliveryFromRealm()
        })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DeliveryDetailViewController()
        guard let delivery = viewModel?.output.deliveryListRelay.value[indexPath.row] else{return}
        detailVC.viewModel = DeliveryDetailViewModel(delivery: delivery)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.output.deliveryListRelay.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryMainTableViewCell.cell, for: indexPath) as? DeliveryMainTableViewCell else {
            fatalError("The dequeued cell is not an instance of DeliveryMainTableViewCell.")
          }
        guard let delivery = viewModel?.output.deliveryListRelay.value[indexPath.row] else {return cell}
        cell.uiBind(delivery: delivery)
        return cell
    }
}
