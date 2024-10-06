#main-roads {
  [zoom>=10][tunnel='yes'][prevtunnels=0]::tunnel-portal {
      [highway='motorway'],[highway='trunk'],[railway='rail'] {
      /*debug/marker-placement: vertex-first;
      debug/marker-allow-overlap: true;
      debug/marker-width: 40;
      debug/marker-height: 40;
      debug/marker-allow-overlap: true;*/
      in/marker-file: url('symbols/tunnelportal.svg');
      in/marker-transform: 'scale(0.025) translate(-85,0) rotate(90)';
      [zoom=11] { in/marker-transform: 'scale(0.05) translate(-85,0) rotate(90)'; }
      [zoom>=12] { in/marker-transform: 'scale(0.1) translate(-85,0) rotate(90)'; }
      in/marker-placement: vertex-first;
      in/marker-allow-overlap: true;
      in/marker-ignore-placement: true;
      in/marker-line-color: black;
      [railway='rail'] {
        in/marker-transform: 'scale(0.0125) translate(-85,0) rotate(90)';
        [zoom=11] { in/marker-transform: 'scale(0.025) translate(-85,0) rotate(90)'; }
        [zoom>=12] { in/marker-transform: 'scale(0.05) translate(-85,0) rotate(90)'; }
      }
      [highway='trunk'] { in/marker-line-color: @fernrot; }
      [highway='motorway'][reftype='A'] { in/marker-line-color: @autobahn; }
    }
  }
  [zoom>=10][tunnel='yes'][nexttunnels=0]::tunnel-portal {
      [railway='rail'] {
      /*debug/marker-placement: vertex-last;
      debug/marker-allow-overlap: true;
      debug/marker-width: 40;
      debug/marker-height: 40;
      debug/marker-allow-overlap: true;*/
      out/marker-file: url('symbols/tunnelportal.svg');
      out/marker-transform: 'scale(0.025) rotate(-90)';
      [zoom=11] { out/marker-transform: 'scale(0.05) rotate(-90)'; }
      [zoom>=12] { out/marker-transform: 'scale(0.1) rotate(-90)'; }
      out/marker-placement: vertex-last;
      out/marker-allow-overlap: true;
      out/marker-ignore-placement: true;
      out/marker-line-color: black;
      [railway='rail'] {
        out/marker-transform: 'scale(0.0125) rotate(-90)';
        [zoom=11] { out/marker-transform: 'scale(0.025) rotate(-90)'; }
        [zoom>=12] { out/marker-transform: 'scale(0.05) rotate(-90)'; }
      }
      [highway='trunk'] { in/marker-line-color: @fernrot; }
      [highway='motorway'][reftype='A'] { in/marker-line-color: @autobahn; }
    }
  }
  ::casing {
    [zoom>=10][tunnel='yes'][highway='motorway'] {
      line-color: @autobahn;
      //line-cap: round;
      line-width: 0.25*@motorway-casing-z12;
      [zoom=11] { line-width: 0.5*@motorway-casing-z12; }
      [zoom>=12] { line-width: 1*@motorway-casing-z12; }
    }
    [zoom>=10][tunnel='yes'][highway='trunk'][zoom>=8] { 
      line-color: @fernrot;
      line-cap: round;
      line-width: 0.25*@trunk-casing-z12;
      [zoom=11] { line-width: 0.5*@trunk-casing-z12; }
      [zoom>=12] { line-width: 1*@trunk-casing-z12; }
    }
    [highway='trunk'][zoom<8][lref!=1] {
      line-color: @nebenstrasse;
      line-width: 0.5*@secondary-casing-z8;
    }
    [highway='primary'][zoom<9][lref!=1] {
      line-color: @nebenstrasse;
      line-width: @secondary-casing-z9;
      [zoom=8] { line-width: @secondary-casing-z8; }
      [zoom<=7] { line-width: 0.5*@secondary-casing-z8; }
    }
    [highway='secondary'][zoom>=10] {
      line-width: 0.25*@secondary-width-z12;
      line-color: @nebenstrasse;
      //line-smooth: 1;
      line-gamma: 0.8;
      line-rasterizer: fast;
      [zoom=11] { line-width: 0.5*@secondary-width-z12; }
      [zoom>=12] { line-width: 1*@secondary-width-z12; }
    }
  }
  ::fill {
    [highway='motorway'][reftype='A'] {
      line-color: @autobahn;
      line-join: round;
      //line-cap: square;
      line-width: 0.5*@motorway-casing-z8;
      [zoom=8] { line-width: @motorway-casing-z8; }
      [zoom=9] { line-width: @motorway-casing-z9; }
      [zoom=10] { line-width: 0.25*@motorway-casing-z12; }
      [zoom=11] { line-width: 0.5*@motorway-casing-z12; }
      [zoom>=12] { line-width: 1*@motorway-casing-z12; }
      [zoom>=10][tunnel='yes'] {
        line-color: white;
        line-join: miter;
        [zoom<=7] { line-width: 0.5*0.75*@motorway-casing-z8; }
        [zoom=8] { line-width: 1*0.75*@motorway-casing-z8; }
        [zoom=9] { line-width: 1*0.75*@motorway-casing-z9; }
        [zoom=10] { line-width: 0.25*0.75*@motorway-casing-z12; }
        [zoom=11]  { line-width: 0.5*0.75*@motorway-casing-z12; }
        line-width: 0.75*@motorway-casing-z12;
      }
    }
    [highway='motorway_link'][zoom>=11] {
      line-width: 0.5*7;
      line-color: @autobahn;
      [reftype='B'] { line-color: @fernrot; }
      [zoom=12] { line-width: 7; }
    }
    [highway='motorway'][reftype='B'] {
      line-color: @fernrot;
      line-join: round;
      //line-cap: round;
      line-width: 0.5*@trunk-casing-z8;
      [zoom<10] { line-rasterizer: fast; }
      [zoom=8] { line-width: @trunk-casing-z8; }
      [zoom=9] { line-width: @trunk-casing-z9; }
      [zoom=10] { line-width: 0.25*@trunk-casing-z12; }
      [zoom=11] { line-width: 0.5*@trunk-casing-z12; }
      [zoom>=12] { line-width: 1*@trunk-casing-z12; }
      [zoom>=10][tunnel='yes'] {
        line-color: white;
        [zoom<=7] { line-width: 0.5*0.75*@trunk-casing-z8; }
        [zoom=8] { line-width: 1*0.75*@trunk-casing-z8; }
        [zoom=9] { line-width: 1*0.75*@trunk-casing-z9; }
        [zoom=10] { line-width: 0.25*0.75*@trunk-casing-z12; }
        [zoom=11]  { line-width: 0.5*0.75*@trunk-casing-z12; }
        [zoom>=12] { line-width: 1*0.75*@trunk-casing-z12; }
      }
    }
    [highway='trunk'][zoom<8][lref!=1] {
      line-color: white;
      line-width: 0.5*@secondary-stroke-z8;
    }
    [highway='trunk'][zoom<8][lref=1] { 
      line-color: @fernrot;
      line-width: 0.5*@secondary-stroke-z8;
    }
    [highway='trunk'][zoom>=8] {
      line-width: @trunk-casing-z8;
      line-color: @fernrot;
      line-join: round;
      //line-cap: round;
      [zoom<10] { line-cap: round; }
      [zoom=9] { line-width: @trunk-casing-z9; }
      [zoom=10] { line-width: 0.25*@trunk-casing-z12; }
      [zoom=11] { line-width: 0.5*@trunk-casing-z12; }
      [zoom>=12] { line-width: 1*@trunk-casing-z12; }
      [zoom>=10][tunnel='yes'] {
        line-color: white;
        line-width: 0.75*1*@trunk-casing-z8;
        [zoom=9] { line-width: 0.75*1*@trunk-casing-z9; }
        [zoom=10] { line-width: 0.75*0.25*@trunk-casing-z12; }
        [zoom=11] { line-width: 0.75*0.5*@trunk-casing-z12; }
        [zoom>=12] { line-width: 0.75*1*@trunk-casing-z12; }
      }
      ::incline[zoom>=11] { [incline>=10],[incline<=-10] {
      marker-file: url('symbols/steigung.svg');
      marker-placement: vertex-first;
      marker-line-width: 30;
      marker-width: 1.5*0.5*@trunk-width-z12;
      [zoom>=12] { marker-width: 1.5*1*@trunk-width-z12; }
      marker-transform: rotate(90);
      marker-direction: right;
      [incline<0] {marker-direction: left; }
      [incline>=15],[incline<=-15] { marker-file: url('symbols/steigung2.svg'); }
    } } 
    }
    [railway='rail'][zoom>=10],[railway='narrow_gauge'][zoom>=11] {
      [tunnel='yes'] {
        background/line-join: bevel;
        background/line-color: white;
        background/line-width: 3*0.25*@railway-width-z12;
        [zoom=11] { background/line-width: 3*0.5*@railway-width-z12; }
        [zoom>=12] { background/line-width: 3*0.5*@railway-width-z12; }
        line-comp-op: darken;
      }
      line-color: black;
      [tunnel='yes'] {  line-dasharray: 0.25*14, 0.25*8.5; }
      line-width: 0.67*0.25*@railway-width-z12;
      [zoom=11] {
        line-width: 0.67*0.5*@railway-width-z12;
        [tunnel='yes'] { line-dasharray: 0.5*14, 0.5*8.5; }
      }
      [zoom>=12] {
        line-width: 0.67*1*@railway-width-z12;
        [tunnel='yes'] { line-dasharray: 1*14, 1*8.5; }
      }
      [usage='main'] {
        line-width: 0.25*@railway-width-z12;
        [zoom=11] { line-width: 0.5*@railway-width-z12; }
        [zoom>=12] { line-width: 1*@railway-width-z12; }
      }
      //comp-op: darken;  
    }
    [highway='primary'][zoom>=9] {
      line-color: @fernrot;
      line-width: @primary-width-z9;
      line-join: round;
      line-cap: round;
      //line-miterlimit: 4;
      [zoom=10] { line-width: 0.25*@primary-width-z12; }
      [zoom=11] { line-width: 0.5*@primary-width-z12; }
      [zoom>=12] { line-width: 1*@primary-width-z12; }
      ::incline[zoom>=11] { [incline>=10],[incline<=-10] {
        marker-file: url('symbols/steigung.svg');
        marker-placement: vertex-first;
        marker-line-width: 30;
        marker-width: 1.5*0.5*@secondary-width-z12;
        [zoom>=12] { marker-width: 1.5*1*@secondary-width-z12; }
        marker-transform: rotate(90);
        marker-direction: right;
        [incline<0] {marker-direction: left; }
        [incline>=15],[incline<=-15] { marker-file: url('symbols/steigung2.svg'); }
      } }
    }
    [highway='primary'][zoom<9][lref!=1] {
      line-color: white;
      line-join: round;
      line-cap: round;
      line-width: @secondary-stroke-z9;
      [zoom=8] { line-width: @secondary-stroke-z8; }
      [zoom<=7] { line-width: 0.5*@secondary-stroke-z8; }
  }
    [highway='secondary'] {
      [zoom>=10] {
        line-width: 0.25*0.875*@secondary-width-z12;
        line-color: @verkehrsgelb;
        //line-smooth: 0.8;
        //line-simplify: 5;
        //line-gamma: 0.8;
        line-join: round;
        line-cap: round;
        //line-rasterizer: fast;
        [zoom=11] { line-width: 0.5*0.875*@secondary-width-z12; }
        [zoom>=12] { line-width: 0.875*@secondary-width-z12; }
       ::incline[zoom>=11] { [incline>=10],[incline<=-10] {
        marker-file: url('symbols/steigung.svg');
        marker-placement: vertex-first;
        marker-line-width: 30;
        marker-width: 1.5*0.5*@secondary-width-z12;
        [zoom>=12] { marker-width: 1.5*1*@secondary-width-z12; }
        marker-transform: rotate(90);
        marker-direction: right;
        [incline<0] {marker-direction: left; }
        [incline>=15],[incline<=-15] { marker-file: url('symbols/steigung2.svg'); }
      } }
    }
    }
  }
  [zoom<10],[tunnel!='yes'] { ::stroke {
    [highway='motorway'][reftype='A'] {
      line-width: @motorway-stroke-z9;
      line-color: white;
      line-join: round;
      [zoom<10] { line-cap: square; }
      [zoom=8] { line-width: @motorway-stroke-z8; }
      [zoom<=7] { line-width: 0.5*@motorway-stroke-z8; }
      [zoom=10] { line-width: 0.25*@motorway-stroke-z12; }
      [zoom=11] { line-width: 0.5*@motorway-stroke-z12; }
      [zoom>=12] { line-width: 1*@motorway-stroke-z12; }
    }
    [highway='motorway'][reftype='B'] {
      line-width: @trunk-stroke-z9;
      line-color: white;
      line-join: round;
      [zoom<10] { line-cap: square; }
      [zoom=8] { line-width: @trunk-stroke-z8; }
      [zoom<=7] { line-width: 0.5*@trunk-stroke-z8; }
      [zoom=10] { line-width: 0.25*@trunk-stroke-z12; }
      [zoom=11] { line-width: 0.5*@trunk-stroke-z12; }
      [zoom>=12] { line-width: 1*@trunk-stroke-z12; }
    }
    [highway='trunk'][zoom>=8] {
      line-width: @trunk-stroke-z8;
      line-color: white;
      line-join: round;
      //line-cap: square;
      [zoom<10] { line-cap: square; }
      [zoom=9] { line-width: @trunk-stroke-z9; }
      [zoom=10] { line-width: 0.25*@trunk-stroke-z12; }
      [zoom=11] { line-width: 0.5*@trunk-stroke-z12; }
      [zoom>=12] { line-width: 1*@trunk-stroke-z12; }
    }
  }}
}

