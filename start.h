
//{{BLOCK(start)

//======================================================================
//
//	start, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 1024 tiles not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 32768 + 2048 = 35328
//
//	Time-stamp: 2018-12-03, 14:09:23
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_START_H
#define GRIT_START_H

#define startTilesLen 32768
extern const unsigned short startTiles[16384];

#define startMapLen 2048
extern const unsigned short startMap[1024];

#define startPalLen 512
extern const unsigned short startPal[256];

#endif // GRIT_START_H

//}}BLOCK(start)
