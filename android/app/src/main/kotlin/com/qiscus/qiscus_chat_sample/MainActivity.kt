package com.qiscus.qiscus_chat_sample

import androidx.annotation.NonNull
import com.qiscus.meet.MeetJwtConfig
import com.qiscus.meet.MeetSharePref.setRoomId
import com.qiscus.meet.QiscusMeet
import com.qiscus.meet.QiscusMeetActivity.Companion.room
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {

        // setup the appID and baseURL
        QiscusMeet.setup(this.application,"kawan-seh-g857ffuuw9b", "https://meet.qiscus.com");
        QiscusMeet.config()
                .setChat(true)
                .setVideoThumbnailsOn(true)
                .setOverflowMenu(true);

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "qiscusmeet_plugin")
                .setMethodCallHandler { call, result ->

                        val roomId = call.argument<String>("roomId")!!
                        val userId = call.argument<String>("userId")!!

                        // create JWT before making call
                        val jwtConfig =  MeetJwtConfig();
                        jwtConfig.setEmail(userId); // need pass the userID must be unique for each user
                        jwtConfig.build();

                        // set builder jwt object to Qiscus Meet config before making call
                        QiscusMeet.config().setJwtConfig(jwtConfig);


                    if (call.method == "video_call"){
                        // start call
                        if (room.isNotEmpty()) {
                            QiscusMeet.call()
                                    .setTypeCall(QiscusMeet.Type.VIDEO)
                                    .setRoomId(roomId)
                                    .setAvatar("https://upload.wikimedia.org/wikipedia/en/8/86/Avatar_Aang.png")
                                    .setMuted(false)
                                    .setDisplayName(userId)
                                    .build(this);
                        }
                    } else if (call.method == "voice_call") {
                        // start call
                        if (room.isNotEmpty()) {
                            QiscusMeet.call()
                                    .setTypeCall(QiscusMeet.Type.VOICE)
                                    .setRoomId(roomId)
                                    .setAvatar("https://upload.wikimedia.org/wikipedia/en/8/86/Avatar_Aang.png")
                                    .setMuted(false)
                                    .setDisplayName("marco")
                                    .build(this);
                        }
                    } else if (call.method == "answer"){
                        if (room.isNotEmpty()) {
                            QiscusMeet.answer()
                                    .setTypeCall(QiscusMeet.Type.VOICE)
                                    .setRoomId(roomId)
                                    .setAvatar("https://upload.wikimedia.org/wikipedia/en/8/86/Avatar_Aang.png")
                                    .setMuted(false)
                                    .setDisplayName("marco")
                                    .build(this);
                        }
                    }
                }

        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}
