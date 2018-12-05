
//{{BLOCK(backbackground)

//======================================================================
//
//	backbackground, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 2048 tiles not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 65536 + 4096 = 70144
//
//	Time-stamp: 2018-12-02, 11:29:23
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BACKBACKGROUND_H
#define GRIT_BACKBACKGROUND_H

#define backbackgroundTilesLen 65536
extern const unsigned short backbackgroundTiles[32768];

#define backbackgroundMapLen 4096
extern const unsigned short backbackgroundMap[2048];

#define backbackgroundPalLen 512
extern const unsigned short backbackgroundPal[256];

#endif // GRIT_BACKBACKGROUND_H

//}}BLOCK(backbackground)
