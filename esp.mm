/*
Designer: Ttrieu dz
PROJECT FREE BÁN LÀM CHÓ
SHARE GHI NGUỒN NHÉ AE

đô nết me
Ngân Hàng: Techcombank 
STK: 19036541702011 
Tên CTK : Bui Thi Cam Tien
*/
#include "LoadView/Includes.h"
#import "LoadView/DTTJailbreakDetection.h"
#include <Foundation/Foundation.h>
#include <libgen.h>
#include <mach-o/dyld.h>
#include <mach-o/fat.h>
#include <mach-o/loader.h>
#include <mach/vm_page_size.h>
#include <unistd.h>
#include <array>
#include <deque>
#include <map>
#include <vector>
#import "imgui/Il2cpp.h"
#import "LoadView/Icon.h"
#import "imgui/stb_image.h"
#include <unordered_map>
#include "imgui/imgui_toggle.h"
#import "Logo.h"
#import "imgui/imgui_additional.h"
#import "imgui/bdvt.h"
#import "mahoa.h"
#include <CoreFoundation/CoreFoundation.h>
#include <limits>
#import <UIKit/UIKit.h>
#include <chrono>
#import "stb_image.h"
#import "img.h"
#import "mod/ModSanh.h"
#import "mod/ModSkinDSGaming.h"
#import "mod/Backup.h"
#import "mod/mod.h"
#define STB_IMAGE_IMPLEMENTATION

#define iPhonePlus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kScale [UIScreen mainScreen].scale

using namespace IL2Cpp;

@interface ImGuiDrawView () <MTKViewDelegate>

@property (nonatomic, strong) id <MTLDevice> device;
@property (nonatomic, strong) id <MTLCommandQueue> commandQueue;

@end

UIView *view;
NSUserDefaults *saveSetting = [NSUserDefaults standardUserDefaults];
NSFileManager *fileManager1 = [NSFileManager defaultManager];
NSString *documentDir1 = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
static int selectedTab = 0;
const float BUTTON_WIDTH = 45.0f;
const float BUTTON_HEIGHT = 35.0f;

void CustomCheckbox(const char* label, bool* v) {
    ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 4.0f);

    if (*v) {
        ImGui::PushStyleColor(ImGuiCol_FrameBg, ImVec4(0.0f, 0.48f, 1.0f, 1.0f));
        ImGui::PushStyleColor(ImGuiCol_CheckMark, ImVec4(1.0f, 1.0f, 1.0f, 1.0f));
    } else {
        ImGui::PushStyleColor(ImGuiCol_FrameBg, ImVec4(0.11f, 0.11f, 0.12f, 1.0f));
        ImGui::PushStyleColor(ImGuiCol_CheckMark, ImVec4(0.6f, 0.6f, 0.6f, 1.0f));
    }

    ImGui::Checkbox(label, v);

    ImGui::PopStyleColor(2);
    ImGui::PopStyleVar();
}

@implementation ImGuiDrawView

ImFont* _espFont;
ImFont *_iconFont;

NSMutableDictionary *heroTextures;

static bool MenDeal = false;
static bool StreamerMode = false;
static bool Drawicon = false;
static bool showMinimap = true;
int minimapType = 1;
int skillCDStyle = 2;
bool showcd = false;
bool ESPEnable;
bool PlayerLine;
bool PlayerBox;
bool PlayerHealth;
bool PlayerName;
bool PlayerDistance;
bool PlayerAlert;
bool ESPArrow;
bool lockcam = false;
bool ESPCount;
int CameraHeight;
float minimapRotation;
bool unlockskin;
int rangeSize;
bool AimSkill;
float slider1;
float slider2;
float slider3;
float slider4;
float slider5;
static bool Ksbs = false;
static bool autobocpha = false;
bool IgnoreInvisible = true;
static bool hmap = false;
static bool hrank = false;
static bool fixfps = false;
static bool anudid = false;
static bool havatar = false;
static bool hlsd = false;
int mode = 0, aimType = 1, drawType = 2, skillSlot;

