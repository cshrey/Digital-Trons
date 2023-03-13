import 'package:url_launcher/url_launcher.dart';

launchUrlLink(String urlLink) async {
  var url = urlLink;
  if (!url.contains("http")) url = "http://" + url;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


