//
//  Colors.swift
//  Romance Kingdom
//
//  Created by e.nesterov on 18.11.2022.
//

import UIKit


enum DesignSystemColors {
    // MARK: Main color scheme
    static let black_alpha30: UIColor = UIColor.black.withAlphaComponent(0.3) //Полупрозрачный черный
    static let black_alpha50: UIColor = UIColor.black.withAlphaComponent(0.5) //Полупрозрачный черный
    static let black_alpha70: UIColor = UIColor.black.withAlphaComponent(0.7) //Полупрозрачный черный
    static let black_alpha0: UIColor = UIColor.black //Черный
    //static let commonRed: UIColor = UIColor(hex: "#C22135") ?? UIColor() //Красный
    static let commonRed: UIColor = .red //Красный
    static let darkRed: UIColor = .red //Очень темно-красный
    static let darkRed2: UIColor = .red //Темно-красный
    static let orange: UIColor = .orange // Оранжевый
    static let golden: UIColor = .orange // Золотой
    static let golden2: UIColor = .orange // Светло-Золотой
    static let silver: UIColor = .white // Серебряный
    
    
    // MARK: Semantic colors
    // MARK: DSProgressBar
    static let progressBar_BackgroundColor: UIColor = darkRed
    static let progressBar_ProgressColor: UIColor = orange
    static let progressBar_TitleColor: UIColor = golden2
    
    // MARK: DSButton
    static let mainButtonColor: UIColor = darkRed
    static let mainButtonHighlightColor: UIColor = .blue
    static let mainButtonTextColor: UIColor = orange
    static let mainBorderColor: UIColor = orange
    
    static let secondaryButtonColor: UIColor = orange
    static let secondaryButtonHighlightColor: UIColor = golden
    static let secondaryButtonTextColor: UIColor = darkRed
    static let secondaryBorderColor: UIColor = orange
    
    static let transparentButtonColor: UIColor = .clear
//    static let transparentButtonHighlightColor: UIColor = UIColor(hex: "#460007") ?? UIColor()
    static let transparentButtonTextColor: UIColor = orange
    static let transparentBorderColor: UIColor = .clear
    
    // MARK: DSImageButton
    static let imageButton_defaultImageColor: UIColor = orange
    static let imageButton_highlightedImageColor: UIColor = golden
    
    // MARK: DSLabel
    static let mainLabelColor: UIColor = orange
    
    // MARK: DSRibbonView
    static let ribbonView_bgColor: UIColor = golden
    static let ribbonView_bgColor2: UIColor = golden2
    static let ribbonView_titleColor: UIColor = darkRed
    
    // MARK: DSTabBarItem
    static let tabBarItem_defaultTitleColor: UIColor = orange
    static let tabBarItem_defaultIconColor: UIColor = orange
    static let tabBarItem_defaultSelectorColor: UIColor = orange
    static let tabBarItem_selectedTitleColor: UIColor = golden
    static let tabBarItem_selectedIconColor: UIColor = golden
    static let tabBarItem_selectedSelectorColor: UIColor = golden
    static let tabBarItem_defaultBackgroundColor: UIColor = darkRed
    
    // MARK: DSCustomNavBar
    static let customNavBar_BackgroundColor: UIColor = darkRed
    static let customNavBar_TitleColor: UIColor = orange
    static let customNavBar_TopSeparatorColor: UIColor = golden
    
    // MARK: DSLockView
    static let lockView_BackgroundColor: UIColor = black_alpha50
    static let lockView_ImageColorAlert: UIColor = commonRed
    static let lockView_ImageColorWarning: UIColor = golden2
    
    // MARK: DSRoundedView
    static let roundedView_BackgroundColor: UIColor = orange
    static let roundedView_BackgroundSelectedColor: UIColor = golden
    static let roundedView_ImageColor: UIColor = darkRed
    static let roundedView_TextColor: UIColor = .black
    
    // MARK: DSCollectionPagingFooterView
    static let pagingFooterView_PinColor: UIColor = orange
    static let pagingFooterView_SelectedPinColor: UIColor = golden2
    
    // MARK: AlertViewController
    static let alert_BackgroundScreenColor: UIColor = black_alpha70
    static let alert_BorderColor: UIColor = orange
    static let alert_BackgroundColor: UIColor = darkRed
    
    // MARK: SplashScreenViewController
    static let splashScreen_BackgroundColor: UIColor = darkRed
    static let splashScreen_ImageTintColor: UIColor = orange
    static let splashScreen_ImageShadowColor: UIColor = orange
    
    // MARK: LanguageSelectViewController
    static let languageSelect_BackgroundScreenColor: UIColor = black_alpha70
    static let languageSelect_BorderColor: UIColor = orange
    static let languageSelect_BackgroundColor: UIColor = darkRed
    
    // MARK: LanguageSelectView
    static let languageSelectView_BorderColor: UIColor = orange
    static let languageSelectView_ShadowColor: UIColor = orange
    static let languageSelectView_BackgroundColor: UIColor = darkRed
    
