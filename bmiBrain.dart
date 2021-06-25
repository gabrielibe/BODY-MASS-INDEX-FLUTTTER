import 'package:flutter/material.dart';
import 'input_page.dart';

class CalcBa{
  int Age;
  int height;
 int Weight;
  int BMIN=1;
  String verdict='verdict';
  String advice='advice';


 CalcBa({this.Age,this.height,this.Weight});


  int calcbmi(){
    GenderSelector==gender.male?BMIN=height+Weight+Age:BMIN=height*Weight*Age;
    return BMIN;
  }

  String retverdict(){
    if (BMIN<300){
      verdict='you\'re underweight';

    }else if(BMIN>700){
      verdict='you\'re overweight';

    }else{verdict='Solid BMi';
    }
    return verdict;
  }

  String retadvice(){
    if (BMIN<300){

      advice='eat more skinny ass';
    }else if(BMIN>700){

      advice='eat less fat ass';
    }else{verdict='Solid BMi';
    advice='yeah what he said';
    }
    return advice;
  }

}