- (void)Guest {
    NSString *encrypteURL = @"https://img.upanh.tv/2024/11/16/unnamed.png";
    NSURL *url = [NSURL URLWithString:encrypteURL];
    NSData *icontb = [NSData dataWithContentsOfURL:url];
    UIImage *img5 = [UIImage imageWithData:icontb];

    [FTNotificationIndicator showNotificationWithImage:img5
                                                  title:@"TtrieuiOS"
                                                 message:@"Đang chờ xác nhận đăng xuất acc ..."];

    timer(0.1) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Bạn có muốn xoá không?"
                                                                       message:nil
                                                                preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *huy = [UIAlertAction actionWithTitle:@"Huỷ"
                                                      style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction *action) {}];

        UIAlertAction *tieptuc = [UIAlertAction actionWithTitle:@"Tiếp Tục"
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction *action) {
            NSString *encrypteURL = @"https://img.upanh.tv/2024/11/16/unnamed.png";
            NSURL *url = [NSURL URLWithString:encrypteURL];
            NSData *icontb = [NSData dataWithContentsOfURL:url];
            UIImage *img5 = [UIImage imageWithData:icontb];

            [FTNotificationIndicator showNotificationWithImage:img5
                                                          title:@"TtrieuiOS"
                                                         message:@"Đang Đăng Xuất Tài Khoản Game Sẽ Thoát Sau 3s"];

            [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@/Documents/beetalk_session.db", NSHomeDirectory()]
                                                       error:nil];

            exit(3);
        }];

        [tieptuc setValue:[UIColor redColor] forKey:@"titleTextColor"];
        [alert addAction:huy];
        [alert addAction:tieptuc];

        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert
                                                                                      animated:true
                                                                                    completion:nil];
    });
}

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    _device = MTLCreateSystemDefaultDevice();
    _commandQueue = [_device newCommandQueue];

    if (!_device) abort();

    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO &io = ImGui::GetIO();

    ImGuiStyle &style = ImGui::GetStyle();
    style.WindowPadding = ImVec2(10, 10);
    style.WindowRounding = 5.0f;
    style.FramePadding = ImVec2(5, 5);
    style.FrameRounding = 4.0f;
    style.ItemSpacing = ImVec2(12, 8);
    style.ItemInnerSpacing = ImVec2(8, 6);
    style.IndentSpacing = 25.0f;
    style.ScrollbarSize = 15.0f;
    style.ScrollbarRounding = 9.0f;
    style.GrabMinSize = 5.0f;
    style.GrabRounding = 3.0f;
    style.WindowBorderSize = 0.0f;
    style.FrameBorderSize = 1.0f;
    style.PopupBorderSize = 1.0f;
    style.Alpha = 1.0f;

    ImVec4 *colors = ImGui::GetStyle().Colors;
    colors[ImGuiCol_Text] = ImVec4(0.95f, 0.96f, 0.98f, 1.00f);
    colors[ImGuiCol_TextDisabled] = ImVec4(0.36f, 0.42f, 0.47f, 1.00f);
    colors[ImGuiCol_WindowBg] = ImVec4(0.11f, 0.15f, 0.17f, 1.00f);
    colors[ImGuiCol_ChildBg] = ImVec4(0.15f, 0.18f, 0.22f, 1.00f);
    colors[ImGuiCol_PopupBg] = ImVec4(0.08f, 0.08f, 0.08f, 0.94f);
    colors[ImGuiCol_Border] = ImVec4(0.08f, 0.10f, 0.12f, 1.00f);

    ImFontConfig config;
    ImFontConfig icons_config;
    config.FontDataOwnedByAtlas = false;
    icons_config.MergeMode = true;
    icons_config.PixelSnapH = true;
    icons_config.OversampleH = 2;
    icons_config.OversampleV = 2;

    static const ImWchar icons_ranges[] = {0xf000, 0xf3ff, 0};

    NSString *fontPath = @"/System/Library/Fonts/Core/AvenirNext.ttc";

    _espFont = io.Fonts->AddFontFromFileTTF(fontPath.UTF8String, 30.f, &config, io.Fonts->GetGlyphRangesVietnamese());
    _iconFont = io.Fonts->AddFontFromMemoryCompressedTTF(font_awesome_data, font_awesome_size, 30.0f, &icons_config, icons_ranges);

    _iconFont->FontSize = 5;
    io.FontGlobalScale = 0.5f;

    ImGui_ImplMetal_Init(_device);

    return self;
}

+ (void)showChange:(BOOL)open {
    MenDeal = open;
}

+ (BOOL)isMenuShowing {
    return MenDeal;
}

- (MTKView *)mtkView {
    return (MTKView *)self.view;
}

