# Delirium

[![CI Status](http://img.shields.io/travis/icapps/ios-delirium.svg?style=flat)](https://travis-ci.org/icapps/ios-delirium)
[![License](https://img.shields.io/cocoapods/l/Delirium.svg?style=flat)](http://cocoapods.org/pods/Delirium)
[![Platform](https://img.shields.io/cocoapods/p/Delirium.svg?style=flat)](http://cocoapods.org/pods/Delirium)
[![Version](https://img.shields.io/cocoapods/v/Delirium.svg?style=flat)](http://cocoapods.org/pods/Delirium)
[![Language Swift 2.2](https://img.shields.io/badge/Language-Swift%202.2-orange.svg?style=flat)](https://swift.org)

> Delirium contains a set of UI components that can be reused during development.

## TOC

- [Installation](#installation)
- [Features](#features)
  - [Animations](#animations)
    - [Shake](#shake)
- [Bucket List](#bucket-list)
- [Author](#author)
- [License](#license)

## Installation

Delirium is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your `Podfile`:

```ruby
pod 'Delirium', '~> 0.1'
```

## Features

### Animations

#### Shake

You can shake a UIView with this handy `shake` function.

```swift
let view: UIView = ...

// Shake the view with the default `duration` of 0.07 seconds and a `repeatCount` of 4.
view.shake()

// You can also pass a custom `duration` or `repeatCount` is wanted.
view.shake(repeatCount: 10, duration: 1.0)
```

## Bucket List

Here is an overview what is on our todo list.

- [ ] Add `UIView` Wiggle.
- [ ] Add pin view component.

## Author

Jelle Vandebeeck, jelle@fousa.be

## License

Delirium is available under the MIT license. See the LICENSE file for more info.
