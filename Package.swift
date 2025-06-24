// swift-tools-version:6.0
import PackageDescription

let package = Package(
	name: "TrivialService",
	platforms: [
		.iOS(.v15),
		.macOS(.v12),
		.tvOS(.v15),
		.watchOS(.v8)
	],
	products: [
		.library(
			name: "TrivialService",
			targets: ["TrivialService"]
		),
	],
	dependencies: [
		.package(url: "https://github.com/Fleuronic/Trivial", branch: "main"),
		.package(url: "https://github.com/Fleuronic/Catenoid", branch: "main")
	],
	targets: [
		.target(
			name: "TrivialService",
			dependencies: [
				"Trivial",
				"Catenoid"
			]
		)
	],
	swiftLanguageModes: [.v6]
)

for target in package.targets {
	target.swiftSettings = [
		.enableExperimentalFeature("StrictConcurrency"),
		.enableUpcomingFeature("ExistentialAny"),
	]
}
