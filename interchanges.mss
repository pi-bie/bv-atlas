#airports {
  [aerodrome='international'],[zoom>=10][name~'Flughafen'] {
    marker-file: url('symbols/flughafen.png');
    [aerodrome='international'] { marker-file: url('symbols/airport_international.png'); }
    [aerodrome='regional'] { marker-file: url('symbols/airport_national.png'); }
    marker-height: 0.25*@airport-marker-size-z12;
    [zoom<=7] { marker-height: 0.25*@airport-marker-size-z9; }
    [zoom=8] { marker-height: 0.5*@airport-marker-size-z9; }
    [zoom=9] { marker-height: @airport-marker-size-z9; }
    [zoom=11] { marker-height: 0.5*@airport-marker-size-z12; }
    [zoom>=12] { marker-height: @airport-marker-size-z12; }
    marker-fill:#f45;
    marker-line-color:#813;
    marker-allow-overlap: true;
    //marker-ignore-placement: false;
  }
}

#services[zoom>=10] { [fuel>0],[atmwy='yes'],[name=~'Autohof'] {
  ::service {
    marker-file: url('symbols/raststaette.svg');
    marker-height: 0.25*@services-height-z12;
    [zoom=11] { marker-height: 0.5*@services-height-z12; }
    [zoom>=12] { marker-height: 1*@services-height-z12; }
    [motel>0] {
      marker-file: url('symbols/motel.svg');
      /*marker-height: 0.25*38.4;
      [zoom=11] { marker-height: 0.5*38.4; }
      [zoom>=12] { marker-height: 1*38.4; }*/
    }
    marker-allow-overlap: true;
    [fuel=0] {
      [zoom<=10] {marker-transform: translate(0.25*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dircos],
          0.25*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dirsin]); }
      [zoom=11] { marker-transform: translate(0.5*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dircos],
          0.5*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dirsin]); }
      [zoom>=12] { marker-transform: translate(1*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dircos],
          1*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dirsin]); }
      [hwdir=null] { marker-transform: translate(0,0); }
    }
    [fuel>0] {
      marker-transform: translate(0.25*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dircos]+0.5*0.3*@services-height-z12*[dirsin],
        0.25*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dirsin]-0.5*0.3*@services-height-z12*[dircos]);
      [zoom=11] { marker-transform: translate(0.5*([dircos]*(0.5*@motorway-width-z12+0.5*@services-height-z12)+0.71*0.42*@services-height-z12*[dirsin]),
        0.5*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dirsin]-0.71*0.42*@services-height-z12*[dircos]); }
      [zoom>=12] { marker-transform: translate(1*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dircos]+1*0.6*@services-height-z12*[dirsin],
        1*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dirsin]-1*0.6*@services-height-z12*[dircos]); }
      [hwdir=null] {
        marker-transform: translate(0.25*0.55*@services-height-z12,0);
        [zoom=11] { marker-transform: translate(0.5*0.55*@services-height-z12,0); }
        [zoom>=12] { marker-transform: translate(1*0.55*@services-height-z12,0); }
      }
    }
  }
  ::fuel[fuel>0] {
    marker-file: url('symbols/tankstelle.svg');
    marker-height: 0.25*@services-height-z12;
    marker-allow-overlap: true;
    marker-transform: translate(0.25*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dircos]-0.5*0.3*@services-height-z12*[dirsin],
      0.25*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dirsin]+0.5*0.3*@services-height-z12*[dircos]);
    [zoom=11] { marker-transform: translate(0.5*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dircos]-0.71*0.42*@services-height-z12*[dirsin],
      0.5*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dirsin]+0.71*0.42*@services-height-z12*[dircos]);
      marker-height: 0.5*@services-height-z12;
    }
    [zoom>=12] { marker-transform: translate(1*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dircos]-[dirsin]*0.6*@services-height-z12,
      1*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dirsin]+[dircos]*0.6*@services-height-z12);
      marker-height: 1*@services-height-z12;
    }
    [hwdir=null] {
        marker-transform: translate(-0.25*0.55*@services-height-z12,0);
        [zoom=11] { marker-transform: translate(-0.5*0.55*@services-height-z12,0); }
        [zoom>=12] { marker-transform: translate(-1*0.55*@services-height-z12,0); }
      }
  }
  ::label[zoom>=11] {
    text-name: [name];
    text-face-name: 'Helvetica Neue Medium';
    text-wrap-character: " ";
    text-vertical-alignment: middle;
    text-horizontal-alignment: right;
    [hwdir<225][hwdir>45] { text-horizontal-alignment: left; }
    text-wrap-width: 0.25*3*@services-height-z12;
    text-size: 0.25*@services-label-z12;
    [zoom=11] { text-wrap-width: 0.5*3*@services-height-z12;
      text-size: 0.5*@services-label-z12; } 
    [zoom>=12] { text-wrap-width: 0.5*3*@services-height-z12; 
      text-size: @services-label-z12; } 
    text-line-spacing: -1.5; // -0.15 em     
    text-allow-overlap: true;
    [fuel=0] {
      text-dx: 0.25*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dircos]+0.25*0.6*@services-height-z12;
      [hwdir<225][hwdir>45] { text-dx: 0.25*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dircos]-0.25*0.6*@services-height-z12; }
      text-dy: 0.25*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dirsin];
      [zoom=11] {
        text-dx: 0.5*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dircos]+0.5*0.6*@services-height-z12;
        [hwdir<225][hwdir>45] { text-dx: 0.5*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dircos]-0.5*0.6*@services-height-z12; }
        text-dy: 0.5*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dirsin];
      }
      [zoom>=12] {
        text-dx: 1*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dircos]+1*0.6*@services-height-z12;
        [hwdir<225][hwdir>45] { text-dx: 1*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dircos]-1*0.6*@services-height-z12; }
        text-dy: 1*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dirsin];
      }
    }
    [fuel>0] {
      text-dx: 0.25*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dircos]+0.5*0.3*@services-height-z12*[dirsin]+0.25*0.6*@services-height-z12;
      [hwdir<225][hwdir>45] { text-dx: 0.25*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dircos]+0.5*0.3*@services-height-z12*[dirsin]-0.25*0.6*@services-height-z12; }
      text-dy: 0.25*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dirsin]-0.5*0.3*@services-height-z12*[dircos];
      [zoom=11] {
        text-dx: 0.5*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dircos]+0.71*0.42*@services-height-z12*[dirsin]+0.5*0.6*@services-height-z12;
        [hwdir<225][hwdir>45] { text-dx: 0.5*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dircos]+0.71*0.42*@services-height-z12*[dirsin]-0.5*0.6*@services-height-z12; }
        text-dy: 0.5*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dirsin]-0.71*0.42*@services-height-z12*[dircos];
      }
      [zoom>=12] {
        text-dx: 1*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dircos]+1*0.6*@services-height-z12*[dirsin]+1*0.6*@services-height-z12;
        [hwdir<225][hwdir>45] { text-dx: 1*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dircos]+1*0.6*@services-height-z12*[dirsin]-1*0.6*@services-height-z12; }
        text-dy: 1*(0.5*@motorway-width-z12+0.5*@services-height-z12)*[dirsin]-1*0.6*@services-height-z12*[dircos];
      }
    }
  }
} }

