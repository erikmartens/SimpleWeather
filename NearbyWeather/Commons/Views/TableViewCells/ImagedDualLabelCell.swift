//
//  ImagedDualLabelCell.swift
//  NearbyWeather
//
//  Created by Erik Maximilian Martens on 13.04.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import UIKit

class ImagedDualLabelCell: UITableViewCell {
  
  static let reuseIdentifier = "ImagedDualLabelCell"
  
  private lazy var contentLabel = Factory.Label.make(fromType: .standard)
  private lazy var descriptionLabel = Factory.Label.make(fromType: .description)
  private lazy var leadingImageView = Factory.ImageView.make(fromType: .cellImage)
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    composeCell()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension ImagedDualLabelCell {
  
  func configure(
    withTitle title: String,
    description: String?,
    image: UIImage?,
    imageBackgroundColor: UIColor
  ) {
    contentLabel.text = title
    descriptionLabel.text = description
    leadingImageView.image = image
    leadingImageView.backgroundColor = imageBackgroundColor
  }
}

private extension ImagedDualLabelCell {
  
  func composeCell() {
    contentView.addSubview(leadingImageView, constraints: [
      leadingImageView.heightAnchor.constraint(equalToConstant: Constants.Dimensions.TableCellImageSize.height),
      leadingImageView.widthAnchor.constraint(equalToConstant: Constants.Dimensions.TableCellImageSize.width),
      leadingImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: Constants.Dimensions.TableCellContentInsets.top),
      leadingImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -Constants.Dimensions.TableCellContentInsets.bottom),
      leadingImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Dimensions.TableCellContentInsets.leading),
      leadingImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ])
    
    contentView.addSubview(contentLabel, constraints: [
      contentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.Dimensions.ContentElement.height),
      contentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Dimensions.TableCellContentInsets.top),
      contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.Dimensions.TableCellContentInsets.bottom),
      contentLabel.leadingAnchor.constraint(equalTo: leadingImageView.trailingAnchor, constant: Constants.Dimensions.TableCellContentInsets.interElementXDistance(from: .small)),
      contentLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ])
    
    contentView.addSubview(descriptionLabel, constraints: [
      descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.Dimensions.ContentElement.height),
      descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Dimensions.TableCellContentInsets.top),
      descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.Dimensions.TableCellContentInsets.bottom),
      descriptionLabel.leadingAnchor.constraint(equalTo: contentLabel.trailingAnchor, constant: Constants.Dimensions.TableCellContentInsets.interElementXDistance(from: .small)),
      descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.Dimensions.TableCellContentInsets.trailing),
      descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      descriptionLabel.heightAnchor.constraint(equalTo: contentLabel.heightAnchor, multiplier: 1),
      descriptionLabel.widthAnchor.constraint(equalTo: contentLabel.widthAnchor, multiplier: 1)
    ])
  }
}