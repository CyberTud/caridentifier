# CarPeek Subscription Configuration

## App Store Connect Product IDs

### Monthly Subscription (Active)
- **Product Reference Name:** `21787541` (Internal Apple Reference)
- **Product ID:** `com.carpeek.app.monthly` (Must use this in code)
- **Apple ID:** `6752904090`
- **Display Name:** CarPeek Monthly
- **Price:** $4.99 USD
- **Duration:** 1 Month
- **Auto-Renewable:** Yes
- **Status:** ✅ Active in App Store Connect

### Yearly Subscription (To Be Added)
- **Product ID:** `carpeek_yearly` (placeholder)
- **Display Name:** CarPeek Yearly - Save 42%
- **Price:** $34.99 USD
- **Duration:** 1 Year
- **Auto-Renewable:** Yes
- **Status:** ⏳ Not yet created in App Store Connect

## Implementation Status

### ✅ Completed
1. Updated `subscription_service.dart` with monthly product ID `21787541`
2. Modified paywall screen to default to monthly plan
3. Commented out yearly subscription UI until product is created

### 📝 TODO
1. Create yearly subscription in App Store Connect
2. Update `_yearlyProductId` in `subscription_service.dart` with actual ID
3. Uncomment yearly plan UI in `paywall_screen.dart`
4. Test both subscription tiers

## Testing Instructions

### Sandbox Testing
1. Use a sandbox test account
2. Launch the app
3. Complete first free scan
4. Attempt second scan - paywall appears
5. Select monthly subscription ($4.99)
6. Complete purchase with sandbox account
7. Verify unlimited scans are enabled

### Production Testing
1. Submit app for TestFlight
2. Test with real App Store account
3. Verify subscription appears in Settings > Apple ID > Subscriptions
4. Test restore purchases functionality

## Important Notes

- Product ID `21787541` must match exactly in App Store Connect
- Bundle ID: `com.carpeek.app`
- Subscription Group: CarPeek Premium
- The app uses StoreKit 1 via `in_app_purchase` Flutter package
- Auto-renewal is handled by iOS, no server-side validation required

## Revenue Share

Standard Apple commission applies:
- Year 1: Apple 30%, Developer 70%
- Year 2+: Apple 15%, Developer 85% (for retained subscribers)

## Support

For subscription issues:
- Email: support@carpeek.app
- App Store Connect: Review subscription analytics
- TestFlight: Monitor beta tester feedback

---
Last Updated: September 2024