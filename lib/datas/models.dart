/*
 * @author chengpenggao
 * @date 2019/10/15
 */

class UserBeanEntity {
  String userId;
  String name;
  String headUrl;

  UserBeanEntity({this.userId, this.name, this.headUrl});

  UserBeanEntity.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    name = json['name'];
    headUrl = json['headUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this.userId;
    data['name'] = this.name;
    data['headUrl'] = this.headUrl;
    return data;
  }
}
