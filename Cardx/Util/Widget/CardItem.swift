//
//  CardItem.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import UIKit

protocol CardItemOptionsDelegate {
    func languageSelected()
    func categorySelected()
    func difficultySelected()
}

protocol CardItemDifficultyDelegate {
    func flip()
    func difficultySelected(difficultyIndex: Int)
}

class CardItem: UIView {
    
    var isOpen: Bool = false
    
    let cardView: CardView = {
        let cardView = CardView(frame: .zero)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = .systemBackground
        return cardView
    }()
    let languageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Language", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    let categoryButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Category", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    let difficultyButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Difficulty", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    let textToTranslate: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Text to translate"
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        return textField
    }()
    let translation: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Translation"
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        return textField
    }()
    let mainLayout: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 10
        return stack
    }()
    let topView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        return stack
    }()
    let textLayout: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    let difficultyLayout: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    let tryAgainButton: UIButton = {
        var config: UIButton.Configuration = .filled()
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 12)
            return outgoing
        }
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Try again", for: .normal)
        button.setTitleColor(.label, for: .normal)
        
        return button
    }()
    let easyButton: UIButton = {
        var config: UIButton.Configuration = .gray()
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 12)
            return outgoing
        }
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Easy", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    let mediumButton: UIButton = {
        var config: UIButton.Configuration = .borderedTinted()
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 12)
            return outgoing
        }
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Medium", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    let hardButton: UIButton = {
        var config: UIButton.Configuration = .filled()
        config.baseBackgroundColor = .systemBlue.withAlphaComponent(0.75)
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 12)
            return outgoing
        }
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Hard", for: .normal)
        button.setTitleColor(.label, for: .normal)
        
        return button
    }()
    
    let flipButton: UIButton = {
        var config: UIButton.Configuration = .borderedTinted()
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 12)
            return outgoing
        }
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Flip", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.tintColor = .systemBlue
        
        return button
    }()
    
    private var card: Card? = nil
    private var optionsDelegate: CardItemOptionsDelegate? = nil
    private var difficultyDelegate: CardItemDifficultyDelegate? = nil
    init(card: Card?, optionsDelegate: CardItemOptionsDelegate? = nil, difficultyDelegate: CardItemDifficultyDelegate? = nil) {
        super.init(frame: .zero)
        
        self.optionsDelegate = optionsDelegate
        self.difficultyDelegate = difficultyDelegate
        
        setupCardViewWithDelegates(optionsDelegate: optionsDelegate, difficultyDelegate: difficultyDelegate)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        setupView()
        
        guard let card = card else { return }
        self.card = card
        setupCard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardItem {
    private func setListeners() {
        languageButton.addTarget(self, action: #selector(selectLanguage), for: .touchUpInside)
        categoryButton.addTarget(self, action: #selector(selectCategory), for: .touchUpInside)
        difficultyButton.addTarget(self, action: #selector(selectDifficulty), for: .touchUpInside)
        flipButton.addTarget(self, action: #selector(flip), for: .touchUpInside)
        tryAgainButton.addTarget(self, action: #selector(selectTryAgain), for: .touchUpInside)
        hardButton.addTarget(self, action: #selector(selectHard), for: .touchUpInside)
        mediumButton.addTarget(self, action: #selector(selectMedium), for: .touchUpInside)
        easyButton.addTarget(self, action: #selector(selectEasy), for: .touchUpInside)
    }
    
    @objc
    private func selectLanguage() {
        //print(_tag, "selectLanguage")
        optionsDelegate?.languageSelected()
    }
    @objc
    private func selectCategory() {
        //print(_tag, "selectCategory")
        optionsDelegate?.categorySelected()
    }
    @objc
    private func selectDifficulty() {
        //print(_tag, "selectDifficulty")
        optionsDelegate?.difficultySelected()
    }
    @objc
    private func flip(sender: UIButton) {
        isOpen.toggle()
        toFlip(isOpen: isOpen)
    }
    @objc
    private func selectTryAgain() {
        //print(_tag, "selectTryAgain")
        difficultyDelegate?.difficultySelected(difficultyIndex: CardDifficultyId.TRY_AGAING.rawValue)
    }
    @objc
    private func selectHard() {
        //print(_tag, "selectHard")
        difficultyDelegate?.difficultySelected(difficultyIndex: CardDifficultyId.HARD.rawValue)
    }
    @objc
    private func selectMedium(sender: UIButton) {
        print(_tag, "selectMedium")
        difficultyDelegate?.difficultySelected(difficultyIndex: CardDifficultyId.MEDIUM.rawValue)
    }
    @objc
    private func selectEasy() {
        //print(_tag, "selectEasy")
        difficultyDelegate?.difficultySelected(difficultyIndex: CardDifficultyId.EASY.rawValue)
    }
}

extension CardItem {
    
    func getCardItem() -> UIView {
        return self
    }
    
    private func toFlip(isOpen: Bool) {
        let animation: UIView.AnimationOptions = isOpen ? .transitionFlipFromLeft : .transitionFlipFromRight
        UIView.transition(with: cardView, duration: 0.3, options: animation, animations: nil, completion: nil)

        setVisibility(isOpen: isOpen)
    }
    
    private func setupCard() {
        
        guard let card = card else { return }
        
        languageButton.setTitle(card.language.name, for: .normal)
        difficultyButton.setTitle(card.difficulty.name.rawValue, for: .normal)
        categoryButton.setTitle(card.category.name, for: .normal)
        textToTranslate.text = card.toTranslate
        translation.text = card.translation
    }
    
    private func setVisibility(isOpen: Bool) {
        translation.isHidden = !isOpen
        textToTranslate.isHidden = isOpen
    }
}

extension CardItem {
    private func setFont() {
        tryAgainButton.setFontSize()
        hardButton.setFontSize()
        mediumButton.setFontSize()
        easyButton.setFontSize()
        languageButton.setFontSize()
        difficultyButton.setFontSize()
        categoryButton.setFontSize()
        flipButton.setFontSize()
        textToTranslate.setFontSize()
        translation.setFontSize()
    }
}

extension CardItem {
    
    private func setupView() {
        
        topView.addArrangedSubview(languageButton)
        topView.addArrangedSubview(difficultyButton)
        
        textLayout.addArrangedSubview(textToTranslate)
        textLayout.addArrangedSubview(translation)
        
        difficultyLayout.addArrangedSubview(tryAgainButton)
        difficultyLayout.addArrangedSubview(hardButton)
        difficultyLayout.addArrangedSubview(mediumButton)
        difficultyLayout.addArrangedSubview(easyButton)
        
        mainLayout.addArrangedSubview(topView)
        mainLayout.addArrangedSubview(categoryButton)
        mainLayout.addArrangedSubview(textLayout)
        mainLayout.addArrangedSubview(flipButton)
        mainLayout.addArrangedSubview(difficultyLayout)
        
        cardView.addSubview(mainLayout)
        self.addSubview(cardView)
        
        setFont()
        setListeners()
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            mainLayout.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10.0),
            mainLayout.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10.0),
            mainLayout.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 5.0),
            mainLayout.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -5.0),
            
            //topView.topAnchor.constraint(equalTo: mainLayout.topAnchor),
            topView.leadingAnchor.constraint(equalTo: mainLayout.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: mainLayout.trailingAnchor),
            //topView.bottomAnchor.constraint(equalTo: categoryButton.topAnchor),
            
            //languageButton.topAnchor.constraint(equalTo: topView.topAnchor),
            //languageButton.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
            //languageButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            //
            //difficultyButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            //difficultyButton.topAnchor.constraint(equalTo: topView.topAnchor),
            //difficultyButton.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
            
            //categoryButton.centerXAnchor.constraint(equalTo: mainLayout.centerXAnchor),
            //categoryButton.topAnchor.constraint(equalTo: topView.bottomAnchor),
            //categoryButton.leadingAnchor.constraint(equalTo: mainLayout.leadingAnchor),
            //categoryButton.trailingAnchor.constraint(equalTo: mainLayout.trailingAnchor),
            //categoryButton.bottomAnchor.constraint(equalTo: textLayout.topAnchor),
            //
            textLayout.leadingAnchor.constraint(equalTo: mainLayout.leadingAnchor),
            textLayout.trailingAnchor.constraint(equalTo: mainLayout.trailingAnchor),
            //textLayout.bottomAnchor.constraint(equalTo: flipButton.topAnchor),
            //
            //flipButton.centerXAnchor.constraint(equalTo: mainLayout.centerXAnchor),
            //flipButton.bottomAnchor.constraint(equalTo: difficultyLayout.topAnchor),
            //
            difficultyLayout.leadingAnchor.constraint(equalTo: mainLayout.leadingAnchor),
            difficultyLayout.trailingAnchor.constraint(equalTo: mainLayout.trailingAnchor),
            //difficultyLayout.bottomAnchor.constraint(equalTo: topAnchor),
            //
            //textToTranslate.centerXAnchor.constraint(equalTo: textLayout.centerXAnchor),
            //textToTranslate.centerYAnchor.constraint(equalTo: textLayout.centerYAnchor),
            //translation.centerXAnchor.constraint(equalTo: textLayout.centerXAnchor),
            //translation.centerYAnchor.constraint(equalTo: textLayout.centerYAnchor),
            //
            //tryAgainButton.topAnchor.constraint(equalTo: difficultyLayout.topAnchor),
            //tryAgainButton.bottomAnchor.constraint(equalTo: difficultyLayout.bottomAnchor),
            //tryAgainButton.leadingAnchor.constraint(equalTo: difficultyLayout.leadingAnchor),
            //tryAgainButton.trailingAnchor.constraint(equalTo: hardButton.leadingAnchor),
            //
            //hardButton.topAnchor.constraint(equalTo: difficultyLayout.topAnchor),
            //hardButton.bottomAnchor.constraint(equalTo: difficultyLayout.bottomAnchor),
            //hardButton.trailingAnchor.constraint(equalTo: mediumButton.leadingAnchor),
            //
            //mediumButton.topAnchor.constraint(equalTo: difficultyLayout.topAnchor),
            //mediumButton.bottomAnchor.constraint(equalTo: difficultyLayout.bottomAnchor),
            //mediumButton.trailingAnchor.constraint(equalTo: easyButton.leadingAnchor),
            //
            //easyButton.topAnchor.constraint(equalTo: difficultyLayout.topAnchor),
            //easyButton.bottomAnchor.constraint(equalTo: difficultyLayout.bottomAnchor),
            //easyButton.trailingAnchor.constraint(equalTo: difficultyLayout.leadingAnchor),
            
        ])
    }
}

extension CardItem {
    
    private func setupCardViewWithDelegates(optionsDelegate: CardItemOptionsDelegate?, difficultyDelegate: CardItemDifficultyDelegate?) {
        
        if let _ = optionsDelegate {
            difficultyLayout.isHidden = true
            flipButton.isHidden = true
        }
        
        if let _ = difficultyDelegate {
            translation.isHidden = isOpen
            textToTranslate.isHidden = !isOpen
            languageButton.isEnabled = false
            categoryButton.isEnabled = false
            difficultyButton.isEnabled = false
            
            difficultyLayout.isHidden = isOpen
            flipButton.isHidden = isOpen
        }
        
        if optionsDelegate == nil && difficultyDelegate == nil {
            textToTranslate.isEnabled = false
            translation.isEnabled = false
            textToTranslate.isHidden = isOpen
            translation.isHidden = !isOpen
        }
    }
}