- (void)loadView {
    CGFloat w = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.width;
    CGFloat h = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.height;
    self.view = [[MTKView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
}



- (void)viewDidLoad {
    [super viewDidLoad];

    self.mtkView.device = self.device;
    if (!self.mtkView.device) {
        return;
    }

    self.mtkView.delegate = self;
    self.mtkView.clearColor = MTLClearColorMake(0, 0, 0, 0);
    self.mtkView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    self.mtkView.clipsToBounds = YES;

    if ([saveSetting objectForKey:@"ESPEnable"] != nil) {
        ESPEnable = [saveSetting boolForKey:@"ESPEnable"];
        PlayerLine = [saveSetting boolForKey:@"PlayerLine"];
        PlayerBox = [saveSetting boolForKey:@"PlayerBox"];
        PlayerHealth = [saveSetting boolForKey:@"PlayerHealth"];
        PlayerName = [saveSetting boolForKey:@"PlayerName"];
        PlayerDistance = [saveSetting boolForKey:@"PlayerDistance"];
        PlayerAlert = [saveSetting boolForKey:@"PlayerAlert"];
        Drawicon = [saveSetting boolForKey:@"Drawicon"];
        ESPCount = [saveSetting boolForKey:@"ESPCount"];
        IgnoreInvisible = [saveSetting boolForKey:@"IgnoreInvisible"];
        AimSkill = [saveSetting boolForKey:@"AimSkill"];
    }
}

- (void)drawInMTKView:(MTKView *)view {
    hideRecordTextfield.secureTextEntry = StreamerMode;

    ImGuiIO &io = ImGui::GetIO();
    io.DisplaySize.x = view.bounds.size.width;
    io.DisplaySize.y = view.bounds.size.height;

    CGFloat framebufferScale = view.window.screen.nativeScale ?: UIScreen.mainScreen.nativeScale;

    if (iPhonePlus) {
        io.DisplayFramebufferScale = ImVec2(2.60, 2.60);
    } else {
        io.DisplayFramebufferScale = ImVec2(framebufferScale, framebufferScale);
    }

    io.DeltaTime = 1 / float(view.preferredFramesPerSecond ?: 120);

    id<MTLCommandBuffer> commandBuffer = [self.commandQueue commandBuffer];

    static id<MTLTexture> bg_texture = nil;
    if (bg_texture == nil) {
        NSString *base64String = lqmbconfig;
        std::string base64_std_string([base64String UTF8String]);
        bg_texture = LoadTextureFromBase64(self.device, base64_std_string);
    }


    if (MenDeal == true) {
        [self.view setUserInteractionEnabled:YES];
        [self.view.superview setUserInteractionEnabled:YES];
        [menuTouchView setUserInteractionEnabled:YES];
    } else if (MenDeal == false) {
        [self.view setUserInteractionEnabled:NO];
        [self.view.superview setUserInteractionEnabled:NO];
        [menuTouchView setUserInteractionEnabled:NO];
    }

Attach();

MTLRenderPassDescriptor* renderPassDescriptor = view.currentRenderPassDescriptor;
if (renderPassDescriptor != nil) {
id <MTLRenderCommandEncoder> renderEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];
[renderEncoder pushDebugGroup:@"ImGui Jane"];

ImGui_ImplMetal_NewFrame(renderPassDescriptor);
ImGui::NewFrame();

CGFloat width = 480;
CGFloat height = 330;
ImGui::SetNextWindowPos(ImVec2((kWidth - width) / 2, (kHeight - height) / 2), ImGuiCond_FirstUseEver);
ImGui::SetNextWindowSize(ImVec2(width, height), ImGuiCond_FirstUseEver);

 static dispatch_once_t onceToken;
 dispatch_once(&onceToken, ^{ });

 if (MenDeal == true) {
 NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
 std::string Bundle([bundleIdentifier UTF8String]);
 NSString *safari_localizedShortVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:NSSENCRYPT("CFBundleShortVersionString")];
 std::string Version([safari_localizedShortVersion UTF8String]);
 NSString *safari_displayName = [[NSBundle mainBundle] objectForInfoDictionaryKey:NSSENCRYPT("CFBundleDisplayName")];
 std::string sName([safari_displayName UTF8String]);

 char* Gnam = (char*) [[NSString stringWithFormat:@"             Ttrieu"] cStringUsingEncoding:NSUTF8StringEncoding];
 ImGui::Begin(Gnam, &MenDeal, ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoTitleBar);

 ImGui::SetCursorPos({5, 5});
 ImGui::BeginChild("NameMenu", ImVec2(465, 30), true);
 ImGui::EndChild();
 ImDrawList* draw = ImGui::GetWindowDrawList();
 const ImVec2 pos = ImGui::GetWindowPos();
 float time = ImGui::GetTime();
 int currentDot = static_cast<int>(floor(time)) % 3;

 ImColor darkColors[3] = { ImColor(100, 30, 30), ImColor(100, 70, 30), ImColor(30, 100, 30) };
 ImColor glowColors[3] = { ImColor(255, 50, 50, 200), ImColor(255, 220, 100, 200), ImColor(130, 255, 130, 200) };

 draw->AddCircleFilled(ImVec2(pos.x + 20, pos.y + 20), 8, currentDot == 0 ? glowColors[0] : darkColors[0], 360);
 draw->AddCircleFilled(ImVec2(pos.x + 41, pos.y + 20), 8, currentDot == 1 ? glowColors[1] : darkColors[1], 360);
 draw->AddCircleFilled(ImVec2(pos.x + 62, pos.y + 20), 8, currentDot == 2 ? glowColors[2] : darkColors[2], 360);

 ImGui::SetCursorPos({5,270});
 ImGui::BeginChild("SaveSetting", ImVec2(465, 45), true);

 if (ImGui::Button("Lưu Setting")) {
 [saveSetting setBool:ESPEnable forKey:@"ESPEnable"];
 [saveSetting setBool:PlayerLine forKey:@"PlayerLine"];
 [saveSetting setBool:PlayerBox forKey:@"PlayerBox"];
 [saveSetting setBool:PlayerHealth forKey:@"PlayerHealth"];
 [saveSetting setBool:PlayerName forKey:@"PlayerName"];
 [saveSetting setBool:PlayerDistance forKey:@"PlayerDistance"];
 [saveSetting setBool:PlayerAlert forKey:@"PlayerAlert"];
 [saveSetting setBool:Drawicon forKey:@"Drawicon"];
 [saveSetting setBool:ESPCount forKey:@"ESPCount"];
 [saveSetting setBool:IgnoreInvisible forKey:@"IgnoreInvisible"];
 [saveSetting setBool:AimSkill forKey:@"AimSkill"];
 [saveSetting synchronize];
 }
 ImGui::SameLine();
 if (ImGui::Button("Sử dụng Setting")) {
 ESPEnable = [saveSetting boolForKey:@"ESPEnable"];
 PlayerLine = [saveSetting boolForKey:@"PlayerLine"];
 PlayerBox = [saveSetting boolForKey:@"PlayerBox"];
 PlayerHealth = [saveSetting boolForKey:@"PlayerHealth"];
 PlayerName = [saveSetting boolForKey:@"PlayerName"];
 PlayerDistance = [saveSetting boolForKey:@"PlayerDistance"];
 PlayerAlert = [saveSetting boolForKey:@"PlayerAlert"];
 Drawicon = [saveSetting boolForKey:@"Drawicon"];
 ESPCount = [saveSetting boolForKey:@"ESPCount"];
 IgnoreInvisible = [saveSetting boolForKey:@"IgnoreInvisible"];
 AimSkill = [saveSetting boolForKey:@"AimSkill"];
 }
 ImGui::SameLine();
 if (ImGui::Button("Reset Setting")) {
 ESPEnable = false;
 PlayerLine = false;
 PlayerBox = false;
 PlayerHealth = false;
 PlayerName = false;
 PlayerDistance = true;
 PlayerAlert = false;
 Drawicon = false;
 ESPCount = false;
 IgnoreInvisible = false;
 AimSkill = false;
 }
 ImGui::EndChild();

 ImGui::SetCursorPos({430, -2});
 ImGui::SetWindowFontScale(1.25f);
 ImGui::PushStyleColor(ImGuiCol_Button, ImVec4(0, 0, 0, 0));
 ImGui::PushStyleColor(ImGuiCol_ButtonHovered, ImVec4(0, 0, 0, 0));
 ImGui::PushStyleColor(ImGuiCol_ButtonActive, ImVec4(0, 0, 0, 0));
 ImGui::PushStyleVar(ImGuiStyleVar_FrameBorderSize, 0.0f);

 if (ImGui::Button(ICON_FA_POWER_OFF"", ImVec2(50, 50))) {
 MenDeal = false;
 }
 ImGui::PopStyleVar();
 ImGui::PopStyleColor(3);
 ImGui::SetWindowFontScale(1.0f);
 ImGui::SetCursorPos({5, 40});
 ImGui::BeginChild("ESP", ImVec2(65, 225), true, ImGuiWindowFlags_NoScrollbar);

 if (ImGui::Button(ICON_FA_EYE "", ImVec2(BUTTON_WIDTH, BUTTON_HEIGHT))) {
 selectedTab = 0;
 }
 if (ImGui::Button(ICON_FA_CROSSHAIRS "", ImVec2(BUTTON_WIDTH, BUTTON_HEIGHT))) {
 selectedTab = 1;
 }
 if (ImGui::Button(ICON_FA_FOLDER_OPEN"", ImVec2(BUTTON_WIDTH, BUTTON_HEIGHT))) {
 selectedTab = 2;
 }
 if (ImGui::Button("", ImVec2(BUTTON_WIDTH, BUTTON_HEIGHT))) {
 selectedTab = 3;
 }
 if (ImGui::Button(ICON_FA_HOME"", ImVec2(BUTTON_WIDTH, BUTTON_HEIGHT))) {
 selectedTab = 4;
 }
 ImGui::EndChild();

 if (selectedTab == 0) {
 ImGui::SetCursorPos({75, 40});
 ImGui::BeginChild("ESPContent", ImVec2(0, 225), true);
 ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(5, 5));
 ImGui::SetWindowFontScale(1.6f);
 ImGui::TextColored(ImColor(1.0f, 0.84f, 0.0f), "# ESP SETTING");
 ImGui::SameLine(140);
 ImGui::SetWindowFontScale(1.2f);
 ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(4.0f, 4.0f));
 ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 4.0f);
 ImGui::PushStyleColor(ImGuiCol_FrameBg, ImVec4(0.8f, 0.2f, 0.2f, 1.0f));
 ImGui::PushStyleColor(ImGuiCol_FrameBgHovered, ImVec4(0.9f, 0.4f, 0.4f, 1.0f));
 ImGui::PushStyleColor(ImGuiCol_Button, ImVec4(0.2f, 0.8f, 0.4f, 1.0f));
 ImGui::PushStyleColor(ImGuiCol_ButtonHovered, ImVec4(0.1f, 0.9f, 0.5f, 1.0f));
 if (ImGui::Toggle("ESP", &ESPEnable, ImGuiToggleFlags_Animated)) {
 }
 ImGui::PopStyleColor(4);
 ImGui::PopStyleVar(2);
 ImGui::SetWindowFontScale(1.1f);
 CustomCheckbox("Đường Kẻ", &PlayerLine);
 ImGui::SameLine(120);
 CustomCheckbox("Máu", &PlayerHealth);
 ImGui::SameLine(240);
 CustomCheckbox("Biểu Tượng", &Drawicon);
 CustomCheckbox("Hộp", &PlayerBox);
 ImGui::SameLine(120);
 CustomCheckbox("Khoản Cách", &PlayerDistance);
 ImGui::SameLine(240);
 CustomCheckbox("Tên Địch", &PlayerName);
 CustomCheckbox("Minimap", &showMinimap);
 ImGui::SameLine(120);
 ImGui::RadioButton("Đội Xanh", &minimapType, 1);
 ImGui::SameLine(240);
 ImGui::RadioButton("Đội Đỏ", &minimapType, 2);
 if (minimapType == 1) {
 minimapRotation = -0.6f;
 } else if (minimapType == 2) {
 minimapRotation = -180.0f;
 }
 ImGui::Spacing();
 ImGui::Text("KHOẢNG CÁCH ĐẾM | NÊN ĐỂ 40M ");
 ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(8, 8));
 ImGui::PushStyleVar(ImGuiStyleVar_GrabMinSize, 28);
 ImGui::PushStyleVar(ImGuiStyleVar_GrabRounding, 8.5);
 ImGui::PushStyleColor(ImGuiCol_FrameBg, ImVec4(0.11f, 0.11f, 0.12f, 1.0f));
 ImGui::PushStyleColor(ImGuiCol_SliderGrab, ImVec4(0.0f, 0.48f, 1.0f, 1.0f));
 ImGui::PushStyleColor(ImGuiCol_SliderGrabActive, ImVec4(0.0f, 0.6f, 1.0f, 1.0f));
 char label[32];
 ImGui::SliderInt(label, &rangeSize, 10.0f, 150.0f, "Distance [%.2f]");
 ImGui::PopStyleVar(3);
 ImGui::PopStyleColor(3);
 ImGui::BeginGroupPanel("Setting Vị Trí Minimap", ImVec2(0, 0));
 ImGui::SliderFloat("Minimap X", &slider1, 0.0f, kWidth);
 ImGui::SliderFloat("Minimap Y", &slider2, 0.0f, kHeight);
 ImGui::SliderFloat("Minimap Rotation", &slider3, -180.0f, 180.0f, "%.1f degrees");
 ImGui::SliderFloat("icon Scale", &slider4, 0.1f, 5.0f);
 ImGui::SliderFloat("Minimap Scale", &slider5, 0.1f, 5.0f);
 ImGui::Spacing();
 ImGui::EndGroupPanel();
 CustomCheckbox("Không Vẽ Khi Nhìn Thấy", &IgnoreInvisible);
 ImGui::EndChild();
 } else if (selectedTab == 1) {
 ImGui::SetCursorPos({75, 40});
 ImGui::BeginChild("AimSetting", ImVec2(0,225), true);
 ImGui::Checkbox("Bật Aim", &AimSkill);
 ImGui::SameLine();
 ImGui::Checkbox("Ẩn Hack", &StreamerMode);
 ImGui::Spacing();
 ImGui::TextColored(ImColor(18, 255, 0), "#Aim Dự Đoán");
 DrawAimbotTab();
 ImGui::EndChild();
 }else if (selectedTab == 2) {
            float originalPosY = ImGui::GetCursorPosY();
        		ImGui::SetCursorPos({75, 40});
                                        ImGui::BeginChild("ModSkin", ImVec2(0, 225), true);
ImGui::SetWindowFontScale(1.3f);
// Đặt viền màu đen và độ dày viền
ImGui::PushStyleVar(ImGuiStyleVar_ChildBorderSize, 2.0f); // Đặt độ dày viền là 2.0f
ImGui::PushStyleColor(ImGuiCol_Border, ImVec4(0.0f, 0.0f, 0.0f, 1.0f)); // Màu viền đen
ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 10.0f);  // Bo tròn góc với bán kính 10.0f
ImGui::BeginChild("Note", ImVec2(250, 60),true);
ImGui::SetWindowFontScale(0.8f);
ImGui::Text("#abcabcabcaffjfjajfjfj");
ImGui::EndChild();
ImGui::SameLine();
// Phục hồi lại màu sắc và giá trị mặc định
ImGui::PopStyleColor(); // Để trả lại màu viền mặc định
ImGui::PopStyleVar(2);   // Để trả lại độ dày viền mặc định
ImGui::SetWindowFontScale(1.1f);
CustomCheckbox("UnlockSkin", &unlockskin);
ImGui::Spacing();
ImVec4 buttonColor1 = ImColor(0x18, 0x18, 0x18);
ImVec4 borderColor1 = ImColor(0x76, 0x76, 0x78);
ImGui::PushStyleColor(ImGuiCol_Button, buttonColor1);
ImGui::PushStyleColor(ImGuiCol_Border, borderColor1);
ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 20.0f);
ImGui::PushStyleVar(ImGuiStyleVar_FrameBorderSize, 3.0f);
if (ImGui::Button(ICON_FA_LINK " Mod Qua Link", ImVec2(120, 43))) {
                           self.mtkView.hidden = YES;
                   MenDeal = NO;
                    timer(60) {
                        self.mtkView.hidden = NO;
                        MenDeal = YES;
                    });
