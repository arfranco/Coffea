# Coffea Backend API

##Overview


All access is over HTTPS and access is from the [https://pacific-atoll-5255.herokuapp.com] (https://pacific-atoll-5255.herokuapp.com) domain. All data is sent and received as JSON.

###Access Token

Every request assumes an access token unless stated otherwise. The access token must be provided in the header.

To do this make sure you set 'Access-Token' equal to the user's access token in every required request. An example of how this should look is as follows:

```['Access-Token'] = 'f16395873f4bcee7ef5d46e531b9f659'```

####Unauthorized

If a user is unauthorized to make a request, the following json response will be given:

```
Response Status Code: 401

{"message": "Access-Token not found."}
```



##Users Sign Up
* Path: `POST '/users/signup'`
* Access-Token: Not required.
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
* Access-Token: Not required.
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
  
##Show Individual/Specific User
* Path: `GET '/user/:id'`
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
  * flagged: a boolean
  * image_url: a string 
* Response:
  * Status Code: 201 if successful, 422 if unsuccessful
  * Example success:
  ``` 
    {"review":
    {"content":"This is a test review",
    "user_id":1,
    "establishment_id":1,
    "flagged":false,
    "image_url":""}}
   ```

##Show Individual/Specific Review
* Path: `GET '/review/:id'`
* Params:
  * review id: an integer
* Response:
  * Status Code: 201 if successful
  * Example success:
  ``` 
  {"review":
    {"content":"This is a test review",
    "user_id":1,
    "establishment_id":1,
    "flagged":false,
    "image_url":""}}
  ```

##Reviews Index
* Path: `GET '/reviews'`
* Params:
  * none
* Response:
  * Status Code: 201 if successful
  * Example success:
``` 
  [
  {
    "id": 1,
    "content": "This is a test review",
    "user_id": 2
    "establishment_id": 1
    "flagged": false
    "image_url": ""
  },
  {
    "id": 2,
    "content": "The coffee at this place is BEYOND amazing",
    "user_id": 3
    "establishment_id": 2
    "flagged": false
    "image_url": "http://www.hercampus.com/sites/default/files/2014/12/11/hc%20coffee%20shop_1.jpg"
  },
  {
    "id": 3,
    "content": "The wifi here was really fast",
    "user_id": 5
    "establishment_id": 1
    "flagged": false
    "image_url": ""
  }
]
  ```

##Delete Individual Review
* Path: `DELETE '/review/:id'`
* Params:
  * review id: an integer
* Response:
  * Status Code: 201 if successful
  * Example success:
  ``` 
  Review has been deleted
  ```
  
##Edit/Update Individual Review
* Path: `PATCH '/review/:id'`
* Params: Make sure all params are entered even if to update only one param
  * content: a string
  * flagged: a boolean
  * image_url: a string
* Response:
  * Status Code: 201 if successful
  * Example success:
  ``` 
  {"review":
    {"content":"This is an updated test review",
    "user_id":1,
    "establishment_id":1,
    "flagged":false,
    "image_url":""}}
  ```
  