#small-roads[zoom>=11] {
  ::casing {
    line-color: @nebenstrasse;
    line-gamma: 0.8;
    line-rasterizer: fast;
    line-width: 0.25*@tertiary-width-z12;
    [zoom=11] { line-width: 0.5*@tertiary-width-z12; }
    [zoom>=12] { line-width: 1*@tertiary-width-z12; }
  }
  ::fill {
    line-color: white;
    line-gamma: 0.8;
    line-join: round;
    line-cap: round;
    line-width: 0.8*0.25*@tertiary-width-z12;
    [zoom=11] { line-width: 0.8*0.5*@tertiary-width-z12; }
    [zoom>=12] { line-width: 0.8*1*@tertiary-width-z12; }
  }
  ::incline[zoom>=11] { [incline>=10],[incline<=-10] {
      marker-file: url('symbols/steigung.svg');
      marker-placement: vertex-first;
      marker-line-width: 30;
      marker-width: 1.5*0.5*@tertiary-width-z12;
      [zoom>=12] { marker-width: 1.5*1*@tertiary-width-z12; }
      marker-transform: rotate(90);
      marker-direction: right;
      [incline<0] {marker-direction: left; }
      [incline>=15],[incline<=-15] { marker-file: url('symbols/steigung2.svg'); }
  } }
}

