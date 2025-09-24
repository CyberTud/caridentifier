# App Store Connect Metadata Updates

## Required Updates for App Submission

### 1. App Description Update
Add the following line to your app description:

```
Terms of Use: https://carpeek.app/terms
```

### 2. Custom EULA (if using custom Terms)
In App Store Connect:
1. Go to your app
2. Navigate to "App Information"
3. Scroll to "License Agreement"
4. Select "Custom License Agreement"
5. Enter your Terms of Use URL: `https://carpeek.app/terms`

### 3. Privacy Policy URL
Ensure this is set in App Store Connect:
- Privacy Policy URL: `https://carpeek.app/privacy`

### 4. Subscription Information Display
The app now displays (in PaywallScreen):
- ✅ Title of subscription: "CarPeek Monthly"
- ✅ Length of subscription: "per month"
- ✅ Price of subscription: "$4.99"
- ✅ Terms of Use link (functional)
- ✅ Privacy Policy link (functional)
- ✅ Auto-renewal notice: "Subscriptions auto-renew. Cancel anytime in Settings."

### 5. Website Hosting Requirements
You need to host these pages on your website:
- `https://carpeek.app/terms` - Terms of Use
- `https://carpeek.app/privacy` - Privacy Policy

### 6. App Binary Updates Completed
The following changes have been made to the app:
- Added Terms of Use and Privacy Policy links in the paywall screen
- Links open in external browser when tapped
- All subscription information is clearly displayed

## Next Steps for Submission

1. **Host the Legal Documents**
   - Upload the Terms of Use to your website at `/terms`
   - Upload the Privacy Policy to your website at `/privacy`

2. **Update App Store Connect**
   - Add Terms of Use URL to app description
   - Ensure Privacy Policy URL is set
   - Consider using Custom EULA if needed

3. **Build and Upload New Version**
   ```bash
   flutter build ipa
   ```
   Then upload the new build to App Store Connect

4. **Reply to App Review**
   Once everything is updated, reply to the review message explaining:
   - Terms of Use link has been added to the app binary
   - Links are functional and displayed on the paywall screen
   - App description has been updated with Terms of Use link
   - All subscription information is clearly displayed

## Testing Checklist
- [ ] Terms of Use link works in the app
- [ ] Privacy Policy link works in the app
- [ ] Subscription price is displayed ($4.99/month)
- [ ] Subscription duration is displayed (Monthly)
- [ ] Auto-renewal notice is displayed
- [ ] Terms of Use is hosted at https://carpeek.app/terms
- [ ] Privacy Policy is hosted at https://carpeek.app/privacy