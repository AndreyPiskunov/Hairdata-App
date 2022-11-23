//
//  EventCell.swift
//  HairData
//
//  Created by Andrey Piskunov on 20.11.2022.
//

import UIKit

final class EventCell: UITableViewCell {
    
    private let timeRemainingLabels = [UILabel(), UILabel(), UILabel(), UILabel()]
    private let dateLabel = UILabel()
    private let nameEventLabel = UILabel()
    private let eventImageView = UIImageView()
    private let verticalStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupHierarhy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        (timeRemainingLabels + [dateLabel, nameEventLabel, eventImageView, verticalStackView]).forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        timeRemainingLabels.forEach {
            $0.font = .systemFont(ofSize: 25, weight: .medium)
            $0.textColor = .white
        }
        
        dateLabel.font = .systemFont(ofSize: 20, weight: .medium)
        dateLabel.textColor = .white
        
        nameEventLabel.font = .systemFont(ofSize: 30, weight: .bold)
        nameEventLabel.textColor = .white
        
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .trailing
    }

    private func setupHierarhy(){
        contentView.addSubview(eventImageView)
        contentView.addSubview(verticalStackView)
        contentView.addSubview(nameEventLabel)
        
        timeRemainingLabels.forEach {
            verticalStackView.addArrangedSubview($0)
        }
        
        verticalStackView.addArrangedSubview(UIView())
        verticalStackView.addArrangedSubview(dateLabel)
    }
    
    private func setupLayout(){
        eventImageView.pinToSuperViewEdges([.left,.top,.right])
        let bottomConstraint = eventImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        bottomConstraint.priority = .required - 1
        bottomConstraint.isActive = true
        
        eventImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        verticalStackView.pinToSuperViewEdges([.top, .right, .bottom], constant: 15)
        nameEventLabel.pinToSuperViewEdges([.bottom, .left], constant: 15)
    }
    
    func update(with viewModel: EventCellViewModel) {
        
        viewModel.timeRemainingStrings.enumerated().forEach {
            timeRemainingLabels[$0.offset].text = $0.element
        }
        
        dateLabel.text = viewModel.dateText
        nameEventLabel.text = viewModel.nameEventText
        
        viewModel.loadImage { image in
            self.eventImageView.image = image
        }
    }
}
