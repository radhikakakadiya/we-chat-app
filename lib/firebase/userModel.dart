class UserModel{
  final String name;
  UserModel(this.name);

toJson(){
  return {
    "Name": name
  };
}
}