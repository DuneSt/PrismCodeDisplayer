<!--

git log --pretty="* %s ([%h](https://github.com/DuneSt/PrismCodeDisplayer/commit/%H))" v1.0.1...HEAD --grep="Merge pull"

'Content' copyWithRegex: 'Merge pull request #[0-9]+ from [^/]+/[0-9]*' matchesReplacedWith: '') copyReplaceAll: '-' with: ' '
-->

# [v1.1.1](https://github.com/DuneSt/PrismCodeDisplayer/compare/v1.1.0...v1.1.1) (2022-01-22)

## Infrastructure

* Migrate CI to Github actions + enable CI on Pharo 9 ([4b00ff6](https://github.com/DuneSt/PrismCodeDisplayer/commit/4b00ff6a7b33fad622c4079fdf561b9c9f68902a))

# [v1.1.0](https://github.com/DuneSt/PrismCodeDisplayer/compare/v1.0.1...v1.1.0) (2019-10-11)


## Features

* Add an integration with Material Design Lite ([b32e139](https://github.com/DuneSt/PrismCodeDisplayer/commit/b32e139f5477e8ce5e7d565294fc53333b9b48d6))

## Infrastructure

* Update to prism 1 17 ([5d99ed8](https://github.com/DuneSt/PrismCodeDisplayer/commit/5d99ed86554132760cb34c8d44a273d536bb5456))
* Use STONJSON instead of NeoJSON ([69a1954](https://github.com/DuneSt/PrismCodeDisplayer/commit/69a1954207c36fcc190428fa7db55bd5dd298c31))
* Do not load all seaside  ([85ec0c5](https://github.com/DuneSt/PrismCodeDisplayer/commit/85ec0c59a1470aac1dba8d735edbe12b0a56a2d2))
* Pharo 8 support ([c9d6015](https://github.com/DuneSt/PrismCodeDisplayer/commit/c9d601598d41f44a02ba381f3d2ab09986d1cebb))