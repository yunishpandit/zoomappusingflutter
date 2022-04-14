import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom/resources/authmethods.dart';
import 'package:zoom/resources/firebase_methods.dart';

class JitisMetting{
  Authmethod authmethod=Authmethod();
  final FirebaseMethods methods=FirebaseMethods();
  void createametting({required String roomname,required bool isaudioMuted,required bool isvideomuted,String username=""})async{
      try {
	  FeatureFlag featureFlag = FeatureFlag();
	  featureFlag.welcomePageEnabled = false;
	  featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION;
    String name;
	    if(username.isEmpty){
        name=authmethod.user.displayName!;
      }else{
        name=username;
      }
      var options = JitsiMeetingOptions(
        room: roomname
      )
 
        ..userDisplayName = name
        ..userEmail = authmethod.user.email
        ..userAvatarURL = authmethod.user.photoURL
      
        ..audioMuted = isaudioMuted
        ..videoMuted = isvideomuted;
  methods.addtomettinghistory(roomname);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}