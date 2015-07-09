# Coffea Backend API

####Base URL: https://pacific-atoll-5255.herokuapp.com

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
  [
  {
    "id": 1,
    "username": "tony",
    "email": "anthony@yahoo.com"
  },
  {
    "id": 2,
    "username": "Beakbeak",
    "email": "beakbeak@gmail.com"
  },
  {
    "id": 8,
    "username": "afranco",
    "email": "anthony_franco@gmail.com"
  }
]
  ```


##Delete Individual User
* Path: `DELETE '/user/:username/delete'`
* Params:
  * username: a string
* Response:
  * Status Code: 201 if successful
  * Example success:
  ``` 
  User has been deleted
  ```

##Edit/Update Individual User
* Path: `PATCH '/user/:username/update'`
* Params: Make sure all params are entered even if to update only one param
  * email: a string
  * password: a string
  * user name: a string
* Response:
  * Status Code: 201 if successful
  * Example success:
  ``` 
  {"user":
  {"id":8,
  "username":"afranco",
  "email":"anthony_franco7@gmail.com"}}
  ```
  
-----------------------------------------------------------------------
##Create New Review
* Path: `POST '/reviews/new'`
* Params:
  * content: a string
  * user_id: an integer
  * establishment_id: an integer
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