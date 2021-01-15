// To parse this JSON data, do
//
//     final systemEventRequest = systemEventRequestFromJson(jsonString);

import 'dart:convert';

SystemEventRequest systemEventRequestFromJson(String str) => SystemEventRequest.fromJson(json.decode(str));

String systemEventRequestToJson(SystemEventRequest data) => json.encode(data.toJson());

class SystemEventRequest {
    SystemEventRequest({
        this.systemEventType,
        this.roomId,
        this.subjectEmail,
        this.message,
        this.payload,
    });

    String systemEventType;
    String roomId;
    String subjectEmail;
    String message;
    Payload payload;

    factory SystemEventRequest.fromJson(Map<String, dynamic> json) => SystemEventRequest(
        systemEventType: json["system_event_type"],
        roomId: json["room_id"],
        subjectEmail: json["subject_email"],
        message: json["message"],
        payload: Payload.fromJson(json["payload"]),
    );

    Map<String, dynamic> toJson() => {
        "system_event_type": systemEventType,
        "room_id": roomId,
        "subject_email": subjectEmail,
        "message": message,
        "payload": payload.toJson(),
    };
}

class Payload {
    Payload({
        this.type,
        this.callEvent,
        this.callRoomId,
        this.callIsVideo,
        this.callCaller,
        this.callCallee,
    });

    String type;
    String callEvent;
    String callRoomId;
    bool callIsVideo;
    CallCalle callCaller;
    CallCalle callCallee;

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        type: json["type"],
        callEvent: json["call_event"],
        callRoomId: json["call_room_id"],
        callIsVideo: json["call_is_video"],
        callCaller: CallCalle.fromJson(json["call_caller"]),
        callCallee: CallCalle.fromJson(json["call_callee"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "call_event": callEvent,
        "call_room_id": callRoomId,
        "call_is_video": callIsVideo,
        "call_caller": callCaller.toJson(),
        "call_callee": callCallee.toJson(),
    };
}

class CallCalle {
    CallCalle({
        this.username,
        this.name,
        this.avatar,
    });

    String username;
    String name;
    String avatar;

    factory CallCalle.fromJson(Map<String, dynamic> json) => CallCalle(
        username: json["username"],
        name: json["name"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "name": name,
        "avatar": avatar,
    };
}
