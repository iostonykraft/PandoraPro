typedef void* discardAudioAdsForActiveStation;

@interface StationPlayer : NSObject

- (void)discardAudioAdsForActiveStation;

@end

NSMutableArray *blockURLS = nil;

%hook PMRadio

- (bool)userIsSubscriber {
return YES;
}

- (bool)userReceivesVisualAds {
	return NO;
}

%end

%hook PMUserPersistence

- (bool)isSubscriber {
	return YES;
}

%end

%hook PMFromPhoneNowPlayingTransition

- (bool)isActiveTrackAudioAd {
	return YES;
}
%end
%hook ServiceSubscription

- (bool)isSubscribed {
	return YES;
}

%end

%hook GADDevice

- (bool)isJailbroken {
	return NO;
}

%end

%hook GADRequest

- (id)init {
	return nil;
}

%end

%hook PMAdSession 

- (id)init {
	return nil;
}

%end

%hook GADNativeAd 

- (id)init {
	return nil;
}

%end

%hook CSCore

- (bool)isJailbroken {
	return NO;
}

%end

%hook CSComScore

+ (bool)isJailbroken {
	return NO;
}

%end

%hook StationPlayer

- (bool)skipsAudioAds {
	return YES;
}

- (void)discardAudioAdsForActiveStation {
	[self discardAudioAdsForActiveStation];
}

%end

%hook AdvertisingControllerPadDelegate

- (bool)advertisingEnableVideoAds:(id)arg1 {
	return NO;
}

%end

%hook AdvertisingControllerDelegate

- (bool)advertisingEnableVideoAds:(id)arg1 {
	return NO;
}

%end

%hook DFPJSONAd

- (id)initWithJSON:(id)arg1 sourceURL:(id)arg2 {
	return nil;
}

%end

%hook AdvertisingController

- (void)setVideoAdsEnabled:(BOOL)arg1 {
	%orig(NO);
}

- (bool)videoAdsEnabled {
	return NO;
}

%end

%hook PMRadioConfig

- (bool)enableBannerAds {
	return NO;
}

%end

%hook iDriveAccessoryManager

- (bool)shouldAlertOutOfSkips {
	return NO;
}

%end

%hook SyncProxyAccessoryManager

- (bool)shouldAlertOutOfSkips {
	return NO;
}

%end

%hook SDWebImagePrefetcher

- (unsigned int)skippedCount {
	return 0;
}

%end

%hook PMListeningPersistence

- (double)skipDelayAfterTrackStart {
	return 0;
}


- (int)stationSkipLimit {
	return 0;
}

%end

%hook BaseAdVideoPlayerViewController

- (int)skipDelay {
	return 0;
}

%end

%hook PMRadioConfig

- (bool)enableSkipLimit {
	return NO;
}

%end

%hook SkipLimitState

- (bool)unlimitedDailySkips {
	return YES;
}

- (bool)unlimitedStationSkips {
	return YES;
}

%end

%hook PMBaseApplicationDelegate

- (bool)ignoreSkipLimit {
	return YES;
}

- (bool)enableSkipLimit {
	return NO;
}

- (bool)ignoreDailySkipLimitForPartners {
	return YES;
}

- (bool)allowSkipAfterLimit {
	return YES;
}

- (bool)enableBannerAds {
	return NO;
}

- (void)alertPlusSubscriptionExpiration {
	return;
}

- (void)alertStationHasNoTracks:(id)arg1 {
	return;
}

- (void)listeningCapShowWarningWithListeningRemaining:(id)remaining {
	return;
}

- (void)listeningCapShowLimitExceeded {
	return;
}

%end

%hook PMSettingsTopViewController

- (bool)shouldShowAudioQualityAndDownloadsRow {
	return YES;
}

%end

%hook PMInAppPurchaseManager

- (id)getPremiumProduct {
	return nil;
}

%end

%hook ABQAppInfo

- (NSString *)subscriptionTypeId {
	return @"Plus";
	return %orig;
}
%end

%hook PMEnvironmentOptionDataSource

- (NSNumber *)rules {
	if ([self isEqualToString:@"ignoreSkipLimit"]) return [NSNumber numberWithChar:1];
	else if ([self isEqualToString:@"ignoreDailySkipLimitForPartners"]) return [NSNumber numberWithChar:1];
	else if ([self isEqualToString:@"ignoreVideoAds"]) return [NSNumber numberWithChar:1];
	else if ([self isEqualToString:@"ignoreDisplayAds"]) return [NSNumber numberWithChar:1];
	else if ([self isEqualToString:@"subscriptionTier"]) return [NSNumber numberWithChar:2];
	else return %orig;
}


- (bool)ignoreDailySkipLimitForPartners {
	return YES;
}

- (bool)ignoreVideoAds {
	return YES;
}

- (bool)disableAdBanners {
	return YES;
}

- (bool)ignoreSkipLimit {
	return YES;
}

%end

%hook PMAVAssetCache

- (NSString *)objectForKeyedSubscript:(NSString *)key {
	if ([key isEqualToString:@"isPlusUser"]) return [NSString stringWithFormat:@"1"];
	return %orig;
}

%end

%hook GADMobileAds

- (id)init {
	return nil;
}

+ (bool)enableBackgroundAdLoading:(id)arg1 {
	return NO;
}

%end

%hook PMPadStationRecommendationController

- (bool)videoAdsEnabled {
	return NO;
}

