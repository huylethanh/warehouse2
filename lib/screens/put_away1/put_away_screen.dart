// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:stacked/stacked.dart';
// import 'package:warehouse_app/view_models/index.dart';
// import 'package:warehouse_app/widgets/index.dart';

// class PutAwayScreen extends StatelessWidget {
//   const PutAwayScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder.reactive(
//       viewModelBuilder: () {
//         return PutAwayViewModel();
//       },
//       builder: (BuildContext context, PutAwayViewModel viewModel, _) {
//         const vGap = SizedBox(
//           height: 10,
//         );
//         return Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.amber,
//               title: Text("Lưu Khho"),
//               centerTitle: true,
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Column(
//                 children: [
//                   ..._barcodeScanText(context, viewModel),
//                   vGap,
//                   const Divider(),
//                   vGap,
//                   _info(context, viewModel),
//                   vGap,
//                   _partner(context, viewModel),
//                 ],
//               ),
//             ));
//       },
//     );
//   }

//   List<Widget> _barcodeScanText(
//       BuildContext context, PutAwayViewModel viewModel) {
//     return [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Expanded(
//             child: TextFormField(
//               key: UniqueKey(),
//               //   controller: viewModel.controller,
//               //   initialValue: viewModel.scannedBarcode,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Quet thiết bị chứa hàng',
//                 labelStyle: TextStyle(fontSize: 15),
//                 isDense: true,
//                 contentPadding: EdgeInsets.symmetric(
//                   vertical: 10,
//                   horizontal: 10,
//                 ),
//               ),
//               onChanged: (value) {
//                 viewModel.scannedBarcode = value;
//               },
//             ),
//           ),
//           TextButton(
//               onPressed: () {
//                 viewModel.scan(context, viewModel.scannedBarcode);
//               },
//               child: const Icon(FontAwesomeIcons.arrowRight))
//         ],
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       Row(
//         children: const [
//           Icon(
//             FontAwesomeIcons.circleInfo,
//             color: Colors.deepOrangeAccent,
//             size: 15,
//           ),
//           SizedBox(
//             width: 5,
//           ),
//           Expanded(
//             child: Text(
//               "Quét mã thiết bị chứa hàng để đưa tất cả sản phẩm lên vị trí lưu kho",
//               style: TextStyle(
//                 fontSize: 11,
//                 color: Colors.red,
//               ),
//             ),
//           ),
//         ],
//       )
//     ];
//   }

//   Widget _info(BuildContext context, PutAwayViewModel viewModel) {
//     const vGap = SizedBox(
//       height: 10,
//     );
//     return RoundedContainer(
//       backgroundColor: Colors.grey.withOpacity(0.3),
//       innerPadding: EdgeInsets.all(8),
//       child: Column(
//         children: [
//           _titleAndValue(title: "Vị trí thao tác", value: "value"),
//           vGap,
//           _titleAndValue(title: "Số lượng barcode có thể đặt", value: "value"),
//         ],
//       ),
//     );
//   }

//   Widget _partner(BuildContext context, PutAwayViewModel viewModel) {
//     const vGap = SizedBox(
//       height: 10,
//     );
//     return RoundedContainer(
//       backgroundColor: Colors.grey.withOpacity(0.3),
//       innerPadding: EdgeInsets.all(8),
//       child: Column(
//         children: [
//           _titleAndValue(title: "Khách hàng", value: "value"),
//           vGap,
//           _titleAndValue(title: "Tổng trọng lượng", value: "value"),
//         ],
//       ),
//     );
//   }

//   Widget _titleAndValue(
//       {required String title, required String value, TextStyle? textStyle}) {
//     return DefaultTextStyle(
//       style: textStyle ??
//           const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//           ),
//           Text(value),
//         ],
//       ),
//     );
//   }
// }
