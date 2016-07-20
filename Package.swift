import PackageDescription

let package = Package(
  name: "Delirium",
  dependencies: [
    .Package(url: "https://github.com/icapps/ios-delirium.git", majorVersion: 0, minor: 4)
  ]
)
