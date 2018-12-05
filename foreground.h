
//{{BLOCK(foreground)

//======================================================================
//
//	foreground, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 2048 tiles not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 65536 + 4096 = 70144
//
//	Time-stamp: 2018-12-03, 15:22:55
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_FOREGROUND_H
#define GRIT_FOREGROUND_H

#define foregroundTilesLen 65536
extern const unsigned short foregroundTiles[32768];

#define foregroundMapLen 4096
extern const unsigned short foregroundMap[2048];

#define foregroundPalLen 512
extern const unsigned short foregroundPal[256];

#endif // GRIT_FOREGROUND_H

//}}BLOCK(foreground)