#ferries { [zoom>=10],[car='yes'] {
  [car='yes']::car {
    background/line-color: white;
    background/line-width: 3*0.25*@ferry-car-z12;
    line-color: @fernrot;
    line-width: 0.25*@ferry-car-z12;
    line-dasharray: 6, 3;
    [zoom=11] {
      background/line-width: 3*0.5*@ferry-car-z12;
      line-width: 0.5*@ferry-car-z12;
      line-dasharray: 12, 6;
    }
    [zoom>=12] {
      background/line-width: 3*1*@ferry-car-z12;
      line-width: 1*@ferry-car-z12;
      line-dasharray: 24, 12;
    }
  }
  [zoom<10][car='yes']::duration {
    text-name: [duration];
    text-face-name: 'Helvetica Neue Medium';
    text-size: 0.25*@ferry-label-z9;
    text-fill: @fernrot;
    text-placement: line;
    text-dy: 0.25*@ferry-label-offset-z9;
    text-repeat-distance: 512;
    [zoom=8] {
      text-size: 0.5*@ferry-label-z9;
      text-dy: 0.5*@ferry-label-offset-z9;
    }
    [zoom=9] {
      text-size: 1*@ferry-label-z9;
      text-dy: 1*@ferry-label-offset-z9;
    }
  }
  [foot='yes']::foot {
    background/line-color: white;
    background/line-width: 2*0.25*@ferry-foot-z12;
    line-color: @wasser-kontur;
    line-width: 0.25*@ferry-foot-z12;
    line-dasharray: 0.25*42, 0.25*12;
    [zoom=11] {
      background/line-width: 2*0.5*@ferry-foot-z12;
      line-width: 0.5*@ferry-foot-z12;
      line-dasharray: 0.5*42, 0.5*12;
    }
    [zoom>=12] {
      background/line-width: 2*1*@ferry-foot-z12;
      line-width: 1*@ferry-foot-z12;
      line-dasharray: 1*42, 1*12;
    }
  }
  ::foot,::car { comp-op: darken; }
} }

