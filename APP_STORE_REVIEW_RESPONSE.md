# App Store Review Response - CarPeek

## Issue 1: In-App Purchase Location (Guideline 2.1)

### Steps to Locate In-App Purchase:

The monthly subscription ($4.99) appears after the user completes their first free car identification. Here are the exact steps:

1. **Launch the app**
2. **Grant camera permission** when prompted
3. **On the "Car Identifier" screen**, you'll see options for Camera or Gallery
4. **Capture or select a car image**:
   - Tap the large circular button to take a photo of any car, OR
   - Switch to "Gallery" mode and select any car photo
5. **View the free car identification results** (first identification is free)
   - The app will show the car's make, model, specs, and other details
6. **Return to the main screen** (navigate back)
7. **Try to identify another car** (tap capture button again)
8. **The paywall screen will appear** showing:
   - "CarPeek Monthly" subscription
   - Price: $4.99/month
   - "Subscribe Now" button
   - Terms of Use and Privacy Policy links at bottom

### Important Notes:
- The first car identification is always free for new users
- The paywall only appears on the SECOND identification attempt
- The subscription Product ID is: `com.carpeek.app.monthly`
- The subscription is configured in App Store Connect under the app's In-App Purchases section
- The app uses AI-powered image recognition to identify vehicles

### Sandbox Testing:
- The subscription works in the sandbox environment
- Please ensure you're signed into a Sandbox test account in Settings → App Store → Sandbox Account
- The subscription auto-renews monthly at $4.99

---

## Issue 2: iPad Screenshots (Guideline 2.3.3)

We acknowledge the iPad screenshot issue showing iPhone device frames. We will:

1. **Remove the incorrect iPad screenshots** from App Store Connect immediately
2. **Upload new iPad-specific screenshots** that show the app running on iPad without iPhone frames
3. Ensure all screenshots accurately represent the app on the correct device

### Action Taken:
- We will update the 13-inch iPad screenshots in Media Manager today
- New screenshots will show the app interface as it appears on iPad devices
- All device frames will be removed or corrected to match the target device

---

## Additional Information

### Paid Apps Agreement
- The Account Holder has accepted the Paid Apps Agreement
- In-App Purchases are properly configured in App Store Connect
- The monthly subscription is set to "Ready to Submit" status

### StoreKit Configuration
- We've added a StoreKit configuration file for testing
- The app includes proper error handling for StoreKit responses
- All required subscription information is displayed (price, duration, terms)

### Next Steps
1. We will update the iPad screenshots immediately in App Store Connect
2. The in-app purchase is accessible following the steps outlined above
3. No code changes are required - the subscription functionality is working correctly

Please test using the steps provided above. The subscription appears after the first free scan when attempting a second vehicle scan. If you need any additional information or encounter any issues, please let us know.

Thank you for your review.

---

## Quick Testing Summary:
- **First car identification**: FREE (no paywall)
- **Second car identification**: Shows paywall with $4.99/month subscription
- **Test method**: Use any car photo (camera or gallery)