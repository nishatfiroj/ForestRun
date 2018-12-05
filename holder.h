
//{{BLOCK(holder)

//======================================================================
//
//	holder, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 1024 tiles not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 32768 + 2048 = 35328
//
//	Time-stamp: 2018-11-11, 18:44:11
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_HOLDER_H
#define GRIT_HOLDER_H

#define holderTilesLen 32768
extern const unsigned short holderTiles[16384];

#define holderMapLen 2048
extern const unsigned short holderMap[1024];

#define holderPalLen 512
extern const unsigned short holderPal[256];

#endif // GRIT_HOLDER_H

//}}BLOCK(holder)
