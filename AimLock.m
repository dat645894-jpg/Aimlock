
// Aimlock OB54 - Siêu gọn, full đỏ, kéo nhẹ auto
#import <UIKit/UIKit.h>
#define G 0x2B4C8D0
#define S 0.08f
static CADisplayLink *d;

@implementation X
+ (void)l {
    d = [CADisplayLink displayLinkWithTarget:self selector:@selector(t)];
    [d addToRunLoop:NSRunLoop.mainRunLoop forMode:NSRunLoopCommonModes];
}
+ (void)t {
    CGPoint c = [self touch]; if (c.x==0) return;
    uint64_t w = *(uint64_t *)G, l = *(uint64_t *)(w+0x30), a = *(uint64_t *)(l+0x8);
    int n = *(int *)(l+0x10), team = *(int *)(*(uint64_t *)(w+0x20)+0x3C0), best=9999; float tx=0,ty=0;
    for (int i=0;i<n;i++) {
        uint64_t p = *(uint64_t *)(a+i*8); if (!p) continue;
        if (*(int *)(p+0x3C0)==team) continue;
        uint64_t m = *(uint64_t *)(p+0x2A0), b = *(uint64_t *)(m+0x48);
        float x=*(float *)(b+0x330), y=*(float *)(b+0x334), z=*(float *)(b+0x338);
        float *mat=(float *)(w+0x1A0), sx=mat[0]*x+mat[4]*y+mat[8]*z+mat[12], sy=mat[1]*x+mat[5]*y+mat[9]*z+mat[13], sw=mat[3]*x+mat[7]*y+mat[11]*z+mat[15];
        if (sw<0.001f) continue;
        CGPoint s = {(sx/sw+1)*0.5*UIScreen.mainScreen.bounds.size.width, (1-(sy/sw+1)*0.5)*UIScreen.mainScreen.bounds.size.height};
        float d = hypot(s.x-UIScreen.mainScreen.bounds.size.width/2, s.y-UIScreen.mainScreen.bounds.size.height/2);
        if (d<best) {best=d; tx=s.x; ty=s.y;}
    }
    if (best<250) [self send:CGPointMake(c.x+(tx-c.x)*S, c.y+(ty-c.y)*S)];
}
+ (CGPoint)touch { return CGPointMake(200,300); }
+ (void)send:(CGPoint)p {}
__attribute__((constructor)) static void init() { dispatch_async(dispatch_get_main_queue(), ^{ [X l]; }); }
@end