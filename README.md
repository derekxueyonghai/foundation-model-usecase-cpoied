# How to use Apple’s Foundation Models in your App

https://www.youtube.com/watch?v=6QyH0YKcTyA&t=206s


4. Two practical paths (pick one)

A — You want to use Foundation Models (recommended if you need the API)

- Requirements: _Paid Apple Developer Program membership_ and a provisioning profile that includes the entitlement.

[Url on requiring paid apple developer program membership](https://developer.apple.com/apple-intelligence/foundation-models-adapter/)


- Steps:
	1. Sign into developer.apple.com → Certificates, Identifiers & Profiles.
	2. Under Identifiers → App IDs find your App ID (bundle id com.talalzeini.Tutorial). Click Edit.
	3. Look for a capability named "Foundation Models" or similar. If available, enable it and save.
		 - If you don't see it / can't enable it, that indicates the capability is not available for your account or requires Apple to enable it.
	4. Recreate or regenerate the provisioning profile for that App ID (or let Xcode automatic signing refresh).
	5. Back in Xcode, set Signing to Automatic (or select the regenerated profile) and click "Try Again" on the Signing warnings.
	6. Run on a physical device (simulator often will not work for system models). Check console for the ViewModel log if anything fails.

It seems that it is a dead end at 08:58 January 13, 2026. Hold and wait for other insights findings later.