    // MARK: MainScreenViewController
    static let mainScreen_BackgroundColor: UIColor = darkRed
    static let mainScreen_TopSeparatorColor: UIColor = golden
    
    // MARK: ProfileScreenViewController
    static let profile_BackgroundColor: UIColor = darkRed
    
    // MARK: ShopViewController
    static let shop_BackgroundColor: UIColor = darkRed
    
    // MARK: ProfileAchievementCollectionViewCell
    static let profileAchievementCell_BackgroundColor: UIColor = darkRed2
    static let profileAchievementCell_ShadowColor: UIColor = golden
    static let profileAchievementCell_FontColor: UIColor = golden
    static let profileAchievementCell_ImageColor: UIColor = golden
    
    // MARK: ProfileUserCollectionViewCell
    static let profileUserCell_BackgroundColor: UIColor = darkRed
    static let profileUserCell_ShadowColor: UIColor = black_alpha50
    static let profileUserCell_emailColor: UIColor = golden
    static let profileUserCell_emailTitleColor: UIColor = golden
    
    // MARK: AchievementDetailsViewController
    static let achievementDetails_BackgroundScreenColor: UIColor = black_alpha70
    static let achievementDetails_BorderColor: UIColor = orange
    static let achievementDetails_BackgroundColor: UIColor = darkRed
    static let achievementDetails_TextColor: UIColor = golden
    static let achievementDetails_DescriptionColor: UIColor = golden
    static let achievementDetails_ImageColor: UIColor = golden
    
    // MARK: Novels
    static let novels_BackgroundColor: UIColor = darkRed
    
    // MARK: Partners
    static let partners_BackgroundColor: UIColor = darkRed
    
    // MARK: Novel Details
    static let novelDetals_BackgroundScreenColor: UIColor = black_alpha70
    static let novelDetals_BorderColor: UIColor = orange
    static let novelDetals_BackgroundColor: UIColor = darkRed
    
    // MARK: NovelsFeaturedCell
    static let novelsFeaturedCell_BackgroundTextColor: UIColor = black_alpha50
    static let novelsFeaturedCell_BorderColor: UIColor = golden
    static let novelsFeaturedCell_BorderShadowColor: UIColor = golden
    static let novelsFeaturedCell_TextColor: UIColor = golden
    
    // MARK: NovelsFilterCell
    static let novelsFilterCell_BackgroundColor: UIColor = orange
    static let novelsFilterCell_BackgroundSelectedColor: UIColor = golden
    static let novelsFilterCell_TextColor: UIColor = darkRed
    static let novelsFilterCell_BorderShadowColor: UIColor = black_alpha50
    
    // MARK: NovelsCommonCell
    static let novelsCommonCell_TextColor: UIColor = golden
    static let novelsCommonCell_ImageFrameColor: UIColor = golden
    static let novelsCommonCell_FavButtonColorDeselected: UIColor = golden
    static let novelsCommonCell_FavButtonColorSelected: UIColor = golden2
    
    // MARK: PartnersScreenCell
    static let partnersScreenCell_TextColor: UIColor = golden
    static let partnersScreenCell_ImageFrameColor: UIColor = golden
    static let partnersScreenCell_FavButtonColorDeselected: UIColor = golden
    static let partnersScreenCell_FavButtonColorSelected: UIColor = golden2
    
    // MARK: NovelDetailsHeaderCell
    static let novelDetailsHeaderCell_BackgroundColor: UIColor = darkRed
    static let novelDetailsHeaderCell_LangStackBGColor: UIColor = black_alpha30
    
    // MARK: NovelDetailsChapterCell
    static let novelDetailsChapterCell_BackgroundColor: UIColor = darkRed
    static let novelDetailsChapterCell_NonReadColor: UIColor = orange
    static let novelDetailsChapterCell_InProgressReadColor: UIColor = golden2
    static let novelDetailsChapterCell_FutureReadColor: UIColor = silver
    
    // MARK: NovelDetailsChapterCell
    static let gameEngine_Intro_DialogFontColor: UIColor = golden2
    static let gameEngine_Intro_BackgroundColor: UIColor = black_alpha30
    
    static let gameEngine_CharacterSelection_DialogFontColor: UIColor = golden2
    static let gameEngine_CharacterSelection_BackgroundColor: UIColor = black_alpha50
    static let gameEngine_CharacterSelection_ButtonsColor: UIColor = orange
    
    static let gameEngine_CharacterSelection_FinalBackgroundColor: UIColor = black_alpha50
    static let gameEngine_CharacterSelection_FinalLabelColor: UIColor = golden2
}

enum DesignSystemSizes {
    static let thinInterfaceFrameWidth: CGFloat = 0.5
    static let smallInterfaceFrameWidth: CGFloat = 1
    static let defaultInterfaceFrameWidth: CGFloat = 2
    static let defaultInterfaceCornerRadius: CGFloat = 10
}