#route-roads[network = 'e-road']::Eshield {
  shield-file: url('shields/E-Road_2x1.svg');
  [lref>=3] { shield-file: url('shields/E-Road_3x1.svg'); }
  shield-name: [ref];
  shield-face-name: 'DIN 1451 Mittelschrift Regular';
  shield-fill: white;
  shield-size: 0.9*0.25*@E-shield-z12;
  shield-transform: scale(0.25*@E-shield-z12/375);
  shield-placement: line;
  shield-repeat-distance: 768;
  //shield-spacing : 256;
  //[zoom<10] { shield-spacing : 512px; }
  [zoom>=12] {
    shield-size: 0.9*1*@E-shield-z12;
    shield-transform: scale(1*@E-shield-z12/375);
  }
  [zoom=11] {
    shield-size: 0.9*0.5*@E-shield-z12;
    shield-transform: scale(0.5*@E-shield-z12/375);
  }
  [zoom=9] {
    shield-size: 0.9*1*@E-shield-z9;
    shield-transform: scale(1*@E-shield-z9/375);
  }
  [zoom=8] {
    shield-size: 0.9*0.5*@E-shield-z9;
    shield-transform: scale(0.5*@E-shield-z9/375);
  }
  [zoom<=7] {
    shield-size: 0.9*0.25*@E-shield-z9;
    shield-transform: scale(0.25*@E-shield-z9/375);
  }
  shield-wrap-character: ";";
  shield-wrap-width: 2; // effectively break after every wrap character
  shield-line-spacing: -1.5; // -0.15 em
}