[Mod ActiveMod];
}
ImGui::SameLine();
if (ImGui::Button(ICON_FA_FOLDER_OPEN " Mod Qua File", ImVec2(120, 43))) {
                       self.mtkView.hidden = YES;
                   MenDeal = NO;
                    timer(60) {
                        self.mtkView.hidden = NO;
                        MenDeal = YES;
                    });
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"MOD SKIN QUA FILE"
                                                                   message:@"Yêu Cầu File Mod : \n Có định dạng xxx.zip \n Bên trong chứa thư mục RESOURCE \nPowered by TtrieuiOS"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *clear = [UIAlertAction actionWithTitle:@"Mod Ngay" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [ModSkinDSGM ActiveModDSGM]; // Gọi phương thức Objective-C
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [alert addAction:clear];
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    [viewController presentViewController:alert animated:YES completion:nil];
}

if (ImGui::Button("Mod Sảnh", ImVec2(120, 30))) {
                           self.mtkView.hidden = YES;
                   MenDeal = NO;
                    timer(60) {
                        self.mtkView.hidden = NO;
                        MenDeal = YES;
                    });
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"MOD VIDEO SẢNH ?"
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *modAction = [UIAlertAction actionWithTitle:@"Mod Sảnh" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [ModSanh ActiveModSanh]; // Gọi phương thức Objective-C
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:cancelAction];
    [alert addAction:modAction];
    
    // Đảm bảo rằng viewController không phải là nil
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    if (viewController) {
        [viewController presentViewController:alert animated:YES completion:nil];
    } else {
        NSLog(@"Root view controller is nil. Cannot present alert.");
    }
}
ImGui::PopStyleVar(2); // Phục hồi 2 giá trị kiểu dáng (FrameRounding, FrameBorderSize)
ImGui::PopStyleColor(2); // Phục hồi 2 giá trị màu sắc (Button, Border)
ImGui::SameLine();
ImVec4 baseButtonColor = ImColor(255, 50, 50);          // Màu nền nút đỏ
ImVec4 buttonHoveredColor = ImColor(255, 100, 100);  // Màu nền nút khi hover (đỏ nhạt hơn)
ImVec4 buttonActiveColor = ImColor(200, 0, 0);       // Màu nền nút khi nhấn (đỏ đậm hơn)
ImVec4 borderColor = ImColor(255, 100, 100);             // Màu viền đỏ

