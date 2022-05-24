import 'dart:io';

///"A test fixture is something used to consistently test some item, device, or piece of software."
String fixture(String name) => File('test/fixtures/$name').readAsStringSync();
