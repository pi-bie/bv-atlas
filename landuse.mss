#protected-areas [zoom>=10] {
  line-pattern-file: url('symbols/hatch-13.png');
  //line-pattern-smooth: 0.5;
  //polygon-pattern-alignment: global;
  line-pattern-simplify: 1;
  line-pattern-simplify-algorithm: zhao-saalfeld; //radial-distance
  //line-pattern-transform: scale(0.1953);
  /*line-color: @nsg;
  line-width: 4;
  line-dasharray: 1, 1;
  line-smooth: 0.75;
  line-miterlimit: 8;
  line-join: round;
  [zoom=11] {
    line-width: 12.8; 
    line-dasharray: 1, 2;
    label/text-size: 16;
  }
  [zoom>=12] {
    line-width: 25.5; 
    line-dasharray: 1, 2;
    label/text-size: 31;
  }*/
  [zoom>=12] {
    line-pattern-file: url('symbols/hatch-25.png');
  }
  //polygon-opacity: 0.33;
  //polygon-fill: @nsg;
}

#protected-areas_name [zoom>=10] {
  label/text-name: [name];
  label/text-size: 8.25;
  label/text-face-name: 'Helvetica Neue Bold';
  label/text-fill: @nsg;
  [zoom=11] { label/text-size: 17.5; }
  [zoom>=12] { label/text-size: 35; }
}

#forest [zoom>=10] {
    polygon-opacity:1;
    polygon-fill: @forest;
    polygon-smooth: 1;
}

#populated { [zoom>=10],[name='Berlin'],[name='Hamburg'],[name='München'] {
    polygon-opacity:1;
    polygon-fill: @bebaut;
    polygon-smooth: 0.75;
    polygon-simplify: 5;
    [zoom<11] {polygon-simplify: 1; }
    polygon-gamma: 0.9;
} }

#mountains-landscapes [zoom>=10][name != null] {
  text-name: [name];
  text-face-name: 'Helvetica Neue Thin';
  text-fill: black;
  text-placement: line;
  text-size: 0.25*@mountain-ridge-label-z12;
  text-horizontal-alignment: adjust;
  //text-character-spacing: @mountain-ridge-char-spacing-z12;
  text-wrap-width: 96;
  text-line-spacing: 2*0.25*@mountain-ridge-label-z12;
  text-margin: 0;
  text-min-path-length: 0;
  text-allow-overlap: true;
  [zoom=11] {
    text-size: 0.5*@mountain-ridge-label-z12;
    text-line-spacing: 2*0.5*@mountain-ridge-label-z12;
  }
  [zoom>=12] {
    text-size: 1*@mountain-ridge-label-z12;
    text-line-spacing: 2*1*@mountain-ridge-label-z12;
  }
}

#long_ridges [zoom>=10] {
  text-name: [name];
  text-face-name: 'Helvetica Neue Thin';
  text-fill: black;
  text-placement: line;
  text-size: 0.8*0.25*@mountain-ridge-label-z12;
  [zoom=11] { text-size: 0.8*0.5*@mountain-ridge-label-z12; }
  [zoom>=12] { text-size: 0.8*1*@mountain-ridge-label-z12; }
  text-horizontal-alignment: adjust;
  //text-character-spacing: 0.8*@mountain-ridge-char-spacing-z12;
}

#peaks {
  marker-width: 6;
  marker-fill: #f45;
  marker-line-color: #813;
  marker-allow-overlap: true;
  marker-ignore-placement: true;
}

#camping[zoom>=11] {
  marker-width: 0.5*@campsite-marker-z12; 
  marker-fill: @nsg;
  marker-file: url('symbols/Camping.svg');
  [zoom=12] { marker-width: 1*@campsite-marker-z12; }
}
