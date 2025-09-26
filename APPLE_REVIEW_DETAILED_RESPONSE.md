# Detailed Response to App Review - CarPeek In-App Purchase Location

## IMPORTANT: The subscription ONLY appears AFTER the FIRST FREE scan

Dear App Review Team,

The CarPeek Monthly subscription ($4.99/month) is located in the app but requires completing ONE free scan first. Here are the exact steps:

## Step-by-Step Instructions to Find the In-App Purchase:

### Step 1: Launch the App
- Open CarPeek app
- Grant camera permission when prompted

### Step 2: Complete Your FIRST Scan (FREE)
- Tap the blue "Scan VIN" button at the bottom of the home screen
- Either:
  - Point camera at any VIN barcode, OR
  - Tap "Enter VIN Manually" and type: **1HGBH41JXMN109186**
- View the vehicle report (this first scan is FREE - no payment required)

### Step 3: Return to Home Screen
- Tap the back button or home icon
- You're now on the main screen again

### Step 4: Attempt a SECOND Scan (TRIGGERS PAYWALL)
- Tap "Scan VIN" button again
- **THE PAYWALL WILL NOW APPEAR** showing:
  - "CarPeek Monthly" subscription
  - Price: $4.99 per month
  - "Subscribe Now" button
  - Terms of Use and Privacy Policy links

## Why You Might Not See the Subscription:

1. **You haven't completed the first free scan** - The app gives one free scan to all new users
2. **You're stopping at step 2** - The paywall only appears on the SECOND scan attempt
3. **The subscription is not visible in any menu** - It only appears when trying to scan a second vehicle

## Technical Details:

- Product ID: `com.carpeek.app.monthly`
- Price: $4.99 USD per month
- The subscription is configured in App Store Connect
- The paywall is implemented in `lib/presentation/widgets/paywall_screen.dart`

## Testing in Sandbox:

1. Ensure you're signed into a Sandbox account (Settings → App Store → Sandbox Account)
2. Follow the 4 steps above
3. The subscription will work in sandbox environment

## Business Logic Explanation:

Our app uses a "freemium" model:
- First scan: Always FREE for new users (to demonstrate value)
- Second+ scans: Requires monthly subscription
- This is intentional to let users try before subscribing

## Summary for Quick Testing:

1. Open app → Grant camera permission
2. Scan/enter first VIN → View free report
3. Go back → Try to scan again
4. **PAYWALL APPEARS HERE** ← This is where you'll find the subscription

The subscription is working correctly. You just need to complete one free scan first before the paywall appears.

If you're still unable to locate the subscription after following these steps, please let me know at what step you're experiencing issues, and I can provide additional guidance.

Thank you for your patience.

## Alternative Testing Method:

If you want to skip the camera scanning:
1. Launch app
2. Tap "Scan VIN"
3. Tap "Enter VIN Manually"
4. Enter: **1HGBH41JXMN109186**
5. View the free report
6. Go back and repeat steps 2-4
7. The paywall will appear on this second attempt