// Thay đổi màu sắc cho nút
ImGui::PushStyleColor(ImGuiCol_Button, baseButtonColor);  // Màu nền nút
ImGui::PushStyleColor(ImGuiCol_ButtonHovered, buttonHoveredColor);  // Màu nền nút khi hover
ImGui::PushStyleColor(ImGuiCol_ButtonActive, buttonActiveColor);    // Màu nền nút khi nhấn

// Thay đổi màu viền và các thuộc tính kiểu dáng của nút
ImGui::PushStyleColor(ImGuiCol_Border, borderColor);  // Màu viền nút
ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 20.0f);  // Làm tròn các góc của nút
ImGui::PushStyleVar(ImGuiStyleVar_FrameBorderSize, 3.0f);  // Kích thước viền của nút
if (ImGui::Button("Xóa Mod Skin", ImVec2(120, 30))) {  // Tạo nút với kích thước 140x40
                       self.mtkView.hidden = YES;
                   MenDeal = NO;
                    timer(60) {
                        self.mtkView.hidden = NO;
                        MenDeal = YES;
                    });
          UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"XOÁ MOD SKIN ?"
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *clear = [UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [Backup deleteBackup];
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [alert addAction:clear];
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    [viewController presentViewController:alert animated:YES completion:nil];
}
ImGui::PopStyleVar(2);
ImGui::PopStyleColor(4);
ImGui::PushStyleColor(ImGuiCol_Button, ImVec4(255 / 255.0f, 204 / 255.0f, 226 / 255.0f, 1.0f));
ImGui::PushStyleColor(ImGuiCol_ButtonHovered, ImVec4(255 / 255.0f, 204 / 255.0f, 226 / 255.0f, 1.0f));
ImGui::PushStyleColor(ImGuiCol_Border, borderColor1);
ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(176 / 255.0f, 4 / 255.0f, 108 / 255.0f, 1.0f));
ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 20.0f);
ImGui::PushStyleVar(ImGuiStyleVar_FrameBorderSize, 0.0f);


