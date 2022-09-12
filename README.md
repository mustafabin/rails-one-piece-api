# One Piece API

### RESTful api that uses [faker data](https://github.com/faker-ruby/faker/blob/master/doc/japanese_media/one_piece.md) to randomly generate One Piece characters and devil fruits

> This is a rails api on a sqlite database

# Getting started

install project dependencies

    $ bundle install

migrate database then seed data

    $ rails db:migrate
    $ rails db:seed

run rails server

    $ rails server

# Usage

## Important Routes

- [`/users` - All Users](#/characters)
- [`/users/:id` - One User and their devil fruit(s)](#/detail)
- [`/devil_fruits` - All stored devil fruits](#/devil_fruits)
- [`/devil_fruits` - Give yourself a devil fruit](#/devil_fruits)

<div id='/characters'></div>

### `/users` – All Users

**Link**

- `http://127.0.0.1:9292/users`

#### Method

| URI     | HTTP Method | Headers |
| ------- | ----------- | ------- |
| `users` | GET         | None    |

#### Request Parameters

| Parameter | Type | Description | Required? |
| --------- | ---- | ----------- | --------- |
| ---       | ---  | ---         | ---       |

**Example Response:**

```JSON
[
    {
        "id": 67,
        "name": "Trafalgar D. Water Law",
        "email": "TrafalgarD.WaterLaw@bounty.com",
        "qoute": "I love heroes, but I don't want to be one. Do you even know what a hero is!? For example, you have some meat. Pirates will feast on the meat, but the hero will distribute it among the people! I want to eat the meat!",
        "created_at": "2022-09-09T17:11:20.076Z",
        "updated_at": "2022-09-09T17:11:20.076Z"
    },
    {
        "id": 69,
        "name": "Momonosuke",
        "email": "Momonosuke@bounty.com",
        "qoute": "Maybe nothing in this world happens by accident. As everything happens for a reason, our destiny slowly takes form.",
        "created_at": "2022-09-09T17:11:20.591Z",
        "updated_at": "2022-09-09T17:11:20.591Z"
    },
    ....
]
```

<div id='/detail'></div>

### `/users/:id` – Character Details

**Link**

- `http://127.0.0.1:9292/users/1`

#### Method

| URI         | HTTP Method | Headers |
| ----------- | ----------- | ------- |
| `users/:id` | GET         | None    |

#### Request Parameters

| Parameter | Type | Description | Required? |
| --------- | ---- | ----------- | --------- |
| id        | Int  | ---         | yes       |

**Example Response:**

```JSON
{
    "id": 67,
    "name": "Trafalgar D. Water Law",
    "email": "TrafalgarD.WaterLaw@bounty.com",
    "qoute": "I love heroes, but I don't want to be one. Do you even know what a hero is!? For example, you have some meat. Pirates will feast on the meat, but the hero will distribute it among the people! I want to eat the meat!",
    "devil_fruits": [
        {
            "id": 66,
            "name": "Chiyu Chiyu no Mi",
            "user_id": "67",
            "df_type": "",
            "sale": false,
            "created_at": "2022-09-09T17:11:20.082Z",
            "updated_at": "2022-09-09T17:11:20.082Z"
        }
    ]
}
```

<div id='/devil_fruits'></div>

### `/devil_fruits` – All Devil Fruits

**Link**

- `http://127.0.0.1:9292/devil_fruits`

#### Method

| URI      | HTTP Method | Headers |
| -------- | ----------- | ------- |
| `fruits` | GET         | None    |

#### Request Parameters

| Parameter | Type | Description | Required? |
| --------- | ---- | ----------- | --------- |
| ---       | ---  | ---         | ---       |

**Example Response:**

```JSON
[
  {
    "id": 21,
    "name": "Ishi Ishi no Mi",
    "user_id": "26",
    "created_at": "2022-08-31T21:06:27.559Z",
    "updated_at": "2022-08-31T21:06:27.559Z",
  },
  {
    "id": 22,
    "name": "Ori Ori no Mi",
    "user_id": "27",
    "created_at": "2022-08-31T21:06:27.561Z",
    "updated_at": "2022-08-31T21:06:27.561Z",
  }
  ...
]
```

<div id='/devil_fruits'></div>

### `/devil_fruits` – Add devil fruit to a character

**Link**

- `http://127.0.0.1:9292/devil_fruits`

#### Method

| URI            | HTTP Method | Headers | Authenticated |
| -------------- | ----------- | ------- | ------------- |
| `devil_fruits` | POST        | None    | Yes           |

#### Example Body

```JSON
{
    "name": "Magu Magu no Mi",
    "df_type":"Logia"
}
```

**Example Response:**

```JSON
{
    "id": 83,
    "name": "mustafa",
    "email": "mustafa@binalhag.dev",
    "qoute": "test",
    "devil_fruits": [
        {
            "id": 79,
            "name": "Magu Magu no Mi",
            "user_id": "83",
            "df_type": "Logia",
            "sale": null,
            "created_at": "2022-09-12T15:14:12.513Z",
            "updated_at": "2022-09-12T15:14:12.513Z"
        }
    ]
}
```
