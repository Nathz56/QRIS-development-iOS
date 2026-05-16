//
//  TransactionHistoryViewController.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//


import UIKit
import SnapKit

final class TransactionHistoryViewController: UIViewController {
    
    private let presenter: TransactionHistoryPresenterProtocol
    private var transactions: [QRData] = []
    
    init(presenter: TransactionHistoryPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TransactionCell")
        tableView.separatorStyle = .singleLine
        tableView.isHidden = true
        return tableView
    }()
    
    private let emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "Belum ada transaksi"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        presenter.viewDidLoad()
    }
    
    private func setupView() {
        title = "Riwayat"
        view.backgroundColor = .white
        
        tableView.dataSource = self
        
        view.addSubview(tableView)
        view.addSubview(emptyLabel)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        emptyLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDataSource
extension TransactionHistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath)
        let transaction = transactions[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = transaction.merchantName
        content.secondaryText = FormatCurrency.format(transaction.amount)
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: - TransactionHistoryViewProtocol
extension TransactionHistoryViewController: TransactionHistoryViewProtocol {
    
    func showTransactions(_ transactions: [QRData]) {
        self.transactions = transactions
        tableView.isHidden = false
        emptyLabel.isHidden = true
        tableView.reloadData()
    }
    
    func showEmpty() {
        tableView.isHidden = true
        emptyLabel.isHidden = false
    }
}