if (ImGui::Button("Đăng Xuất Acc Nhanh", ImVec2(250, 32))) {
                           self.mtkView.hidden = YES;
                   MenDeal = NO;
                    timer(60) {
                        self.mtkView.hidden = NO;
                        MenDeal = YES;
                    });
   [self Guest];
}


ImGui::PopStyleVar(2);
ImGui::PopStyleColor(4);
                   ImGui::EndChild();

                    } else if (selectedTab == 3) {
 ImGui::SetCursorPos({75, 40});
 ImGui::BeginChild("MoreContent", ImVec2(0, 225), true);
 ImGui::Checkbox("Auto boc pha", &autobocpha);
 ImGui::Checkbox("Auto bs", &Ksbs);
 ImGui::Spacing();
 ImGui::EndChild();
 } else if (selectedTab == 4) {
 ImGui::SetCursorPos({75, 40});
 ImGui::BeginChild("MainFunc", ImVec2(0, 225), true, ImGuiWindowFlags_NoScrollbar);
 ImGui::Text("GAME INFO");
 ImDrawList* draw_list = ImGui::GetWindowDrawList();
 ImVec2 child_pos = ImGui::GetWindowPos();
 float scroll_offset_x = ImGui::GetScrollX();
 float scroll_offset_y = ImGui::GetScrollY();
 ImVec2 img_pos = ImVec2(child_pos.x + 10 - scroll_offset_x, child_pos.y + 28 - scroll_offset_y);
 ImVec2 img_size = ImVec2(50, 50);
 ImVec2 img_end = ImVec2(img_pos.x + img_size.x, img_pos.y + img_size.y);
 if (bg_texture) {
 draw_list->AddImage((void*)CFBridgingRetain(bg_texture), img_pos, img_end, ImVec2(0, 0), ImVec2(1, 1));
 } else {
 ImGui::TextColored(ImColor(255, 0, 0), "Failed to load texture.");
 }
 ImGui::SetWindowFontScale(1.0f);
 ImGui::SetCursorPosY(ImGui::GetCursorPosY() - 6);
 ImGui::Text(ENCRYPT("                    %s"), sName.c_str());
 ImGui::SetCursorPosY(ImGui::GetCursorPosY() - 6);
 ImGui::Text(ENCRYPT("                    %s"), Bundle.c_str());
 ImGui::SetCursorPosY(ImGui::GetCursorPosY() - 6);
 ImGui::Text(ENCRYPT("                    %s"), Version.c_str());
 ImGui::SetCursorPosY(ImGui::GetCursorPosY() - 3);
 ImGui::SetWindowFontScale(1.3f);
 ImGui::BeginGroupPanel("MAIN FUNCTION", ImVec2(0, 0));
 ImGui::SetWindowFontScale(1.1f);
 CustomCheckbox("Hack Map", &hmap);
 ImGui::SameLine(120);
 CustomCheckbox("Hiện Rank", &hrank);
 ImGui::SameLine(240);
 CustomCheckbox("Hiện Avatar", &havatar);
 CustomCheckbox("Show Cd", &showcd);
 ImGui::SameLine(120);
 CustomCheckbox("Hiện LSD", &hlsd);
 ImGui::SameLine(240);
 CustomCheckbox("Ẩn UID", &anudid);
 CustomCheckbox("Cam Xa", &lockcam);
 ImGui::SameLine(120);
 ImGui::PushItemWidth(220.0f);
 ImGui::SliderInt("##SliderView", &CameraHeight, 0.0f, 15.0f);
 ImGui::PopItemWidth();
 ImGui::Spacing();
 ImGui::EndGroupPanel();
 ImGui::Spacing();
 ImGui::EndChild();
 }
 ImGui::End();
 }
 ImDrawList* draw_list = ImGui::GetBackgroundDrawList();
 DrawESP(draw_list);
 ImGui::Render();
 ImDrawData* draw_data = ImGui::GetDrawData();
 ImGui_ImplMetal_RenderDrawData(draw_data, commandBuffer, renderEncoder);
 [renderEncoder popDebugGroup];
 [renderEncoder endEncoding];
 [commandBuffer presentDrawable:view.currentDrawable];
 }
 [commandBuffer commit];
}
/*đô nết

Ngân Hàng: Techcombank 
STK: 19036541702011 
Tên CTK : Bui Thi Cam Tien

*/
- (void)mtkView:(MTKView*)view drawableSizeWillChange:(CGSize)size {
}