#route-roads[network='BAB']::ashield {
  //shield-avoid-edges: true;
  shield-file: url('shields/Bundesautobahn.svg');
  shield-name: [refnumber];
  shield-face-name: 'DIN 1451 Mittelschrift Regular';
  shield-fill: white;
  shield-size: 0.6*0.25*@A-shield-z12;
  shield-transform: scale(0.25*@A-shield-z12/60);
  shield-placement: line;
  shield-repeat-distance: 768;
  [zoom>=12] {
    shield-transform: scale(@A-shield-z12/60);
    shield-size: 0.6*1*@A-shield-z12;
  }
  [zoom=11] {
    shield-transform: scale(0.5*@A-shield-z12/60);
    shield-size: 0.6*0.5*@A-shield-z12;
  }
  [zoom=9] {
    shield-transform: scale(@A-shield-z9/60);
    shield-size: 0.6*1*@A-shield-z9;
  }
  [zoom=8] {
    shield-transform: scale(0.5*@A-shield-z9/60);
    shield-size: 0.6*0.5*@A-shield-z9;
  }
  [zoom<=7] {
    shield-transform: scale(0.25*@A-shield-z9/60);
    shield-size: 0.6*0.25*@A-shield-z9;
  }
  shield-wrap-character: ";";
  shield-wrap-width: 2; // effectively break after every wrap character
  //shield-line-spacing: -1.5; // -0.15 em
}

#route-roads [zoom>=10][network='DE:B']::bshield {
  //shield-avoid-edges: true;
  shield-file: url('shields/Bundesstraße.svg');
  shield-name: [refnumber];
  shield-face-name: 'DIN 1451 Mittelschrift Regular';
  //[lref=3] { shield-face-name: 'DIN 1451 Engschrift Regular'; }
  shield-fill: black;
  shield-size: 0.6*0.25*@B-shield-z12;
  shield-transform: scale(0.25*@B-shield-z12/52);
  shield-placement: line;
  shield-repeat-distance: 512;
  [zoom>=12] {
    shield-transform: scale(@B-shield-z12/60);
    shield-size: 0.6*1*@B-shield-z12;
  }
  [zoom=11] {
    shield-transform: scale(0.5*@B-shield-z12/60);
    shield-size: 0.6*0.5*@B-shield-z12;
  }
  [zoom<=9] {
    shield-transform: scale(@B-shield-z9/60);
    shield-size: 0.6*1*@B-shield-z9;
  }
  shield-wrap-character: ";";
  shield-wrap-width: 2; // effectively break after every wrap character
  //shield-line-spacing: -1.5; // -0.15 em
}