#junctions [zoom>=10] {
    ::node[zoom>=10] {
      marker-fill: white;
      marker-width: 5;
      [zoom>=12] {marker-width: 16; }
      [zoom=11] {marker-width: 8; }
      marker-line-color: @autobahn;
      marker-line-width: 0.4;
      marker-allow-overlap: true;
      marker-ignore-placement: true;
    }
    ::reflabel[zoom>=11] {
      //text-avoid-edges: true;
      shield-file: url('shields/Anschlussstelle.svg');
      shield-transform: scale(0.5);
      shield-name: [ref];
      shield-fill: white;
      shield-face-name: 'Helvetica Neue Medium';
      /*text-halo-fill: @autobahn;*/
      shield-placement-type: simple;
      shield-placements: "N,NE,NW";
      shield-size: 11; //text-halo-radius: 5;
      shield-text-dy: 15;
      [zoom>=12] {
        shield-transform: scale(1);
        shield-size: 22; //text-halo-radius: 14; 
        shield-text-dy: 31; //text-repeat-distance: 300;
      }
/*      [zoom=11] { 
        shield-transform: scale(0.5);
        shield-size: 11; //text-halo-radius: 7; 
        shield-dy: 15;
      } */
      [northsouth=1] {
        shield-placements: "W,NW,SW";
        shield-text-dy: 0;
        shield-text-dx: 15; 
        //[zoom=11] {shield-dx: 15; }
        [zoom>=12] {shield-text-dx: 31; }
      }
      //text-repeat-distance: 150;
      shield-wrap-character: ";";
      //text-repeat-wrap-character: false;
      shield-wrap-width: 2; // effectively break after every wrap character
      shield-line-spacing: -1.5; // -0.15 em      
      //text-allow-overlap: true;
    }
    ::namelabel[zoom>=12] {
      //debug-mode: collision;
      //text-avoid-edges: true;
      text-name: [name];
      text-fill: @autobahn;
      text-placement-type: simple;
      text-dy: 25;
      text-placements: "S,SW,SE";
      [northsouth=1] {text-placements: "E,SE,NE"; text-dy: 0; text-dx: 25; }
      text-face-name: 'Helvetica Neue Medium';
      text-halo-fill: silver;
      text-halo-radius: 1;      
      text-size: @exitname-size-z12;
      //text-label-position-tolerance: 22;
      text-repeat-distance: 256;
      //[zoom>=12] { text-repeat-distance: 500; }
      text-wrap-character: ";";
      //text-wrap-character: "/";
      //text-wrap-character: "-";
      text-wrap-width: 2; // effectively break after every wrap character
      text-line-spacing: -1.5; // -0.15 em      
      //text-allow-overlap: true;
    }
}

