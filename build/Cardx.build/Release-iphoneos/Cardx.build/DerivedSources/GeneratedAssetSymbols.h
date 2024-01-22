#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The "logo" asset catalog image resource.
static NSString * const ACImageNameLogo AC_SWIFT_PRIVATE = @"logo";

/// The "socialmedia_facebook" asset catalog image resource.
static NSString * const ACImageNameSocialmediaFacebook AC_SWIFT_PRIVATE = @"socialmedia_facebook";

/// The "socialmedia_instagram" asset catalog image resource.
static NSString * const ACImageNameSocialmediaInstagram AC_SWIFT_PRIVATE = @"socialmedia_instagram";

/// The "socialmedia_twitter" asset catalog image resource.
static NSString * const ACImageNameSocialmediaTwitter AC_SWIFT_PRIVATE = @"socialmedia_twitter";

/// The "socialmedia_web" asset catalog image resource.
static NSString * const ACImageNameSocialmediaWeb AC_SWIFT_PRIVATE = @"socialmedia_web";

/// The "socialmedia_whats" asset catalog image resource.
static NSString * const ACImageNameSocialmediaWhats AC_SWIFT_PRIVATE = @"socialmedia_whats";

#undef AC_SWIFT_PRIVATE