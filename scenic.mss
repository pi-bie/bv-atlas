#route-roads[tourism='yes']::tourism[zoom>=10] {
  background/line-color: white;
  background/line-join: bevel;
  background/line-width: 3*(0.25*(@scenic-offset-z12+0.5*@secondary-width-z12)+0.25*@scenic-width-z12);
  //background/line-offset: 1*(@scenic-offset-z12+0.5*@secondary-width-z12);
  line-width: 0.25*@scenic-width-z12;
  line-offset: -0.25*(@scenic-offset-z12+0.5*@secondary-width-z12);
  line-color: @fernrot;
  line-gamma: 0.8;
  line-simplify: 10;
  //line-join: bevel;
  line-cap: round;
  //line-miterlimit: 1;
  line-dasharray: 0.1, 2*0.25*@scenic-width-z12;
  [zoom=11] {
    background/line-width: 3*(0.5*(@scenic-offset-z12+0.5*@secondary-width-z12)+0.5*@scenic-width-z12);
    line-simplify: 20;
    line-width: 0.5*@scenic-width-z12; 
    line-offset: -0.5*(@scenic-offset-z12+0.5*@secondary-width-z12);
    line-dasharray: 0.1, 2*0.5*@scenic-width-z12;
  }
  [zoom>=12] {
    background/line-width: 3*(1*(@scenic-offset-z12+0.5*@secondary-width-z12)+1*@scenic-width-z12);
    line-simplify: 40;
    line-width: 1*@scenic-width-z12;
    line-offset: -1*(@scenic-offset-z12+0.5*@secondary-width-z12);
    line-dasharray: 0.1, 2*1*@scenic-width-z12;
  }
  [zoom>=12]::label {
    text-name: [name];
    text-face-name: 'Helvetica Neue Medium';
    text-placement: line;
    text-simplify: 40;
    text-dy: -1*(@scenic-offset-z12+0.5*@secondary-width-z12);
  }
  comp-op: darken;
}

#roads::scenic[scenic='yes'] {
  background/line-color: white;
  background/line-join: bevel;
  background/line-width: 3*(0.25*(@scenic-offset-z12+0.5*@secondary-width-z12)+0.25*@scenic-width-z12);
  line-width: 0.25*@scenic-width-z12;
  //roads-width-z12: 1*@secondary-width-z12;
  //[highway='primary'] { @road-width-z12: @primary-width-z12; }
  line-color: @nsg;
  line-gamma: 0.8;
  line-simplify: 5;
  line-cap: round;
  //line-join: bevel;
  line-miterlimit: 1;
  line-offset: 0.25*(@scenic-offset-z12+0.5*@secondary-width-z12);
  [zoom=11] {
    background/line-width: 3*(0.5*(@scenic-offset-z12+0.5*@secondary-width-z12)+0.5*@scenic-width-z12);
    line-simplify: 10;
    line-width: 0.5*@scenic-width-z12; 
    line-offset: 0.5*(@scenic-offset-z12+0.5*@secondary-width-z12);
  }
  [zoom>=12] {
    background/line-width: 3*(1*(@scenic-offset-z12+0.5*@secondary-width-z12)+1*@scenic-width-z12);
    line-simplify: 20;
    line-width: 1*@scenic-width-z12;
    line-offset: 1*(@scenic-offset-z12+0.5*@secondary-width-z12);
  }
  [highway='primary'] {
    background/line-width: 3*(0.25*(@scenic-offset-z12+0.5*@primary-width-z12)+0.25*@scenic-width-z12);
    line-offset: 0.25*(@scenic-offset-z12+0.5*@primary-width-z12);
    [zoom=11] {
      background/line-width: 3*(0.5*(@scenic-offset-z12+0.5*@primary-width-z12)+0.5*@scenic-width-z12);
      line-offset: 0.5*(@scenic-offset-z12+0.5*@primary-width-z12);
    }
    [zoom>=12] {
      background/line-width: 3*(1*(@scenic-offset-z12+0.5*@primary-width-z12)+1*@scenic-width-z12);
      line-offset: 1*(@scenic-offset-z12+0.5*@primary-width-z12);
    }
  }
  comp-op: darken;
}

#small-roads::scenic[scenic='yes'] {
  background/line-color: white;
  background/line-join: bevel;
  background/line-width: 3*0.25*(@scenic-offset-z12+0.5*@tertiary-width-z12)+0.25*@scenic-width-z12;
  line-width: 0.25*@scenic-width-z12;
  line-color: @nsg;
  line-gamma: 0.8;
  line-simplify: 2.5;
  line-offset: 0.25*(@scenic-offset-z12+0.5*@tertiary-width-z12);
  //line-join: round;
  line-cap: round;
  line-miterlimit: 1;
  [zoom=11] {
    background/line-width: 3*0.5*(@scenic-offset-z12+0.5*@tertiary-width-z12)+0.5*@scenic-width-z12;
    line-simplify: 5;
    line-width: 0.5*@scenic-width-z12;
    line-offset: 0.5*(@scenic-offset-z12+0.5*@tertiary-width-z12);
  }
  [zoom>=12] {
    background/line-width: 3*1*(@scenic-offset-z12+0.5*@tertiary-width-z12)+1*@scenic-width-z12;
    line-simplify: 10;
    line-width: 1*@scenic-width-z12;
    line-offset: 1*(@scenic-offset-z12+0.5*@tertiary-width-z12);
  }
  comp-op: darken;
}