#detours::label[zoom>=11] {
  text-name: [ref];
  text-fill: @autobahn;
  text-size: 7;
  text-face-name: 'Helvetica Neue Medium';
  text-placement: line;
  text-spacing: 128;
  text-dy: 0.5*(0.5*@primary-width-z12);
  //text-upright: left;
  [zoom>=12] {
    text-dy: 1*(0.5*@primary-width-z12);
    text-size: 14;
  }
  [nref=1] { 
    //text-upright: auto-down;
    //text-upright: right;
    text-dy: -0.5*(0.5*@primary-width-z12);
    [zoom>=12] { text-dy: 1*(0.5*@primary-width-z12); }
  }
}

#stations[zoom>=10] { //[railway='station'] {
  marker-file: url('symbols/Bahnhof.svg');
  marker-fill: black;
  [orientation != null] { marker-transform: rotate([orientation]-90); }
  marker-width: 0.25*@station-width-z12;
  marker-height: 0.25*@station-width-z12*@station-ratio;
  //marker-offset: 0.5*@railway-width-z12+0.5*0.25*@station-width-z12;
  [zoom=11] { 
    marker-width: 0.5*@station-width-z12;
    marker-height: 0.5*@station-width-z12*@station-ratio;
    //marker-offset: 0.5*@railway-width-z12+0.5*0.5*@station-width-z12;
  }
  [zoom>=12] { 
    marker-width: @station-width-z12;
    marker-height: @station-width-z12*@station-ratio;
    //marker-offset: @railway-width-z12+0.5*1*@station-width-z12;
  }
  marker-allow-overlap: true;
  marker-ignore-placement: true;
}
