import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

class RabbitHome extends StatefulWidget {
  const RabbitHome({Key? key}) : super(key: key);
  @override
  State<RabbitHome> createState() => _RabbitHomeState();
}

class _RabbitHomeState extends State<RabbitHome> {
  final QuillController _controller = QuillController.basic();
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    // final defaultStyles = DefaultStyles.getInstance(context).merge(
    //     DefaultStyles(
    //         paragraph: DefaultTextBlockStyle(
    //             const TextStyle(fontSize: 24, color: Colors.black),
    //             const VerticalSpacing(16, 0),
    //             const VerticalSpacing(0, 0),
    //             null)));
    return Scaffold(
      body: Column(
        children: [
          QuillToolbar.basic(
            controller: _controller,
            showInlineCode: false,
            showSubscript: false,
            showSuperscript: false,
            showFontFamily: false,
            showIndent: false,
            fontSizeValues: const {
              '小字号': '8',
              '中字号': '24.5',
              '大字号': '46',
              '清除': '0',
            },
            showAlignmentButtons: true,
            afterButtonPressed: _focusNode.requestFocus,
            // fontFamilyValues: {
            //   '霞骛文楷': 'LXGWWenKai',
            // },
          ),
          // const Text('大白兔奶糖', style: TextStyle(fontSize: 32)),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 234, 236, 240),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Column(
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      Container(
                          height: 550,
                          constraints: const BoxConstraints(
                              minWidth: 400, maxWidth: 700),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(5, 5),
                                  blurRadius: 10,
                                  spreadRadius: 2),
                            ],
                          ),
                          child: QuillEditor(
                            controller: _controller,
                            scrollController: ScrollController(),
                            scrollable: true,
                            focusNode: _focusNode,
                            autoFocus: false,
                            readOnly: false,
                            placeholder: 'Add content',
                            enableSelectionToolbar: false,
                            expands: false,
                            padding: const EdgeInsets.all(16),
                            // onImagePaste: _onImagePaste,
                            // onTapUp: (details, p1) {
                            //   return _onTripleClickSelection();
                            // },
                            //customStyles: defaultStyles,
                            // embedBuilders: [
                            //   ...FlutterQuillEmbeds.builders(),
                            //   TimeStampEmbedBuilderWidget()
                            // ],
                          )),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
