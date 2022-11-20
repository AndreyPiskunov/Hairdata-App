//
//  TitleSubtitleCell.swift
//  HairData
//
//  Created by Andrey Piskunov on 16.11.2022.
//

import UIKit

final class TitleSubtitleCell: UITableViewCell {
    //MARK: - Properties
    
    private let titleLabel = UILabel()
    let subtitleTextField = UITextField()
    private let verticalStackView = UIStackView()
    private let indents: CGFloat = 20
    private let photoImageView = UIImageView()
    
    private let dataPickerView = UIDatePicker()
    private let toolBar = UIToolbar(frame: .init(x: 0, y: 0, width: 100, height: 100))
    lazy var doneButton: UIBarButtonItem = { UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tappedDone))
    }()
    private var viewModel: TitleSubtitleCellViewModel?
                                                            
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Methods
    
    func update(with viewModel: TitleSubtitleCellViewModel) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        subtitleTextField.text = viewModel.subtitle
        subtitleTextField.placeholder = viewModel.placeholder
        subtitleTextField.inputView = viewModel.type == .text ? nil : dataPickerView
        subtitleTextField.inputAccessoryView = viewModel.type == .text ? nil : toolBar
        
        photoImageView.isHidden = viewModel.type != .image
        subtitleTextField.isHidden = viewModel.type == .image
        
        photoImageView.image = viewModel.image
        
        verticalStackView.spacing = viewModel.type == .image ? 15 : verticalStackView.spacing
    }
    
    func setupViews() {
        verticalStackView.axis = .vertical
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        subtitleTextField.font = .systemFont(ofSize: 20, weight: .medium)
        
        [verticalStackView, titleLabel, subtitleTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }//converting dimensions into constraints
        
        toolBar.setItems([doneButton], animated: false)
        dataPickerView.datePickerMode = .date
        if #available(iOS 13.4, *) {
            dataPickerView.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        photoImageView.backgroundColor = .black.withAlphaComponent(0.4)
        photoImageView.layer.cornerRadius = 10
    }
    
    func setupHierarchy() {
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subtitleTextField)
        verticalStackView.addArrangedSubview(photoImageView)
        
    }
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: indents),
            verticalStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: indents),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -indents),
            verticalStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -indents)
        ])
        
        photoImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
                                             
    @objc private func tappedDone(){
        viewModel?.update(dataPickerView.date)
    }
}
