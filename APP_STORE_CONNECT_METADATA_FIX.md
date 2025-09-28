# App Store Connect Metadata Update Instructions

## IMPORTANT: Add Terms of Use Link to App Store Connect

Apple requires the Terms of Use link in BOTH the app binary AND the App Store metadata.

### Steps to Add Terms of Use in App Store Connect:

1. **Log in to App Store Connect**
   - Go to https://appstoreconnect.apple.com
   - Navigate to your app

2. **Add Terms of Use to App Description**

   Add the following text at the end of your app description:

   ```
   Terms of Use: https://carpeek-termofuse.carrd.co
   Privacy Policy: https://carpeek-policy.carrd.co
   ```

3. **Alternative: Add Custom EULA**

   If you prefer to use a custom EULA instead of adding to description:

   - Go to "App Information" section
   - Scroll to "License Agreement"
   - Select "Custom License Agreement"
   - Paste your Terms of Use content
   - Save

### App Binary Updates Made:

✅ Terms of Use link is functional in the paywall screen
✅ Privacy Policy link is functional in the paywall screen
✅ Added error handling for URL launching
✅ Added URL schemes configuration to Info.plist
✅ Links use both external browser and in-app fallback

### Verified URLs:
- Terms of Use: https://carpeek-termofuse.carrd.co (Status: Working ✅)
- Privacy Policy: https://carpeek-policy.carrd.co (Status: Working ✅)

### Next Steps:

1. Build and upload new IPA with the fixes
2. Update App Store Connect metadata with Terms/Privacy links
3. Submit for review

The app binary now has fully functional Terms of Use and Privacy Policy links that will open in the user's browser when tapped.