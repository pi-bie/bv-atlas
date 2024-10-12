.places[zoom<10] { [place='city'][population>124999],
  [place='town'][population>99999]
  [zoom>=8][population>34999][incity=false][place!='village'][place!='suburb'][place!='quarter'] {
    /*::dots {
      marker-allow-overlap: true;
      marker-ignore-placement: true;
      marker-fill: white;
      marker-line-color: silver;
      marker-line-width: 2;
      [zoom<=7] { marker-width: 0.25*@place-node-small-z9; }
      [zoom=8] { marker-width: 0.5*@place-node-small-z9; }
      [zoom=9] { marker-width: 1*@place-node-small-z9; }
      [population>124999] {
        [zoom<=7] { marker-width: 0.25*@place-node-medium-z9; }
        [zoom=8] { marker-width: 0.5*@place-node-medium-z9; }
        [zoom=9] { marker-width: 1*@place-node-medium-z9; }
      }
      [population>499999] {
        marker-file: url('symbols/major-city.svg');
        marker-line-color: gray;
        marker-line-width: 1;
        marker-fill: silver;
        [zoom=9] { marker-width: 1*@place-node-large-z9; }
        [zoom=8] { marker-width: 0.5*@place-node-large-z9; }
        [zoom<=7] { marker-width: 0.25*@place-node-large-z9; }
      }
      [population>999999] {
        marker: none;
      }
    }*/
    ::dotlabel {
      shield-allow-overlap: true;
      //shield-ignore-placement: true;
      shield-file: url('symbols/town-node.svg');
      shield-unlock-image: true;
      [zoom<=7] { shield-transform: scale(0.25*@place-node-small-z9/25.5); }
      [zoom=8] { shield-transform: scale(0.5*@place-node-small-z9/25.5); }
      [zoom=9] { shield-transform: scale(1*@place-node-small-z9/25.5); }
      [population>124999] {
        [zoom<=7] { shield-transform: scale(0.25*@place-node-medium-z9/25.5); }
        [zoom=8] { shield-transform: scale(0.5*@place-node-medium-z9/25.5); }
        [zoom=9] { shield-transform: scale(1*@place-node-medium-z9/25.5); }
      }
      [population>499999] {
        shield-file: url('symbols/major-city.svg');
        [zoom=9] { shield-transform: scale(1*@place-node-large-z9/22); }
        [zoom=8] { shield-transform: scale(0.5*@place-node-large-z9/22); }
        [zoom<=7] { shield-transform: scale(0.25*@place-node-large-z9/22); }
      }
      shield-name: [name];
      shield-face-name: @font-sans;
      shield-fill: black;
      shield-halo-fill: @standard-halo-fill;
      shield-halo-radius: @standard-halo-radius * 1.25;
      [capital=true] {
		shield-halo-opacity: 0.6;
		shield-halo-fill: @bebaut;
		shield-halo-radius: 10;
      }
      shield-wrap-width: 60; // 5.0 em
      shield-line-spacing: -0.75; // -0.05 em
      shield-placement-type: simple;
      shield-placements: "N,E,S,W";
      [zoom<=7] {
        shield-size: 0.25*@place-label-small-z9;
        shield-text-dx: 0.6*0.25*@place-node-small-z9;
        shield-text-dy: 0.6*0.25*@place-node-small-z9;
      }
      [zoom=8] {
        shield-size: 0.5*@place-label-small-z9;
        shield-text-dx: 0.6*0.5*@place-node-small-z9;
        shield-text-dy: 0.6*0.5*@place-node-small-z9;
      }
      [zoom=9] {
        shield-size: 1*@place-label-small-z9;
        shield-text-dx: 0.6*1*@place-node-small-z9;
        shield-text-dy: 0.6*1*@place-node-small-z9;
      }
      [population>49999][zoom<=7] {shield-size: 0.25*@place-label-medium-z9; }
      [population>49999][zoom=8] {shield-size: 0.5*@place-label-medium-z9; }
      [population>49999][zoom=9] {shield-size: 1*@place-label-medium-z9; }
      [population>124999] { shield-face-name: @font-sans-bold; }
      [population>124999][zoom<=7] {
        shield-size: 0.25*@place-label-large-z9;
        shield-text-dx: 0.6*0.25*@place-node-medium-z9;
        shield-text-dy: 0.6*0.25*@place-node-medium-z9;
      }
      [population>124999][zoom=8] {
        shield-size: 0.5*@place-label-large-z9;
        shield-text-dx: 0.6*0.5*@place-node-medium-z9;
        shield-text-dy: 0.6*0.5*@place-node-medium-z9;
      }
      [population>124999][zoom=9] {
        shield-size: 1*@place-label-large-z9;
        shield-text-dx: 0.6*1*@place-node-medium-z9;
        shield-text-dy: 0.6*1*@place-node-medium-z9;
      }
      [population>499999][zoom<=7] {
        shield-size: 0.25*@place-label-huge-z9;
        shield-text-dx: 0.7*0.25*@place-node-large-z9;
        shield-text-dy: 0.7*0.25*@place-node-large-z9;
      }
      [population>499999][zoom=8] {
        shield-size: 0.5*@place-label-huge-z9;
        shield-text-dx: 0.7*0.5*@place-node-large-z9;
        shield-text-dy: 0.7*0.5*@place-node-large-z9;
      }
      [population>499999][zoom=9] {
        shield-size: 1*@place-label-huge-z9;
        shield-text-dx: 0.7*1*@place-node-large-z9;
        shield-text-dy: 0.7*1*@place-node-large-z9;
      }
      [capital=true] { shield-text-transform: uppercase; }
      [population>999999] {
        shield: none;
        text-name: [name];
        text-face-name: @font-sans;
        text-fill: black;
        text-halo-fill: @standard-halo-fill;
        text-halo-radius: @standard-halo-radius * 1.25;
        text-wrap-width: 60; // 5.0 em
        text-line-spacing: -0.75; // -0.05 em
        text-placement-type: simple;
        text-placements: "N,E,S,W";
        text-allow-overlap: true;
        text-size: 0.25*@place-label-huge-z9;
        [zoom=8] { text-size: 0.5*@place-label-huge-z9; }
        [zoom=9] { text-size: 1*@place-label-huge-z9; }
        [capital=true] {
          text-transform: uppercase;
          text-halo-opacity: 0.6;
          text-halo-fill: @bebaut;
          text-halo-radius: 10;
	}
      }
    }
}}

