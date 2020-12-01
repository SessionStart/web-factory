.PHONY: release
release:
		flutter build web --release
		firebase deploy