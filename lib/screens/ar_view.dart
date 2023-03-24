import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ARCore extends StatefulWidget {
  const ARCore({super.key});


  @override
  _ARCoreState createState() => _ARCoreState();
}

class _ARCoreState extends State<ARCore> {
  late ArCoreController arCoreController;
  _onArCoreViewCreated(ArCoreController _arCoreController){
    arCoreController = _arCoreController;
   // _addSphere(arCoreController);
    _addModel(_arCoreController);


  }
  _addSphere(ArCoreController _arCoreController) {
    final material = ArCoreMaterial(color: Colors.deepPurple, );
    final sphere = ArCoreSphere(materials: [material], radius: 0.2,);
    final node = ArCoreNode(
      shape: sphere,
      position: vector.Vector3(
          0, -0.3, -1
      ),
    );
    _arCoreController.addArCoreNode(node);
  }

  _addModel(ArCoreController _arCoreController) async {
    final ByteData textureBytes = await rootBundle.load('assets/scene.gltf');
    final ByteData objectBytes = await rootBundle.load('assets/earth.gltf');

    final material = ArCoreMaterial(
      color: Colors.white,
      metallic: 1,
      roughness: 0.2,
      textureBytes: textureBytes.buffer.asUint8List(),
    );

    final cube = ArCoreCube(
      materials: [material],
      size: vector.Vector3(0.2, 0.2, 0.2),
    );

    final node = ArCoreNode(
      shape: cube,
      position: vector.Vector3(0, 0, -1),
      rotation: vector.Vector4(0, 1, 0, 0),
    );

    _arCoreController.addArCoreNode(node);
  }



  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
      ),
    );
  }
}