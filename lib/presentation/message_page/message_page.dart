import 'widgets/chatlist_item_widget.dart';
import 'models/chatlist_item_model.dart';
import 'models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:utibu/core/app_export.dart';
import 'provider/message_provider.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  MessagePageState createState() => MessagePageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MessageProvider(), child: MessagePage());
  }
}

class MessagePageState extends State<MessagePage>
    with AutomaticKeepAliveClientMixin<MessagePage> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 31.v),
                  _buildChatList(context)
                ]))));
  }

  /// Section Widget
  Widget _buildChatList(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Consumer<MessageProvider>(builder: (context, provider, child) {
          return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 24.v);
              },
              itemCount: provider.messageModelObj.chatlistItemList.length,
              itemBuilder: (context, index) {
                ChatlistItemModel model =
                    provider.messageModelObj.chatlistItemList[index];
                return ChatlistItemWidget(model, onTapChat: () {
                  onTapChat(context);
                });
              });
        }));
  }

  /// Navigates to the chatScreen when the action is triggered.
  onTapChat(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.chatScreen,
    );
  }
}
