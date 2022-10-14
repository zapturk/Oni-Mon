/// @description setup
able = 1;
//menu
menu = 0;
select = 0;
scroll = 0;
page = -1;
subpage = 0;
fade = 0;
//fonts
Primary_Font = fMonogram;
F_SmallFont = font_add_sprite(sSmallFont, ord(" "),0,1);

// Monogram by Datagoblin
// https://datagoblin.itch.io/monogram
// twitter: @vmenezio

// All other code and assets created by Myles McCoy
// https://somfunambulist.itch.io/
// twitter: @witch_warren

///catalog
var n;

for(n=0;n<150;n+=1) {
    catalog[n,0] = "----";
    catalog[n,1] = oniBlank;
    }

//-------------------copy and paste this box and change 'n' to add new monster--------------------------
n=0;                                                                            // catalog number -1   |
catalog[n,0] = "Lensy";                                                         // name                |
catalog[n,1] = oniLensy;                                                        // sprite name         |
catalog[n,2] = make_colour_rgb(25, 30, 60);                                     // darkest color       |
catalog[n,3] = make_colour_rgb(85, 100, 125);                                   // mid color           |
catalog[n,4] = make_colour_rgb(165, 190, 205);                                  // light color         |
catalog[n,8] = "Magnifying";                                                    // creature type       |
catalog[n,9] = "A nurturer at heart, they pride themselves in helping others."; // description page 1  |
catalog[n,10] = "It is their mission to help people see things more clearly.";  // description page 2  |
//------------------------------------------------------------------------------------------------------
//-------------------copy and paste this box and change 'n' to add new monster--------------------------
n=1;                                                                            // catalog number -1   |
catalog[n,0] = "Plank";                                                         // name                |
catalog[n,1] = oniGrassStarter;                                                 // sprite name         |
catalog[n,2] = make_colour_rgb(25, 30, 60);                                     // darkest color       |
catalog[n,3] = make_colour_rgb(85, 100, 125);                                   // mid color           |
catalog[n,4] = make_colour_rgb(165, 190, 205);                                  // light color         |
catalog[n,8] = "Wood Plank";                                                    // creature type       |
catalog[n,9] = "A nurturer at heart, they pride themselves in helping others."; // description page 1  |
catalog[n,10] = "It is their mission to help people see things more clearly.";  // description page 2  |
//------------------------------------------------------------------------------------------------------

//if you skip any numbers for n, they will show up as empty 'undiscovered' slots
//-------------------copy and paste this box and change 'n' to add new monster--------------------------
n=5;                                                                            // catalog number -1   |
catalog[n,0] = "Orb";                                                           // name                |
catalog[n,1] = oniOrb;                                                           // sprite name         |
catalog[n,2] = make_colour_rgb(65, 0, 65);                                      // darkest color       |
catalog[n,3] = make_colour_rgb(170, 20, 60);                                    // mid color           |
catalog[n,4] = make_colour_rgb(240, 105, 35);                                   // light color         |
catalog[n,8] = "Shape";                                                         // creature type       |
catalog[n,9] = "This orb is mostly just here to show how to add a 2nd monster.";// description page 1  |
catalog[n,10] = "Page 2";                                                       // description page 2  |
//------------------------------------------------------------------------------------------------------

