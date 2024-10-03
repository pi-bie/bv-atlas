@RAL5005: #075F8F;
@RAL5017: #005A8C;
@RAL3020: #C1121C;
@RAL1023: #F0CA00;

@autobahn: @RAL5005;
@verkehrsgelb: @RAL1023;
@fernrot: @RAL3020;
//@nebenstrasse: gray;
@nebenstrasse: #909090;
//@forest: #ae8;
@forest: #e3efd9;
//@bebaut: silver;
@bebaut: #cfcfcf;
//@wasser: #168;
@wasser: #daf4fc;
@wasser-kontur: #4ea6b2;
//@nsg: #594;
@nsg: #41a34a;

@motorway-casing-z12: 19.2;
@motorway-casing-z9: 12.5;
@motorway-casing-z8: 10;
@motorway-line-z12: @motorway-casing-z12;
@motorway-width-z12: @motorway-line-z12;
@motorway-stroke-ratio: 5/19;
@motorway-stroke-z12: @motorway-casing-z12*@motorway-stroke-ratio;
@motorway-stroke-z9: @motorway-casing-z9*@motorway-stroke-ratio;
@motorway-stroke-z8: @motorway-casing-z8*@motorway-stroke-ratio;
@motorway-construction-dash-z12: 45.5;
@motorway-construction-gap-z12: 11.4;
@motorway-planned-dash-z12: 22.75;
@motorway-planned-gap-z12: 17;
@motorway-planned-dash-z9: 16;
@motorway-planned-gap-z9: 12;
@motorway-planned-stroke-z12: 5.7;
@planned-stroke-ratio: @motorway-planned-stroke-z12/@motorway-casing-z12;
@trunk-width-z12: 15.6;
@trunk-casing-z12: @trunk-width-z12;
@trunk-casing-z9: 12;
@trunk-casing-z8: 10;
@trunk-stroke-ratio: @motorway-stroke-ratio;
@trunk-stroke-z12: @trunk-casing-z12*@trunk-stroke-ratio;
@trunk-stroke-z9: @trunk-casing-z9*@trunk-stroke-ratio;
@trunk-stroke-z8: @trunk-casing-z8*@trunk-stroke-ratio;
@primary-width-z12: 13.5;
@primary-width-z9: 7.75;
@primary-width-z8: 6;
@primary-planned-dash-z12: 22.75;
@primary-planned-gap-z12: 12.8;
@secondary-width-z12: 11.4;
@secondary-width-z9: 7.75;
@secondary-casing-z9: 7.75;
@secondary-casing-z8: 6;
@secondary-stroke-z9: 5.17;
@secondary-stroke-z8: 4;
@secondary-planned-dash-z12: 27;
@secondary-planned-gap-z12: 8.5;
@tertiary-width-z12: 10;

@ferry-car-z9: 8;
@ferry-label-z9: 30;
@ferry-label-offset-z9: 10;
@ferry-car-z12: 5;
@ferry-foot-z12: 3;
@scenic-width-z12: 8;
@scenic-offset-z12: 8.5 + 0.5*@scenic-width-z12;

@A-shield-z12: 37;
@A-shield-z9: 44;
@B-shield-z12: 38;
@B-shield-z9: 0.875*@B-shield-z12;
@E-shield-z12: 30;
@E-shield-z9: 40;

@exitname-size-z12: 22;

@place-node-large-z9: 44;
@place-node-medium-z9: 32;
@place-node-small-z9: 28;

@place-node-small-z12: 25.5;
@place-node-large-z12: 34;

@place-label-huge-z9: 58;
@place-label-large-z9: 44;
@place-label-medium-z9: 40;
@place-label-small-z9: 32;

@river-line-z8: 4;
@river-label-z8: 16;
@river-line-z9: 8;
@river-label-z9: @place-label-small-z9;
@river-line-z12: 4.25;
@canal-hook-z12: 11;
@canal-dash-z12: 6;
@canal-gap-z12: 28;
@sea-label-z9: 50;
@bay-label-z9: 0.8*@sea-label-z9;

@mountain-ridge-label-z12: 34;
@mountain-ridge-char-spacing-z12: 68;

@railway-width-z12: 2.8;
@railway-tunnel-dash-z12: 14;
@railway-tunnel-gap-z12: 8.5;
@station-width-z12: 11;
@station-ratio: 0.75;

@airport-marker-size-z9: 20;
@airport-marker-size-z12: 66;
@campsite-marker-z12: 28;
@services-height-z12: 34;
@services-label-z12: 0.85* @exitname-size-z12;

@standard-halo-radius: 1;
@standard-halo-fill: rgba(255,255,255,0.6);

Map {
  //[zoom<10] { background-color: #b8dee6; }
  //[zoom>=10] { background-color: white; }
  background-color: white;
  font-directory: url(./fonts);
  buffer-size: 512
}

#countries[zoom<10] {
  ::outline {
    line-color: #85c5d3;
    line-width: 2;
    line-join: bevel;
  }
  polygon-fill: white;
}

#ocean-lz[zoom<10],
#ocean[zoom>9] {
  polygon-fill: @wasser;
  line-color: @wasser-kontur;
}

