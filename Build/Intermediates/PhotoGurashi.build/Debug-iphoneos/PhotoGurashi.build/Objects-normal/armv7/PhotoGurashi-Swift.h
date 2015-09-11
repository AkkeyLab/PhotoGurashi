// Generated by Apple Swift version 1.2 (swiftlang-602.0.53.1 clang-602.0.53)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if defined(__has_include) && __has_include(<uchar.h>)
# include <uchar.h>
#elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
#endif

typedef struct _NSZone NSZone;

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted) 
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
#endif
#if __has_feature(nullability)
#  define SWIFT_NULLABILITY(X) X
#else
# if !defined(__nonnull)
#  define __nonnull
# endif
# if !defined(__nullable)
#  define __nullable
# endif
# if !defined(__null_unspecified)
#  define __null_unspecified
# endif
#  define SWIFT_NULLABILITY(X)
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;
@class NSObject;

SWIFT_CLASS("_TtC12PhotoGurashi11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic) UIWindow * __nullable window;
- (BOOL)application:(UIApplication * __nonnull)application didFinishLaunchingWithOptions:(NSDictionary * __nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * __nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * __nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * __nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * __nonnull)application;
- (void)applicationWillTerminate:(UIApplication * __nonnull)application;
- (SWIFT_NULLABILITY(nonnull) instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class AVCaptureSession;
@class AVCaptureDevice;
@class AVCaptureStillImageOutput;
@class UIButton;
@class UIImageView;
@class UIImage;
@class CIImage;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC12PhotoGurashi20CommonViewController")
@interface CommonViewController : UIViewController
@property (nonatomic) AVCaptureSession * __null_unspecified mySession;
@property (nonatomic) AVCaptureDevice * __null_unspecified myDevice;
@property (nonatomic) AVCaptureStillImageOutput * __null_unspecified myImageOutput;
@property (nonatomic, readonly) UIButton * __nonnull cameraButton;
@property (nonatomic, readonly) UIButton * __nonnull exitButton;
@property (nonatomic, readonly) UIButton * __nonnull changeCameraButton;
@property (nonatomic) UIImageView * __null_unspecified provisionalImageView;
@property (nonatomic) UIImage * __nonnull provisionalImage;
@property (nonatomic) BOOL cameraInfo;
@property (nonatomic) CIImage * __null_unspecified takeInputImage;
- (void)changeImage:(UIImage * __nonnull)image;
- (void)viewDidLoad;
- (void)onClickButton:(UIButton * __nonnull)sender;
- (void)cameraSetting;
- (void)outputImage;
- (void)didReceiveMemoryWarning;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12PhotoGurashi20KurumiViewController")
@interface KurumiViewController : CommonViewController
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithNibName:(NSString * __null_unspecified)nibNameOrNil bundle:(NSBundle * __null_unspecified)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)init;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
@end


SWIFT_CLASS("_TtC12PhotoGurashi21MeguneeViewController")
@interface MeguneeViewController : CommonViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12PhotoGurashi18MikiViewController")
@interface MikiViewController : CommonViewController
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithNibName:(NSString * __null_unspecified)nibNameOrNil bundle:(NSBundle * __null_unspecified)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)init;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
@end


SWIFT_CLASS("_TtC12PhotoGurashi14ViewController")
@interface ViewController : UIViewController
@property (nonatomic, readonly) UIButton * __nonnull yukiButton;
@property (nonatomic, readonly) UIButton * __nonnull kurumiButton;
@property (nonatomic, readonly) UIButton * __nonnull yuuriButton;
@property (nonatomic, readonly) UIButton * __nonnull mikiButton;
@property (nonatomic) UIImage * __nonnull topImage;
- (void)viewDidLoad;
- (void)onClickButton:(UIButton * __null_unspecified)sender;
- (void)didReceiveMemoryWarning;
- (BOOL)timeBoolean:(uint8_t)startTime goalTime:(uint8_t)goalTime;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12PhotoGurashi18YukiViewController")
@interface YukiViewController : CommonViewController
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithNibName:(NSString * __null_unspecified)nibNameOrNil bundle:(NSBundle * __null_unspecified)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)init;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
@end


SWIFT_CLASS("_TtC12PhotoGurashi19YuuriViewController")
@interface YuuriViewController : CommonViewController
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithNibName:(NSString * __null_unspecified)nibNameOrNil bundle:(NSBundle * __null_unspecified)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)init;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
@end

#pragma clang diagnostic pop
