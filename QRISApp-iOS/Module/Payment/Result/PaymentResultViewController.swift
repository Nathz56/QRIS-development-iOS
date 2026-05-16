//
//  PaymentResultViewController.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//

import UIKit
import SnapKit

final class PaymentResultViewController: UIViewController {
    
    private let presenter: PaymentResultPresenterProtocol
    
    init(presenter: PaymentResultPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let iconLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 64)
        label.textAlignment = .center
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let merchantLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .systemBlue
        label.textAlignment = .center
        return label
    }()
    
    private let remainingBalanceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    private let doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Selesai", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 12
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        setupAction()
        presenter.viewDidLoad()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        
        view.addSubview(iconLabel)
        view.addSubview(statusLabel)
        view.addSubview(merchantLabel)
        view.addSubview(amountLabel)
        view.addSubview(remainingBalanceLabel)
        view.addSubview(doneButton)
    }
    
    private func setupLayout() {
        iconLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(80)
        }
        
        statusLabel.snp.makeConstraints {
            $0.top.equalTo(iconLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        merchantLabel.snp.makeConstraints {
            $0.top.equalTo(statusLabel.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
        }
        
        amountLabel.snp.makeConstraints {
            $0.top.equalTo(merchantLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        
        remainingBalanceLabel.snp.makeConstraints {
            $0.top.equalTo(amountLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        doneButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-24)
            $0.height.equalTo(56)
        }
    }
    
    private func setupAction() {
        doneButton.addTarget(self, action: #selector(tappedDoneButton), for: .touchUpInside)
    }
    
    @objc
    private func tappedDoneButton() {
        presenter.didTapDone()
    }
}

extension PaymentResultViewController: PaymentResultViewProtocol {
    
    func showSuccess(transaction: QRData, remainingBalance: Int) {
        title = "Pembayaran Berhasil"
        iconLabel.text = "✅"
        statusLabel.text = "Pembayaran Berhasil"
        merchantLabel.text = transaction.merchantName
        amountLabel.text = FormatCurrency.format(transaction.amount)
        remainingBalanceLabel.text = "Sisa saldo: \(FormatCurrency.format(remainingBalance))"
    }
    
    func showFailed() {
        title = "Pembayaran Gagal"
        iconLabel.text = "❌"
        statusLabel.text = "Pembayaran Gagal"
        statusLabel.textColor = .systemRed
        merchantLabel.text = "Saldo tidak cukup"
        doneButton.backgroundColor = .systemRed
    }
}
