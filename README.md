# ✨ Base Classes

Make use of all custom base classes for code simplicity

## 🎖 Installing
```yaml
dependencies:
  base_classes: ^0.0.2
```

# Getting Started

You basically have multiple base widgets that you can use:
**• CustomScaffold**,
**• CustomButton**,
**• CustomText**,
**• CustomTextForm Field**,
**• CustomTextForm Appbar**,
**• Constant class** - It consist of various ease constant instances ,
**• Navigation class**,
**• Shared Preference class**,
**• AfterInit Class** - For getting context just after init method,
**• Basic styles and Strings class**,
**• Loader class**,

## 🚀 Showcase Demo

<table>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/shubhamsinghal06/base_classes/master/demo/base_classes.gif" width="180px" height="340px">
      <br />
    </td>
  </tr>
</table>

Example:

```dart
CustomScaffold(
        appBar: CustomAppBar(
            leading: kBackArrow(context,
                onTap: () {}, arrowColor: blackColor, imagePath: 'left_arrow'),
            preferredSize: kAppbarPreferredHeight,
            title: Strings.home,
            scaffoldKey: scaffoldKey),
        resizeToAvoidBottomPadding: true,
        onWillPop: () => Future.value(false),
        isLoading: /*true*/ false,
        body: Container(
            child: kScrollingView(Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 150.0),
                  CustomText(text: Strings.ok, fontSize: size20),
                  SizedBox(height: 150.0),
                  CustomTextFormLabel(
                      keyBoardType: TextInputType.text,
                      labelText: Strings.enterHere,
                      textInputAction: TextInputAction.done),
                  SizedBox(height: 150.0),
                  CustomButton(
                      onTap: () {
                        kYesNoSheet(
                            context: context,
                            yes: () {},
                            no: () {},
                            heading: Strings.home);
                      },
                      text: Strings.submit,
                      textColor: whiteColor,
                      width: 150.0,
                      height: 55.0,
                      buttonColor: orangeColor),
                  SizedBox(height: 150.0),
                  kClickAction(
                      context: context,
                      child: kNetworkCachedCircularImage(
                          context, Strings.dummyImageURL,
                          height: 150.0, width: 150.0),
                      onTap: () {
                        kYesNoDialog(
                            context: context,
                            yes: () {},
                            no: () {},
                            centerText: Strings.home);
                      }),
                  SizedBox(height: 150.0),
                ])),
            margin: EdgeInsets.symmetric(horizontal: kBodyPadding)),
        scaffoldKey: scaffoldKey)
```
## ☀️ Author

<table>
  <tr>
    <td align="center">
      <a href = "https://www.instagram.com/shubhamsinghal06/?hl=en"><img src="https://instagram.fdel3-1.fna.fbcdn.net/v/t51.2885-19/s320x320/156851599_782821252646264_2570625904767377381_n.jpg?tp=1&_nc_ht=instagram.fdel3-1.fna.fbcdn.net&_nc_ohc=mDfXtKmRKrQAX8-OEBe&edm=ABfd0MgAAAAA&ccb=7-4&oh=2760b56246fe28c9ae4b2946cf9dff1b&oe=60A2270B&_nc_sid=7bff83" width="72" alt="Jeremiah Ogbomo" /></a>
      <p align="center">
        <a href = "https://github.com/shubhamsinghal06"><img src = "https://www.iconninja.com/files/241/825/211/round-collaboration-social-github-code-circle-network-icon.svg" width="18" height = "18"/></a>
        <a href = "https://www.linkedin.com/in/shubhamsinghal06/"><img src = "https://www.iconninja.com/files/863/607/751/network-linkedin-social-connection-circular-circle-media-icon.svg" width="18" height="18"/></a>
      </p>
    </td>
  </tr> 
</table>

## ⭐️ License

MIT License