- (void)updateIOWithTouchEvent:(UIEvent *)event {
 UITouch *anyTouch = event.allTouches.anyObject;
 CGPoint touchLocation = [anyTouch locationInView:self.view];
 ImGuiIO &io = ImGui::GetIO();
 io.MousePos = ImVec2(touchLocation.x, touchLocation.y);
 BOOL hasActiveTouch = NO;
 for (UITouch *touch in event.allTouches) {
 if (touch.phase != UITouchPhaseEnded && touch.phase != UITouchPhaseCancelled) {
 hasActiveTouch = YES;
 break;
 }
 }
 io.MouseDown[0] = hasActiveTouch;
}

ImDrawList* getDrawList() {
 ImDrawList *drawList;
 drawList = ImGui::GetBackgroundDrawList();
 return drawList;
};

void DrawAimbotTab() {
 static int selectedAimWhen = aimType;
 static int selecteddraw = drawType;
 const char* aimWhenOptions[] = {"Aim Máu Thấp %", "Aim Máu Thấp", "Aim Gần Nhất", "Aim Gần Tia"};
 ImGui::Combo("Aim Vào Óc Chó", &selectedAimWhen, aimWhenOptions, IM_ARRAYSIZE(aimWhenOptions));
 ImGui::Spacing();
 const char* drawOptions[] = {"No", "Luôn Bật", "Khi Xem"};
 ImGui::Combo("Vẽ Vật Thể", &selecteddraw, drawOptions, IM_ARRAYSIZE(drawOptions));
 aimType = selectedAimWhen;
 drawType = selecteddraw;
}

void DrawESP(ImDrawList *draw) {
}

@end
/*

Designer: Ttrieu dz
PROJECT FREE BÁN LÀM CHÓ
SHARE GHI NGUỒN NHÉ AE

đô nết me
Ngân Hàng: Techcombank 
STK: 19036541702011 
Tên CTK : Bui Thi Cam Tien

*/