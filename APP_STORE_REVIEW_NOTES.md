# App Store Review Notes - CarPeek

## App Description
CarPeek is an AI-powered car identification app that uses advanced image recognition to instantly identify any car from a photo. Users can discover the make, model, year, generation, and detailed specifications of vehicles.

## Subscription Model Overview

### Free Trial
- **1 free scan** to try the app
- No registration required
- Full access to all identification features for the trial scan
- After the first scan, subscription is required to continue

### Subscription Tiers

#### CarPeek Monthly - $4.99/month
- Product ID: `carpeek_monthly`
- Unlimited car scans
- Instant AI-powered identification
- Detailed specifications including:
  - Performance specs (0-60 mph, top speed, horsepower)
  - Price estimates and market value
  - Similar model recommendations
  - Complete technical details
- Full scan history access
- No ads

#### CarPeek Yearly - $34.99/year (Save 42%)
- Product ID: `carpeek_yearly`
- All monthly features
- Best value pricing
- Priority support
- Early access to new features

## How to Test Subscriptions

### Testing the Free Trial
1. Launch the app on a fresh install
2. Tap the camera button to take a photo or select from gallery
3. The first scan will work without any payment
4. Results will show complete car information

### Testing the Paywall
1. After completing the first free scan
2. Attempt to scan a second car
3. The paywall screen will appear with subscription options
4. Both monthly and yearly plans are displayed with pricing

### Testing Purchase Flow
1. Select either Monthly ($4.99) or Yearly ($34.99) plan
2. Tap "Subscribe" button
3. Apple's payment sheet will appear
4. Complete purchase with sandbox account
5. After successful purchase, unlimited scans are enabled

### Testing Restoration
1. If reinstalling the app or using a different device
2. Open the paywall screen
3. Tap "Restore Purchases" at the bottom
4. Previously purchased subscriptions will be restored

## Important Review Information

### No Account Required
- The app uses device-based tracking
- No user registration or login required
- Subscriptions are tied to Apple ID
- Privacy-focused approach

### Subscription Management
- Users can manage subscriptions in iOS Settings > Apple ID > Subscriptions
- Subscriptions auto-renew until cancelled
- Cancellation takes effect at the end of the current billing period
- No refunds for partial periods

### Privacy & Data
- Photos are processed for car identification only
- No personal data is collected without consent
- Images are not stored on servers after processing
- Compliant with Apple's privacy guidelines

### Content Rights
- All car identification data is sourced from public information
- No copyrighted manufacturer images are used without permission
- User photos remain property of the user
- AI generates descriptions based on publicly available specifications

## Common Review Questions

**Q: Why do you require a subscription?**
A: The app uses advanced AI models and cloud processing for accurate car identification. Subscription revenue covers ongoing server costs, AI model improvements, and continuous database updates.

**Q: What happens if users don't subscribe?**
A: Users get 1 free scan to experience the full app capabilities. After that, a subscription is required for continued use. Users can still view their scan history from the free scan.

**Q: How do users cancel?**
A: Users can cancel anytime through iOS Settings > Apple ID > Subscriptions. The app will continue to work until the end of the current billing period.

**Q: Is the subscription family shareable?**
A: Yes, subscriptions purchased through the App Store can be shared with Family Sharing members.

## Technical Implementation

### StoreKit 2 Integration
- Using `in_app_purchase` Flutter package
- Proper receipt validation
- Handles subscription lifecycle events
- Supports restore purchases
- Graceful handling of network errors

### Subscription Status
- Checked on app launch
- Cached locally for offline access
- Refreshed when attempting new scans
- Properly handles grace periods

### Error Handling
- Clear error messages for failed purchases
- Retry mechanisms for network issues
- Fallback for StoreKit availability

## Testing Credentials
No special credentials needed - the app uses:
- Device-local storage for scan history
- Apple ID for subscription management
- No backend user accounts

## Support Contact
For any questions during review:
- Email: support@carpeek.app
- Response time: Within 24 hours

## Compliance Confirmations
✅ Subscriptions are clearly described with pricing
✅ Terms of Service and Privacy Policy links included
✅ Restore purchase functionality implemented
✅ Subscription management instructions provided
✅ No hidden charges or misleading pricing
✅ Appropriate age rating applied
✅ Content rights properly secured

---

*Last Updated: September 2024*
*App Version: 1.0.0*