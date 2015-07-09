# Coffea Backend API

##Users Sign Up
* Path: `POST '/users/signup'`
* Params:
  * email: a string
  * password: a string
  * user name: a string
* Response:
  * Status Code: 201 if successful, 422 if unsuccessful
  * Example success:
  ``` 
    { "user":{
      "id":3,
      "username":"whitney_hoggs",
      "email":"whitney1@gmail.com",
      "access_token":"03c0b80efbe2b23a2c0764599ad60015"}
    }
   ```
  * Example Failure:
  ```{"errors":["Email has already been taken"]}```

##Users Login
* Path: `POST '/users/login'`
* Params:
  * password: a string
  * user name: a string
* Response:
  * Status Code: 201 if successful
  * Example success:
  ``` 
  { "user": {
    "id": 3,
    "username": "whitney_hoggs",
    "email": "whitney1@gmail.com",
    "access_token": "03c0b80efbe2b23a2c0764599ad60015"
  }
}
  ```
  
##Show Individual User
* Path: `GET '/users/login'`
* Params:
  * user id: an integer
* Response:
  * Status Code: 201 if successful
  * Example success:
  ``` 
  { "user": {
    "id": 3,
    "username": "whitney_hoggs",
    "email": "whitney1@gmail.com"
  }
}
  ```

##Users Index
* Path: `GET '/users'`
* Params:
  * none
* Response:
  * Status Code: 201 if successful
  * Example success:
  ``` 
  { "user": {
    "id": 3,
    "username": "whitney_hoggs",
    "email": "whitney1@gmail.com",
    "access_token": "03c0b80efbe2b23a2c0764599ad60015"
  }
}
  ```




