# Coffea Backend API

## Table of Contents
1. [Overview](#overview)
2. [User Model](#users-model)
  * [Sign Up](#users-sign-up)
  * [Login](#users-login)
  * [Show](#show-specific-user)
  * [Index](#users-index)
  * [Delete](#delete-individual-user)
  * [Update](#update-individual-user)
3. [Reviews Model](#reviews-model)
  * [Create](#create-new-review)
  * [Show](#show-specific-review)
  * [Index](#reviews-index)
  * [Delete](#delete-individual-review)
  * [Update](#update-individual-review)
4. [Establishments Model](#establishments-model)
  *	 [Create](#create-new-establishment)
  * [Show](#show-specific-establishment)
  * [Index](#establishments-index)
  * [Update](#update-individual-establishment)

##Overview


All access is over HTTPS and access is from the [https://pacific-atoll-5255.herokuapp.com] (https://pacific-atoll-5255.herokuapp.com) domain. All data is sent and received as JSON.

###Access Token

Every request assumes an access token unless stated otherwise. The access token must be provided in the header.

To do this make sure you set ```'Access-Token'``` equal to the user's access token in every required request. An example of how this should look is as follows:

```['Access-Token'] = 'f16395873f4bcee7ef5d46e531b9f659'```

####Unauthorized

If a user is unauthorized to make a request, the following json response will be given:

```
Response Status Code: 401

{"message": "Access-Token not found."}
```


##Users Model
###Users Sign Up
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

###Users Login
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
  
###Show Specific User
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

###Users Index
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


###Delete Individual User
* Path: `DELETE '/user/:username/delete'`
* Params:
  * username: a string
* Response:
  * Status Code: 201 if successful
  * Example success:
  ``` 
  User has been deleted
  ```

###Update Individual User
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
##Reviews Model
###Create New Review
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
    {"id": 1,
    "content":"This is a test review",
    "user_id":1,
    "establishment_id":1,
    "flagged":false,
    "image_url":""}}
   ```

###Show Specific Review
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

###Reviews Index
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

###Delete Individual Review
* Path: `DELETE '/review/:id'`
* Params:
  * review id: an integer
* Response:
  * Status Code: 201 if successful
  * Example success:
  ``` 
  Review has been deleted
  ```
  
###Update Individual Review
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
  
------------------------------------------------------------------------
##Establishments Model
###Create New Establishment
* Path: `POST '/establishments/new'`
* Params:
  * name: a string
  * street_address: a string
  * city: a string 
  * state: a string
  * zip_code: an integer
  * coffee_quality: an integer
  * price: an integer
  * ambiance: an integer
  * wifi: an integer
* Response:
  * Status Code: 201 if successful, 422 if unsuccessful
  * Example success:
  ``` 
    {"establishment":
    {"id":2,
    "name":"Joe's Coffee Shop",
    "street_address":"115 MLK Drive",
    "city":"Atlanta",
    "state":"Georgia",
    "zip_code":30303,
    "coffee_quality":2,
    "price":1,
    "ambiance":3,
    "wifi":2}}
   ```

###Show Specific Establishment
* Path: `GET '/establishment/:id'`
* Params:
  * establishment id: an integer
* Response:
  * Status Code: 201 if successful
  * Example success:
  ``` 
    {"establishment":
    {"name":"Joe's Coffee Shop",
    "street_address":"115 MLK Drive",
    "city":"Atlanta",
    "state":"Georgia",
    "zip_code":30303,
    "coffee_quality":2,
    "price":1,
    "ambiance":3,
    "wifi":2}}
   ```
 
###Establishments Index
* Path: `GET '/establishments'`
* Params:
  * none
* Response:
  * Status Code: 201 if successful
  * Example success:
``` 
  [
   {
   	"id": 1,
   	"name":"Joe's Coffee Shop",
    "street_address":"115 MLK Drive",
    "city":"Atlanta",
    "state":"Georgia",
    "zip_code":30303,
    "coffee_quality":2,
    "price":1,
    "ambiance":3,
    "wifi":2
    },
  {
   	"id": 2,
   	"name":"Coffee Beans",
    "street_address":"143 Pomona Ave",
    "city":"Marietta",
    "state":"Georgia",
    "zip_code":30303,
    "coffee_quality":1,
    "price":1,
    "ambiance":3,
    "wifi":3
    },
  {
   	"id": 3,
   	"name":"Buenos Dias Coffee Shop",
    "street_address":"5600 North Dr",
    "city":"Atlanta",
    "state":"Georgia",
    "zip_code":30303,
    "coffee_quality":3,
    "price":3,
    "ambiance":2,
    "wifi":3
    }
]
  ```
  
###Update Individual Establishment
* Path: `PATCH '/establishment/:id'`
* Params: Make sure all params are entered even if to update only one param
  * name: a string
  * street_address: a string
  * city: a string 
  * state: a string
  * zip_code: an integer
  * coffee_quality: an integer
  * price: an integer
  * ambiance: an integer
  * wifi: an integer
* Response:
  * Status Code: 201 if successful
  * Example success:
  ``` 
  	{"establishment":
    {"name":"Joe's Coffee Shop",
    "street_address":"115 MLK Drive",
    "city":"Atlanta",
    "state":"Georgia",
    "zip_code":30304,
    "coffee_quality":3,
    "price":2,
    "ambiance":3,
    "wifi":2}}
  ```