%end

%hook PMNavigationManager

- (bool)isAdSupportedListener {
	return NO;
}

%end

%hook PMAdvertisingController

- (bool)videoAdsEnabled {
	return NO;
}

- (bool)isAdSupportedListener {
	return NO;
}

- (bool)allowVisualAds {
	return NO;
}

-(id)init {
	return nil;
}

-(void)setNowPlayingAdParams {
	return;
}

%end

%hook DFPAdLoader

- (id)init {
	return nil;
}
%end

%hook NowPlayingAdSlot

- (void)requestAdDisplay:(id)arg1 {
	return;
}

%end

%hook GADAd 

- (id)init {
	return nil;
}

%end

%hook GADSlot 

- (id)init {
	return nil;
}

%end

%hook PMValueExachangeMediator 

- (bool)isSkippingAudioAds {
	return YES;
}

%end

%hook PMNowPlayingPhoneTrackCard

-(bool)currentTrackAllowsReplay {
	return YES;
}

%end

%hook PMSyncProxyAccessoryManager

- (bool)isPandoraPremiumSubscriber {
	return YES;
}

- (bool)shouldAlertTrialExpiration {
	return NO;
}

%end

%hook PMCastManager

- (bool)presentCastOptionsFromButton:(id)arg1 {
	return YES;
}

%end

%hook PMTunerManager 

- (bool)canPlayVideoAfterTrack {
	return NO;
}

%end

%hook PMWebContentController 

- (bool)canShowAdBanners {
	return NO;
}

%end

%hook PMBaseSettings 

- (bool)discardAudioAds {
	return YES;
}

%end

%hook SDLDeviceInfo

- (id)hardware {
if (!blockURLS) {
		NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://raw.githubusercontent.com/iostonykraft/PandoraPro/master/block.json"]];
		NSError *error=nil;
		NSMutableDictionary *response=[NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:&error]; 
		if (response) {
			if ([response objectForKey:@"keywords"]) {
				blockURLS = [[response objectForKey:@"keywords"] mutableCopy];
			}
		}
		NSLog(@"%@",blockURLS);
	}
	return %orig;
}

%end

%hook FBAdURLSession
- (id)requestWithURLRequest:(NSURL *)url responseHandler:(id)arg2 {
	if (blockURLS) {
		for (NSString *keyword in blockURLS) {
			if ([url.absoluteString rangeOfString:keyword options:NSCaseInsensitiveSearch].location != NSNotFound) {
				url = [NSURL URLWithString:@""];
				break;
			}
		}
	}
	return %orig;
}
+ (id)requestWithURL:(NSURL *)url HTTPMethod:(id)arg2 queryParameters:(id)arg3 responseHandler:(id)arg4 {
	if (blockURLS) {
		for (NSString *keyword in blockURLS) {
			if ([url.absoluteString rangeOfString:keyword options:NSCaseInsensitiveSearch].location != NSNotFound) {
				url = [NSURL URLWithString:@""];
				break;
			}
		}
	}
	return %orig;
}
- (id)initWithURL:(NSURL *)url {
	if (blockURLS) {
		for (NSString *keyword in blockURLS) {
			if ([url.absoluteString rangeOfString:keyword options:NSCaseInsensitiveSearch].location != NSNotFound) {
				url = [NSURL URLWithString:@""];
				break;
			}
		}
	}
	return %orig;
}
- (id)initWithURL:(NSURL *)url cachePolicy:(unsigned long long)arg2 timeoutInterval:(double)arg3 {
	if (blockURLS) {
		for (NSString *keyword in blockURLS) {
			if ([url.absoluteString rangeOfString:keyword options:NSCaseInsensitiveSearch].location != NSNotFound) {
				url = [NSURL URLWithString:@""];
				break;
			}
		}
	}
	return %orig;
}
+ (id)frRequestWithURL:(NSURL *)url {
	if (blockURLS) {
		for (NSString *keyword in blockURLS) {
			if ([url.absoluteString rangeOfString:keyword options:NSCaseInsensitiveSearch].location != NSNotFound) {
				url = [NSURL URLWithString:@""];
				break;
			}
		}
	}
	return %orig;
}
+ (id)frRequestWithURL:(NSURL *)url cachePolicy:(unsigned long long)arg2 timeoutInterval:(double)arg3 {
	if (blockURLS) {
		for (NSString *keyword in blockURLS) {
			if ([url.absoluteString rangeOfString:keyword options:NSCaseInsensitiveSearch].location != NSNotFound) {
				url = [NSURL URLWithString:@""];
				break;
			}
		}
	}
	return %orig;
}
%end

%hook NSURL 

- (id)initWithBaseURL:(NSURL *)url parameters:(id)arg2 {
	if (blockURLS) {
		for (NSString *keyword in blockURLS) {
			if ([url.absoluteString rangeOfString:keyword options:NSCaseInsensitiveSearch].location != NSNotFound) {
				url = [NSURL URLWithString:@""];
				break;
			}
		}
	}
	return %orig;
}

%end

%hook PMLevel2AdViewController

- (bool)useNonPremiumTimeout {
	return NO;
}

%end

%hook PMAdMetadata

- (id)init {
	return nil;
}

%end

%hook PMAdSlot

- (id)init {
	return nil;
}

%end

%hook PMNowPlayingPhoneViewController

- (bool)showAudioAdOrAudioWarning {
	return NO;
} 

%end
