
 ``` {
  "greeting": "สวัสดี {firstName}",
  "@greeting": {
    "description": "ข้อความทักทายที่มีชื่อผู้ใช้งาน",
    "placeholders": {
      "firstName": {
        "type": "String",
        "example": "สมชาย"
      }
    }
  }
} 
```

### String firstName = "สมชาย";
## String greetingMessage = AppLocalizations.of(context)!.greeting(firstName);
## print(greetingMessage);