#adminlevel [admin_level<=4] {
  ::narrowline {
    background/line-join: bevel;
    background/line-color: white;
    background/line-width: 3;
    dash/line-width: 3;
    dash/line-dasharray: 9, 15;
    dash/line-color: gray;
  }
  ::wideline[admin_level=2] {
    background/line-join: bevel;
    background/line-color: white;
    background/line-width: 13;
    line-pattern-file: url('symbols/hatch-13.png');
    //line-pattern-offset: 3;
    [zoom>=12] { line-pattern-file: url('symbols/hatch-25.png'); }
    //line-pattern-smooth: 0.5;
    //polygon-pattern-alignment: global;
    line-pattern-simplify: 1;
    line-pattern-simplify-algorithm: zhao-saalfeld;
  }
  ::narrowline { opacity: 0.6; }
  ::wideline { opacity: 0.5; }
  ::wideline, ::narrowline { comp-op: darken; }
}

#water_ways { [zoom>=10],[width>=5] {
  [waterway='river'] {
    line-simplify: 1;
    //line-rasterizer: fast;
    //line-smooth: 1;
    line-color: @wasser-kontur;
    line-width: 0.25*@river-line-z12;
    [zoom>=12] {
      line-width: @river-line-z12; 
      line-join: round;
      line-cap: round;
    }
    /*label/text-name: [name];
    [zoom>=12] { label/text-size: 12; }
    label/text-face-name: 'Helvetica Neue Medium';
    label/text-fill: @wasser-kontur;
    label/text-repeat-distance: 100;
    label/text-placement: line;
    label/text-upright: auto;
    label/text-dy: 4; */
  }
  [waterway='canal'] {
    base/line-color: @wasser-kontur;
    base/line-simplify: 1;
    //base/line-rasterizer: fast;
    //base/line-smooth: 1;
    base/line-width: 0.25*@river-line-z12;
    dash/line-color: @wasser-kontur;
    dash/line-simplify: 10;
    dash/line-width: 0.25*@canal-hook-z12;
    dash/line-offset: 0.25*0.5*@canal-hook-z12;
    dash/line-dasharray: 1, 10;
    [zoom<9] {
        dash/line-width: 0.125*@canal-hook-z12; 
        dash/line-offset: 0.125*0.5*@canal-hook-z12;
        dash/line-dasharray: 1, 6;
    }
    [zoom>=12] {
      base/line-width: @river-line-z12;
      base/line-join: round;
      base/line-cap: round;
      dash/line-width: @canal-hook-z12;
      dash/line-offset: 0.5*@canal-hook-z12;
      dash/line-dasharray: 6, 28; }
/*    label/text-name: [name];
    [zoom>=12] { label/text-size: 12; }
    label/text-face-name: 'Helvetica Neue Medium';
    label/text-fill: @wasser-kontur;
    label/text-repeat-distance: 100;
    label/text-placement: line;
    label/text-upright: auto;
    label/text-dy: 4;*/
    }
  }
}

#water_areas [natural='water']  {
  [zoom>=11],[zoom>=10][way_area>=2500000],[way_area>=10000000] {
    line-color: @wasser-kontur;
    line-width: 0.5;
    polygon-opacity: 1;
    polygon-fill: @wasser;
  }
}

/*
#water_areas [zoom>=14][natural='wetland'] {
  line-color: @wasser-kontur;
  line-width: 4;
  line-dasharray: 1, 1;
}
*/

.water_names { [feature='ocean'],[feature='sea'],[zoom>=9][feature='bay'],[zoom>=10][feature='water'][width>=2500000],
  [zoom>=9][feature='water'][width>=10000000],
  [zoom>=11][feature='water'],
  [zoom>=10][feature='river'], [feature='river'][width>=5],
  [zoom>=10][feature='canal'], [feature='canal'][width>=5] 
  {
    text-name: [name];
    text-fill: @wasser-kontur;
    text-face-name: 'Helvetica Neue Italic';
    text-halo-fill: @standard-halo-fill;
    text-halo-radius: @standard-halo-radius;
    text-wrap-character: " ";
    text-wrap-width: 128;
    text-wrap-before: true;
    [zoom<=7] { text-size: 3.25; }
    [zoom=8] { text-size: 6.5; }
    [zoom=9] { text-size: 13; }
    [zoom=10] { text-size: 6; }
    [zoom=11] {text-size: 11; }
    [zoom>=12] {text-size: 21; }
    [feature='water'] {
      text-placement: point;
    }
    [feature='strait'],[feature='ocean'],[feature='sea'],[feature='bay'] {
      [zoom<=7] {text-size: 0.25*@bay-label-z9; }
      [zoom=8] {text-size: 0.5*@bay-label-z9; }
      [zoom=9] {text-size: 1*@bay-label-z9; }
      [zoom=10] { text-size: 12; }
      [zoom=11] {text-size: 22; }
      [zoom>=12] {text-size: 42; }
      text-placement: point;
      text-wrap-character: " / ";
      text-wrap-width: 64;
      text-wrap-before: true;
    }
    [feature='ocean'],[feature='sea'] {
      [zoom<=7] {text-size: 0.25*@sea-label-z9; }
      [zoom=8] {text-size: 0.5*@sea-label-z9; }
      [zoom=9] {text-size: 1*@sea-label-z9; }
    }
    [feature='river'],[feature='canal'] {
      text-repeat-distance: 256;
      text-placement: line;
      text-upright: auto;
      [zoom>=11] { text-character-spacing: 2; }
      text-dy: -3;
    }
  }
}

#military [zoom>=10] {
  [military='training_area'] {
    line-color: red;
    line-width: 5;
    line-dasharray: 1, 2;
  }
}