.places[zoom>=10] { [name!='Mitte'][name!='Zentrum'][name!='Innenstadt'][name!='Altstadt'] {
  [place='city'][population>=@place-pop-huge-z12],
  [zoom>=9][place='city'],
  [zoom>=10][place='town'],
  [zoom>=11][place='village'],
 // [zoom>=13][place='hamlet'],
  [zoom>=11][place='suburb'][incity=true],
  [zoom>=12][place='suburb'][aslabel>0],
  [zoom>=12][place='quarter'][incity=true] {
    ::dotlabel { [incity=false][place!='quarter'][aslabel>0],
       [incity=false][place!='quarter'][place!='suburb'] {
     debug-mode: vertex;
     shield-name: [name];
     shield-fill: black;
     shield-face-name: @font-sans-italic;
     shield-halo-fill: @standard-halo-fill;
     shield-halo-radius: @standard-halo-radius * 1.25;
     shield-wrap-width: 60; // 5.0 em
     shield-line-spacing: -0.75; // -0.05 em
     [place='village'],[place='suburb'] {
       //shield-wrap-before: true;
       shield-wrap-width: 40; // 5.0 em
       shield-line-spacing: -0.60; // -0.05 em
     }
     [place='suburb'][population>=@place-pop-medium-z12] {shield-face-name: 'Helvetica Neue Bold','Noto Sans Bold'; }
     shield-file: url('symbols/town-node.svg');
     [hwtype='primary'] { shield-file: url('symbols/town-node_primary.svg'); }
     shield-unlock-image: true;
     shield-size: 0.25*@place-label-tiny-z12;
     shield-transform: scale(0.25);
     [zoom=11] {
       shield-transform: scale(0.5);
       shield-size: 0.5*@place-label-tiny-z12;
     }
     [zoom>=12] {
       shield-transform: none;
       shield-size: 1*@place-label-tiny-z12;
     }
     [place!='suburb'] {
       [population>=@place-pop-smaller-z12] {
         shield-face-name: @font-sans-bold;
         [zoom=10] {shield-size: 0.25*@place-label-smaller-z12; }
         [zoom=11] {shield-size: 0.5*@place-label-smaller-z12; }
         [zoom>=12] {shield-size: 1*@place-label-smaller-z12; }
       }
       [population>=@place-pop-small-z12] {
         [zoom=10] {shield-size: 0.25*@place-label-small-z12; }
         [zoom=11] {shield-size: 0.5*@place-label-small-z12; }
         [zoom>=12] {shield-size: 1*@place-label-small-z12; }
       }
       [population>=@place-pop-medium-z12] {
         shield-allow-overlap: true;
         shield-face-name: @font-sans-bold;
         [zoom=10] {shield-size: 0.25*@place-label-medium-z12; }
         [zoom=11] {shield-size: 0.5*@place-label-medium-z12; }
         [zoom>=12] {shield-size: 1*@place-label-medium-z12; }
       }
     }
     shield-placement-type: simple;
     shield-placements: "N,NE"; //,NE,E,SE,S,SW,W,NW";
     [ldir >= 22.5][ldir < 67.5] { shield-placements: "NE,E"; }
     [ldir >= 67.5][ldir < 112.5] { shield-placements: "E,SE"; }
     [ldir >= 112.5][ldir < 157.5] { shield-placements: "SE,S"; }
     [ldir >= 157.5][ldir < 202.5] { shield-placements: "S,SW"; }
     [ldir >= 202.5][ldir < 247.5] { shield-placements: "SW,W"; }
     [ldir >= 247.5][ldir < 292.5] { shield-placements: "W,W"; }
     [ldir >= 292.5][ldir < 337.5] { shield-placements: "NW,N"; }
     [ldir >= 112.5][ldir <= 247.5],[ldir>=292.5],[ldir<=67.5] {
       //text-align: center;
       shield-horizontal-alignment: middle;
     }
     shield-text-dx: 0.75*0.25*@place-node-small-z12;
     shield-text-dy: 0.75*0.25*@place-node-small-z12;
     [zoom=11] {
       shield-text-dx: 0.75*0.5*@place-node-small-z12;
       shield-text-dy: 0.75*0.5*@place-node-small-z12;
     }
     [zoom>=12] {
       shield-text-dx: 0.75*1*@place-node-small-z12;
       shield-text-dy: 0.75*1*@place-node-small-z12;
     }
     [population>=@place-pop-small-z12] {
       shield-transform: scale(0.25*@place-node-large-z12/@place-node-small-z12);
       shield-text-dx: 0.75*0.25*@place-node-large-z12;
       shield-text-dy: 0.75*0.25*@place-node-large-z12;
       [zoom=11] {
         shield-transform: scale(0.5*@place-node-large-z12/@place-node-small-z12);
         shield-text-dx: 0.75*0.5*@place-node-large-z12;
         shield-text-dy: 0.75*0.5*@place-node-large-z12;
        }
        [zoom>=12] {
          shield-transform: scale(@place-node-large-z12/@place-node-small-z12);
          shield-text-dx: 0.75*1*@place-node-large-z12;
          shield-text-dy: 0.75*1*@place-node-large-z12;
        }
     }
    } }
    /*::dots { [incity=false][place!='quarter'][aslabel>0],
          [incity=false][place!='quarter'][place!='suburb'] {
      marker-allow-overlap: true;
      marker-ignore-placement: true;
      marker-fill: white;
      marker-line-color: silver;
      marker-line-width: 2;
      [hwtype='primary'] {
        marker-line-color: @fernrot;
        marker-line-width: 1.5;
      }
      [population<@place-pop-small-z12] {
        marker-width: 0.25*@place-node-small-z12;
        [zoom=11] { marker-width: 0.5*@place-node-small-z12; }
        [zoom>=12] { marker-width: 1*@place-node-small-z12; }
      }
      [population>=@place-pop-small-z12] {
        marker-width: 0.25*@place-node-large-z12;
        [zoom=11] { marker-width: 0.5*@place-node-large-z12; }
        [zoom>=12] { marker-width: 1*@place-node-large-z12; }
      }
    } }*/
    ::label[incity=true] {
    debug-mode: vertex;
      //text-clip: true;
      //text-allow-overlap: true;
      text-name: [name];
      text-face-name: @font-sans;
      text-fill: black;
      text-halo-fill: @standard-halo-fill;
      text-halo-radius: @standard-halo-radius * 1.25;
      text-wrap-width: 60; // 5.0 em
      text-line-spacing: -0.75; // -0.05 em
      text-placement-type: simple;
      text-placements: "N,NE"; //,NE,E,SE,S,SW,W,NW";
      [ldir >= 22.5][ldir < 67.5] { text-placements: "NE,E"; }
      [ldir >= 67.5][ldir < 112.5] { text-placements: "E,SE"; }
      [ldir >= 112.5][ldir < 157.5] { text-placements: "SE,S"; }
      [ldir >= 157.5][ldir < 202.5] { text-placements: "S,SW"; }
      [ldir >= 202.5][ldir < 247.5] { text-placements: "SW,W"; }
      [ldir >= 247.5][ldir < 292.5] { text-placements: "W,W"; }
      [ldir >= 292.5][ldir < 337.5] { text-placements: "NW,N"; }
      /*[incity=false][place!='quarter'][aslabel>0],
      [incity=false][place!='quarter'][place!='suburb'] {
        [ldir >= 112.5][ldir <= 247.5],[ldir>=292.5],[ldir<=67.5] {
            //text-align: center;
            text-horizontal-alignment: middle;}
        text-dx: 0.75*0.25*@place-node-small-z12;
        text-dy: 0.75*0.25*@place-node-small-z12;
        [zoom=11] {
          text-dx: 0.75*0.5*@place-node-small-z12;
          text-dy: 0.75*0.5*@place-node-small-z12;
        }
        [zoom>=12] {
          text-dx: 0.75*1*@place-node-small-z12;
          text-dy: 0.75*1*@place-node-small-z12;
        }
        [population>=@place-pop-small-z12] {
          text-dx: 0.75*0.25*@place-node-large-z12;
          text-dy: 0.75*0.25*@place-node-large-z12;
          [zoom=11] {
            text-dx: 0.75*0.5*@place-node-large-z12;
            text-dy: 0.75*0.5*@place-node-large-z12;
          }
          [zoom>=12] {
            text-dx: 0.75*1*@place-node-large-z12;
            text-dy: 0.75*1*@place-node-large-z12;
          }
        }
      } */
      //text-margin: 20; //10.5; // 0.7 em
      //text-label-position-tolerance: 20;
      [place='suburb'],[place='quarter'],[population<@place-pop-smaller-z12] {
        text-simplify-algorithm: radial-distance;
        text-repeat-distance: 256;
        text-face-name: 'Helvetica Neue Italic','Noto Sans Italic';
        [population>=@place-pop-medium-z12] { text-face-name: 'Helvetica Neue Bold Italic','Noto Sans Bold Italic'; }
        [zoom=10] { text-size: 0.25*@place-label-tiny-z12; }
        [zoom=11] { text-size: 0.5*@place-label-tiny-z12; }
        [zoom>=12] { text-size: 1*@place-label-tiny-z12; }
      }
      [place!='suburb'][place!='quarter'] {
        [population>=@place-pop-smaller-z12] {
          text-face-name: 'Helvetica Neue Bold','Noto Sans Bold';
          [zoom=10] {text-size: 0.25*@place-label-smaller-z12; }
          [zoom=11] {text-size: 0.5*@place-label-smaller-z12; }
          [zoom>=12] {text-size: 1*@place-label-smaller-z12; }
        }
        [population>=@place-pop-small-z12] {
          [zoom=10] {text-size: 0.25*@place-label-small-z12; }
          [zoom=11] {text-size: 0.5*@place-label-small-z12; }
          [zoom>=12] {text-size: 1*@place-label-small-z12; }
        }
        [population>=@place-pop-medium-z12] {
          text-allow-overlap: true;
          text-face-name: 'Helvetica Neue Bold','Noto Sans Bold';
          [zoom=10] {text-size: 0.25*@place-label-medium-z12; }
          [zoom=11] {text-size: 0.5*@place-label-medium-z12; }
          [zoom>=12] {text-size: 1*@place-label-medium-z12; }
        }
        [population>=@place-pop-large-z12] {
          [zoom=10] {text-size: 0.25*@place-label-large-z12; }
          [zoom=11] {text-size: 0.5*@place-label-large-z12; }
          [zoom>=12] {text-size: 1*@place-label-large-z12; }
        }
        [population>=@place-pop-huge-z12] {
          text-allow-overlap: true;
          [zoom=10] {text-size: 0.25*@place-label-huge-z12; }
          [zoom=11] {text-size: 0.5*@place-label-huge-z12; }
          [zoom>=12] {text-size: 1*@place-label-huge-z12; }
        }
        [population>=1000000],[capital=true] {
          text-transform: uppercase;
        }
      }
      [place='village'],[place='suburb'],[place='quarter'],[place='hamlet'] {
        //text-wrap-before: true;
        text-wrap-width: 40; // 5.0 em
        text-line-spacing: -0.60; // -0.05 em
      }
    }
  }
} }
