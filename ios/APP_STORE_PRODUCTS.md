# App Store In-App Purchase Products Configuration

## Required Setup in App Store Connect

### Prerequisites
1. Your app must be created in App Store Connect
2. You must have accepted the latest Paid Applications Agreement
3. Your app must have the "In-App Purchase" capability enabled

### Product Configuration

Create the following products in App Store Connect:

#### 1. Monthly Subscription
- **Product ID**: `carpeek_monthly`
- **Reference Name**: CarPeek Monthly
- **Type**: Auto-Renewable Subscription
- **Price**: $4.99 USD
- **Duration**: 1 Month
- **Subscription Group**: CarPeek Premium
- **Description**: Unlimited car scans with CarPeek Premium
- **Promotional Text**: Get unlimited car identifications every month

#### 2. Yearly Subscription
- **Product ID**: `carpeek_yearly`
- **Reference Name**: CarPeek Yearly
- **Type**: Auto-Renewable Subscription
- **Price**: $34.99 USD
- **Duration**: 1 Year
- **Subscription Group**: CarPeek Premium
- **Free Trial**: 7 days (optional)
- **Description**: Best value! Unlimited car scans for a full year
- **Promotional Text**: Save 42% with annual billing

### Subscription Group Settings
- **Group Name**: CarPeek Premium
- **Grace Period**: 16 days (recommended)
- **Upgrade/Downgrade**: Allow users to switch between monthly and yearly

### Localization
Add localizations for each product with appropriate translations for:
- Display Name
- Description
- Promotional Text

### App Store Review Information
When submitting for review, provide:
- **Screenshot**: The paywall screen showing both subscription options
- **Review Notes**: Explain that users get 1 free scan to try the app, with unlimited scans available through subscription
- **Demo Account**: Not required (uses device-based tracking)

### Testing
1. Create sandbox test accounts in App Store Connect
2. Test purchases in TestFlight or development builds
3. Verify subscription restoration works correctly
4. Test grace period and renewal scenarios

### Revenue Configuration
- Set up your banking and tax information
- Configure territories where subscriptions will be available
- Review and accept any required agreements

## Implementation Notes

The app is configured to use these product IDs:
- `carpeek_monthly` - Monthly subscription
- `carpeek_yearly` - Yearly subscription

These IDs are hardcoded in:
`lib/infrastructure/services/subscription_service.dart`

## Free Tier Details
- Users get 1 free scan to try the app
- After the first scan, subscription is required for continued use
- Scan count is tracked locally on device
- No user account required for the free trial scan