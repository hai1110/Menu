std::vector<unsigned char> Base64Decode(const std::string &in) {
    std::string base64_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    std::vector<unsigned char> out;
    std::vector<int> T(256, -1);
    for (int i = 0; i < 64; i++) T[base64_chars[i]] = i;

    int val = 0, valb = -8;
    for (unsigned char c : in) {
        if (T[c] == -1) break;
        val = (val << 6) + T[c];
        valb += 6;
        if (valb >= 0) {
            out.push_back(char((val >> valb) & 0xFF));
            valb -= 8;
        }
    }
    return out;
}
#include <vector>
#include "Logo.h"        // Thư viện Base64 bạn đang dùng
#include "stb_image.h"     // Để load ảnh từ buffer

id<MTLTexture> LoadTextureFromBase64(id<MTLDevice> device, const std::string& base64) {
    // 1. Giải mã Base64 thành dữ liệu nhị phân
    std::vector<unsigned char> decodedData = Base64Decode(base64);

    // 2. Load ảnh từ bộ nhớ
    int width, height, channels;
    unsigned char* imageData = stbi_load_from_memory(decodedData.data(), decodedData.size(), &width, &height, &channels, 4);
    if (!imageData) {
        NSLog(@"[Error] Failed to load image from Base64");
        return nil;
    }

    // 3. Tạo descriptor cho texture
    MTLTextureDescriptor* descriptor = [[MTLTextureDescriptor alloc] init];
    descriptor.pixelFormat = MTLPixelFormatRGBA8Unorm;
    descriptor.width = width;
    descriptor.height = height;
    descriptor.usage = MTLTextureUsageShaderRead;

    // 4. Tạo texture Metal
    id<MTLTexture> texture = [device newTextureWithDescriptor:descriptor];
    if (texture) {
        // Sao chép dữ liệu ảnh vào texture
        MTLRegion region = {{0, 0, 0}, {static_cast<NSUInteger>(width), static_cast<NSUInteger>(height), 1}};
        [texture replaceRegion:region mipmapLevel:0 withBytes:imageData bytesPerRow:width * 4];
    } else {
        NSLog(@"[Error] Failed to create texture");
    }

    // 5. Giải phóng bộ nhớ ảnh
    stbi_image_free(imageData);

    return texture;
}
