#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
//field music : sound
//field pitch : number
//field loopPart : number
//field loopStart : number
//field loop : bool

if (!process_exists("Spotify.exe") || process_exists("Spotify.exe") && (window_exists("Spotify Free") || window_exists("Spotify Premium"))) {
    PlayMusic(music, pitch, loopPart, loopStart, loop);
}
