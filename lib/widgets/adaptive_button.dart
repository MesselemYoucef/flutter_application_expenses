import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class AdaptiveButton extends StatelessWidget {
  final String text;
  final Function handler;
  AdaptiveButton(this.handler, this.text);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? CupertinoButton(
                      onPressed: (){
                        handler();
                      },
                      child: Text(
                        text,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                    :TextButton(  
                      onPressed: (){
                        handler();
                      },
                      child: Text(
                        text,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
  }
}