#route-roads[network='NL:A']::ashield {
  shield-file: url('shields/NL-A.svg');
  shield-name: [ref];
  shield-face-name: 'Highway Gothic Regular';
  shield-fill: white;
  shield-size: 0.55*0.25*@A-shield-z12;
  shield-transform: scale(0.25*@A-shield-z12/253);
  shield-placement: line;
  shield-repeat-distance: 768;
  [zoom>=12] {
    shield-transform: scale(@A-shield-z12/253);
    shield-size: 0.55*1*@A-shield-z12;
  }
  [zoom=11] {
    shield-transform: scale(0.5*@A-shield-z12/253);
    shield-size: 0.55*0.5*@A-shield-z12;
  }
  [zoom=9] {
    shield-transform: scale(@A-shield-z9/253);
    shield-size: 0.55*1*@A-shield-z9;
  }
  [zoom=8] {
    shield-transform: scale(0.5*@A-shield-z9/253);
    shield-size: 0.55*0.5*@A-shield-z9;
  }
  [zoom<=7] {
    shield-transform: scale(0.25*@A-shield-z9/253);
    shield-size: 0.55*0.25*@A-shield-z9;
  }
  shield-wrap-character: ";";
  shield-wrap-width: 2; // effectively break after every wrap character
  shield-line-spacing: -1.5; // -0.15 em
}

#route-roads [zoom>=10][network='NL:N']::bshield {
  shield-file: url('shields/NL-N.svg');
  [lref=3] { shield-file: url('shields/NL-N_3.svg'); }
  shield-name: [ref];
  shield-face-name: 'Highway Gothic Regular';
  shield-fill: black;
  shield-size: 0.6*0.25*@B-shield-z12;
  shield-transform: scale(0.25*@B-shield-z12/80);
  shield-placement: line;
  shield-repeat-distance: 768;
  [lref=3] { shield-file: url('shields/NL-N.svg'); }
  [zoom>=12] {
    shield-transform: scale(@B-shield-z12/80);
    shield-size: 0.6*1*@B-shield-z12;
  }
  [zoom=11] {
    shield-transform: scale(0.5*@B-shield-z12/80);
    shield-size: 0.6*0.5*@B-shield-z12;
  }
  [zoom=9] {
    shield-transform: scale(@B-shield-z9/80);
    shield-size: 0.6*1*@B-shield-z9;
  }
  [zoom=8] {
    shield-transform: scale(0.5*@B-shield-z9/80);
    shield-size: 0.6*0.5*@B-shield-z9;
  }
  [zoom<=7] {
    shield-transform: scale(0.25*@B-shield-z9/80);
    shield-size: 0.6*0.25*@B-shield-z9;
  }
  shield-wrap-character: ";";
  shield-wrap-width: 2; // effectively break after every wrap character
  shield-line-spacing: -1.5; // -0.15 em
}

#route-roads[network!='e-road'][network!='BAB'][network!='DE:B'][network!='NL:A'][network!='NL:N'] {
  //debug-mode: collision;
  [reftype='A']::ashield {
    //shield-avoid-edges: true;
    shield-file: url('shields/aroad.svg');
    shield-name: [ref];
    shield-face-name: 'DIN 1451 Mittelschrift Regular';
    shield-fill: white;
    shield-size: 0.85*0.25*@A-shield-z12;
    shield-transform: scale(0.25*@A-shield-z12/60);
    shield-placement: line;
    shield-repeat-distance: 768;
    [zoom>=12] {
      shield-transform: scale(@A-shield-z12/60);
      shield-size: 0.85*1*@A-shield-z12;
    }
    [zoom=11] {
      shield-transform: scale(0.5*@A-shield-z12/60);
      shield-size: 0.85*0.5*@A-shield-z12;
    }
    [zoom=9] {
      shield-transform: scale(@A-shield-z9/60);
      shield-size: 0.85*1*@A-shield-z9;
    }
    [zoom=8] {
      shield-transform: scale(0.5*@A-shield-z9/60);
      shield-size: 0.85*0.5*@A-shield-z9;
    }
    [zoom<=7] {
      shield-transform: scale(0.25*@A-shield-z9/60);
      shield-size: 0.85*0.25*@A-shield-z9;
    }
    shield-wrap-character: ";";
    shield-wrap-width: 2; // effectively break after every wrap character
    shield-line-spacing: -1.5; // -0.15 em
  }
  [reftype!='A']::bshield { [reftype='N'], [reftype='D'] {
    [zoom>=10] { //,[zoom>=9][highway='motorway'],[zoom>=9][highway='trunk'] {
      //shield-avoid-edges: true;
      shield-file: url('shields/broad.svg');
      shield-name: [ref];
      shield-face-name: 'DIN 1451 Mittelschrift Regular';
      shield-fill: black;
      shield-size: 0.85*0.25*@B-shield-z12;
      shield-transform: scale(0.25*@B-shield-z12/52);
      shield-placement: line;
      shield-repeat-distance: 512;
      [zoom>=12] {
        shield-transform: scale(@B-shield-z12/60);
        shield-size: 0.85*1*@B-shield-z12;
      }
      [zoom=11] {
        shield-transform: scale(0.5*@B-shield-z12/60);
        shield-size: 0.85*0.5*@B-shield-z12;
      }
      [zoom<=9] {
        shield-transform: scale(@B-shield-z9/60);
        shield-size: 0.85*1*@B-shield-z9;
      }
      shield-wrap-character: ";";
      shield-wrap-width: 2; // effectively break after every wrap character
      shield-line-spacing: -1.5; // -0.15 em
    }
  } }
}

