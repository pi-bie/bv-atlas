#future-roads {
  [zoom>=8][reftype='B'][construction='trunk'] {
    //[proposed='motorway'], [zoom>=8][proposed='trunk'] ,
    [zoom<10]::casing {
      line-width: @trunk-casing-z9;
      line-color: @fernrot;
      [construction='motorway'],[construction='trunk'] { line-dasharray: 16, 12; }
      // [proposed='motorway'],[proposed='trunk'] { line-dasharray: 3, 6;}
    }
    [zoom=8]::casing {
      line-width: 0.5*@trunk-casing-z9;
    }
    [zoom<10]::stroke {
      line-width: @trunk-stroke-z9;
      line-color: white;
      [construction='motorway'],[construction='trunk'] { line-dasharray: 16, 12; }
    }
    [zoom=8]::stroke {
      line-width: 0.5*@trunk-stroke-z9;
    }
  }
    [proposed='motorway'][reftype='A'],
    [construction='motorway'][reftype='A'] {
      [zoom<10]::casing {
        background/line-join: bevel;
        background/line-color: white;
        background/line-width: 2*@motorway-casing-z9;
        line-width: @motorway-casing-z9;
        line-color: @autobahn;
        line-dasharray: 4, 2; //default to dasharray for construction
        [proposed='motorway'] { line-dasharray: 16, 12; }
      }
      [zoom=8]::casing {
        background/line-width: 2*0.5*@motorway-casing-z9;
        line-width: 0.5*@motorway-casing-z9;
        [proposed='motorway'] { line-dasharray: 0.5*16, 0.5*12; }
      }
      [zoom<=7]::casing {
        background/line-width: 2*0.25*@motorway-casing-z9;
        line-width: 0.25*@motorway-casing-z9;
        [proposed='motorway'] { line-dasharray: 0.25*16, 0.25*12; }
      }
      [zoom<10]::stroke {
        background/line-join: bevel;
        background/line-color: black;
        background/line-width: 2*@motorway-stroke-z9;
        line-width: @motorway-stroke-z9;
        line-color: white;
        line-dasharray: 4, 2; //default to dasharray for construction
        [proposed='motorway'] { line-dasharray: 16, 12; }
      }
      [zoom=8]::stroke {
        background/line-width: 2*0.5*@motorway-stroke-z9;
        line-width: 0.5*@motorway-stroke-z9;
        [proposed='motorway'] { line-dasharray: 0.5*16, 0.5*12; }
      }
      [zoom=8]::stroke {
        background/line-width: 2*0.25*@motorway-stroke-z9;
        line-width: 0.25*@motorway-stroke-z9;
        [proposed='motorway'] { line-dasharray: 0.25*16, 0.25*12; }
      }
      [zoom>=10]::casing {
        background/line-join: bevel;
        background/line-color: white;
        background/line-width: 2*0.25*@motorway-line-z12;
        line-width: 0.25*@motorway-line-z12;
        line-color: @autobahn;
        //line-simplify: 1000;
        [construction='motorway'] { line-dasharray: 0.25*45.5, 0.25*11.4; }
        [proposed='motorway'] { line-dasharray: 0.25*22.75, 0.25*17; }
      }
      [zoom>=10]::stroke {
        background/line-join: bevel;
        background/line-color: black;
        background/line-width: 2*@motorway-stroke-ratio*0.25*@motorway-line-z12;
        line-width: @motorway-stroke-ratio*0.25*@motorway-line-z12;
        [proposed='motorway'] {
          background/line-width: 2*0.25*@motorway-planned-stroke-z12;
          line-width: 0.25*@motorway-planned-stroke-z12;
        }
        line-color: white;
        //line-simplify: 1000;
        [construction='motorway'] { line-dasharray: 0.25*45.5, 0.25*11.4; }
        [proposed='motorway'] { line-dasharray: 0.25*22.75, 0.25*17; }
       }
      [zoom=11]::casing {
        background/line-width: 2*0.5*@motorway-line-z12;
        line-width: 0.5*@motorway-line-z12;
        [construction='motorway'] { line-dasharray: 0.5*45.5, 0.5*11.4; }
        [proposed='motorway'] { line-dasharray: 0.5*22.75, 0.5*17; }
      }
      [zoom=11]::stroke {
        background/line-width: 2*@motorway-stroke-ratio*0.5*@motorway-line-z12;
        line-width: @motorway-stroke-ratio*0.5*@motorway-line-z12;
        [proposed='motorway'] {
          background/line-width: 2*0.5*@motorway-planned-stroke-z12;
          line-width: 0.5*@motorway-planned-stroke-z12; 
        }
        [construction='motorway'] { line-dasharray: 0.5*45.5, 0.5*11.4; }
        [proposed='motorway'] { line-dasharray: 0.5*22.75, 0.5*17; }
      }
      [zoom>=12]::casing {
        background/line-width: 3*1*@motorway-line-z12;
        line-width: 1*@motorway-line-z12;
        [construction='motorway'] { line-dasharray: 45.5, 11.4; }
        [proposed='motorway'] { line-dasharray: 22.75, 17; }
      }
      [zoom>=12]::stroke {
        background/line-width: 2*@motorway-stroke-ratio*1*@motorway-line-z12;
        line-width: @motorway-stroke-ratio*1*@motorway-line-z12;
        [proposed='motorway'] {
          background/line-width: 2*1*@motorway-planned-stroke-z12;
          line-width: 1*@motorway-planned-stroke-z12; 
        }
        [construction='motorway'] { line-dasharray: 45.5, 11.4; }
        [proposed='motorway'] { line-dasharray: 22.75, 17; }
      }
    }
    [construction='motorway'][reftype='B'],
    [proposed='motorway'][reftype='B'],
    [zoom>=10][highway='construction'][construction='trunk']
    //[zoom>=10][proposed='trunk']
    {
      [zoom<10]::casing {
        line-width: @trunk-casing-z9;
        line-color: @fernrot;
        [construction='motorway'],[construction='trunk'] { line-dasharray: 4, 2; }
        [proposed='motorway'],[proposed='trunk'] { line-dasharray: 16, 12;}
      }
      [zoom<10]::stroke {
        line-width: @trunk-stroke-z9;
        line-color: white;
        [construction='motorway'],[construction='trunk'] { line-dasharray: 4, 2; }
        [proposed='motorway'],[proposed='trunk'] { line-dasharray: 16, 12;}
      }
      [zoom>=10]::casing {
        line-width: 0.25*@trunk-width-z12;
        line-color: @fernrot;
        //line-simplify: 1000;
        [highway='construction'] { line-dasharray: 0.25*45.5, 0.25*11.4; }
        [highway='proposed'] { line-dasharray: 0.25*22.75, 0.25*17; }
      }
      [zoom>=10]::stroke {
        //line-simplify: 1000;
        line-width: @trunk-stroke-ratio*0.25*@trunk-width-z12;
        line-color: white;
        [highway='proposed'] { line-width: @planned-stroke-ratio*0.25*@trunk-width-z12; }
        [highway='construction'] { line-dasharray: 0.25*45.5, 0.25*11.4; }
        [highway='proposed'] { line-dasharray: 0.25*22.75, 0.25*17; }
      }
      [zoom=11]::casing {
        line-width: 0.5*@trunk-width-z12;
        [highway='proposed'] { line-dasharray: 0.5*22.75, 0.5*17; }
        [highway='construction'] { line-dasharray: 0.5*45.5, 0.5*11.4; }
      }
      [zoom=11]::stroke {
        line-width: @trunk-stroke-ratio*0.5*@trunk-width-z12;
        [highway='proposed'] { line-width: @planned-stroke-ratio*0.5*@trunk-width-z12; }
        [highway='proposed'] { line-dasharray: 0.5*22.75, 0.5*17; }
        [highway='construction'] { line-dasharray: 0.5*45.5, 0.5*11.4; }
      }
      [zoom>=12]::casing {
        line-width: 1*@trunk-width-z12;
        [highway='construction'] { line-dasharray: 1*45.5, 1*11.4; }
        [highway='proposed'] { line-dasharray: 1*22.75, 1*17; }
      }
      [zoom>=12]::stroke {
        line-width: @trunk-stroke-ratio*1*@trunk-width-z12;
        [highway='construction'] { line-dasharray: 1*45.5, 1*11.4; }
        [highway='proposed'] { line-dasharray: 1*22.75, 1*17; }
        [highway='proposed'] { line-width: @planned-stroke-ratio*1*@trunk-width-z12; }
      }
    }
    // [proposed='primary'],
    // [zoom<9][proposed='trunk'],
  [construction='primary'],
  [zoom<8][construction='trunk'] {
    [zoom<9]::casing {
      line-width: @secondary-width-z9;
      line-color: @nebenstrasse;
      [construction='primary'] { line-dasharray: 4, 2; }
      //[proposed='primary'] { line-dasharray: 3, 6; }
    }
    [zoom<9]::stroke {
      line-width: @secondary-stroke-z9;
      line-color: white;
    }
    [zoom>=9],[lref=1] {
      line-color: @fernrot;
      line-width: @primary-width-z9;
      //line-smooth: 1;
      //line-simplify: 100;
      //line-rasterizer: fast;
      //line-simplify-algorithm: zhao-saalfeld;
      [zoom<=7] { line-width: 0.25*@primary-width-z9; }
      [zoom=8] { line-width: 0.5*@primary-width-z9; }
      [zoom=10] { line-width: 0.25*@primary-width-z12; }
      [zoom=11] { line-width: 0.5*@primary-width-z12; }
      [zoom>=12] { line-width: 1*@primary-width-z12; }
      [highway='construction'] {
        line-dasharray: 4, 2;
        [zoom=10] { line-dasharray: 0.25*22.75, 0.25*12.8; }
        [zoom=11] { line-dasharray: 0.5*22.75, 0.5*12.8; }
        [zoom>=12] { line-dasharray: 22.75, 12.8; }
      }
      /*  [highway='proposed'] {
        line-dasharray: 4, 8; 
        [zoom=11] { line-dasharray: 13, 7; }
        [zoom>=12] { line-dasharray: 26, 14; }
      } */
    }
  }
  ::casing { comp-op: darken; }
  ::stroke { comp-op: lighten; }
}