#roads_shields {
  ::ashield[reftype='A'] {
    shield-file: url('shields/Bundesautobahn.svg');
    shield-name: [refnumber];
    shield-face-name: 'DIN 1451 Mittelschrift Regular';
    shield-fill: silver;
    shield-size: 0.6*0.25*@A-shield-z12;
    shield-transform: scale(0.25*@A-shield-z12/60);
    shield-placement: line;
    shield-repeat-distance: 768;
    [zoom>=12] {
      shield-transform: scale(@A-shield-z12/60);
      shield-size: 0.6*1*@A-shield-z12;
    }
    [zoom=11] {
      shield-transform: scale(0.5*@A-shield-z12/60);
      shield-size: 0.6*0.5*@A-shield-z12;
    }
    [zoom=9] {
      shield-transform: scale(@A-shield-z9/60);
      shield-size: 0.6*1*@A-shield-z9;
    }
    [zoom=8] {
      shield-transform: scale(0.5*@A-shield-z9/60);
      shield-size: 0.6*0.5*@A-shield-z9;
    }
    [zoom<=7] {
      shield-transform: scale(0.25*@A-shield-z9/60);
      shield-size: 0.6*0.25*@A-shield-z9;
    }
    shield-wrap-character: ";";
    shield-wrap-width: 2; // effectively break after every wrap character
    //shield-line-spacing: -1.5; // -0.15 em
  }
  ::Eshield[intref != null] {
    //debug-mode: collision;
    shield-file: url('shields/E-Road_2x1.svg');
    shield-name: [intref];
    shield-face-name: 'DIN 1451 Mittelschrift Regular';
    shield-fill: silver;
    shield-size: 0.9*0.25*@E-shield-z12;
    shield-transform: scale(0.25*@E-shield-z12/375);
    shield-placement: line;
    shield-repeat-distance: 768;
    //shield-spacing : 256;
    //[zoom<10] { shield-spacing : 512px; }
    [zoom>=12] {
      shield-size: 0.9*1*@E-shield-z12;
      shield-transform: scale(1*@E-shield-z12/375);
    }
    [zoom=11] {
      shield-size: 0.9*0.5*@E-shield-z12;
      shield-transform: scale(0.5*@E-shield-z12/375);
    }
    [zoom=9] {
      shield-size: 0.9*1*@E-shield-z9;
      shield-transform: scale(1*@E-shield-z9/375);
    }
    [zoom=8] {
      shield-size: 0.9*0.5*@E-shield-z9;
      shield-transform: scale(0.5*@E-shield-z9/375);
    }
    [zoom<=7] {
      shield-size: 0.9*0.25*@E-shield-z9;
      shield-transform: scale(0.25*@E-shield-z9/375);
    }
    [lintref>=3] { shield-file: url('shields/E-Road_3x1.svg'); }
    shield-wrap-character: ";";
    shield-wrap-width: 64; // effectively break after every wrap character
    shield-line-spacing: -1.5; // -0.15 em
  }
}

