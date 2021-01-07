---
title: GraphQL + Elixir (Absinthe)
author: Adi Iyengar
patat:
    incrementalLists: true
    theme:
        emph: [vividWhite, onVividBlack, bold]
        imageTarget: [onDullWhite, vividRed]
---

## AGENDA

- What is GraphQL

- What does GraphQL offer?

- When to pick GraphQL over REST?

- GraphQL Fundamentals

- GraphQL Server in Elixir using Absinthe

- Some Finishing thoughts

- Q/A (Discussion)


## WHAT IS GRAPHQL?

- Query Language for APIs developed by Facebook; Open Source

- Clients send a GraphQL document to the server and the server responds with
  a JSON document.

- It gives the users of the API the ability to describe the data they want.

- Independent of the Transport layer (traditionally HTTP POST).

- Great for exposing relational data


## WHAT DOES GRAPHQL OFFER?

- Gives the client control over the shape of the data

- Strongly typed API

- Introspective features

- Contract-Driven by nature

- Built-in versioning

- Self documentation.. kind of.. `¯\_(ツ)_/¯`

- Ability to easily aggregate multiple APIs into one

- Great open-source ecosystem and support in the community (especially Absinthe)

- Easy to learn and __implement*__


## WHEN TO PICK GRAPHQL OVER REST?

* `(⌐■_■)` "If REST is a fine dining RESTaurant, GraphQL is a buffet.."

* Pick GraphQL over REST:

    - When the client needs to fetch different combinations of nested data
      associations

    - Support faster iterations or volatile requirements

    - When you're tired of v1, v2 .... `(╥﹏╥)`

    - Easily establish client-server contract

    - Support faster Development overall

    - Easily protect from overfetching

    - Lesser need for API documentation

    - Easily aggregate multiple APIs into one

## GRAPHQL FUNDAMENTALS

* Schema:

    - Contract!

    - Graphical representation of the shape of the API

    - Stores Types, Fields, Descriptions, Deprecations etc

    - Written in SDL

* Root Types:

     - Query

     - Mutation

     - Subscription

* Scalar Types:

    - Primitive Scalar types:
        - ID, Int, Float, Boolean, String

    - Easy to add custom scalar types

* Object Types and fields:

    - Objects represent what you want to fetch from the service.

    - Object is a type with some fields.

    - Each field can either be a scalar type or an object.

* Arguments

    - Every field on a GraphQL object has zero or more arguments

    - Arguments are named

    - They can be required, optional or have defaults

* Other fundamentals:
    - Enum Type, Interfaces, Union Types, Input Types, Variables, Fragments etc..


##  GraphQL + Elixir = ♥

* Absinthe!

    - Framework to write a GraphQL server in Elixir

    - Great documentation (for the most part..)

    - Super helpful slack channel!

    - Good performance

    - Proven: Used by many Elixir production apps over last 3 years.

    - Has many advanced features like DataLoaders, GraphiQL integration,
      Phoenix integration, Auth Plugs etc

* Product Store use case [Elixir/Coding/Demo]

    - Ecto app (Elixir wrapper around the DB):
        - Products, Categories and Aisles

    - StoreAdmin App:
        - Finds what aisle to place a new product in based on it's category,
          storage requirements (refridgerated, frozen etc) and size

    - Currently StoreAdmin talks with the Ecto app at the Application layer
      using Elixir.

    - Elixir implementation shows a lack of contextual boundary between
      apps

    - REST implementation
        - multiple requests
        - with a proper boundary

    - GraphQL implementation
        - Schema
        - GraphiQL
        - schema.json & Static Query validation

## Things to Consider

* Flexibility comes with Complexity

    - Harder to cache HTTP requests as the requests are more dynamic

    - Application state isn't driven by the server anymore

    - Locked to JSON representation

    - Potential scaling and performance issues

* Conway's Law is a huge factor

## Discussion

```
(\______/)
( ͡ ͡° ͜ ʖ ͡ ͡°)
  \╭☞   \╭☞
```

```
 ________  __                    __    __                ______                                __         ______   __
/        |/  |                  /  |  /  |              /      \                              /  |       /      \ /  |
$$$$$$$$/ $$ |____    ______   _$$ |_ $$/_______       /$$$$$$  |  ______   ______    ______  $$ |____  /$$$$$$  |$$ |
   $$ |   $$      \  /      \ / $$   |$//       |      $$ | _$$/  /      \ /      \  /      \ $$      \ $$ |  $$ |$$ |
   $$ |   $$$$$$$  | $$$$$$  |$$$$$$/  /$$$$$$$/       $$ |/    |/$$$$$$  |$$$$$$  |/$$$$$$  |$$$$$$$  |$$ |  $$ |$$ |
   $$ |   $$ |  $$ | /    $$ |  $$ | __$$      \       $$ |$$$$ |$$ |  $$/ /    $$ |$$ |  $$ |$$ |  $$ |$$ |_ $$ |$$ |
   $$ |   $$ |  $$ |/$$$$$$$ |  $$ |/  |$$$$$$  |      $$ \__$$ |$$ |     /$$$$$$$ |$$ |__$$ |$$ |  $$ |$$ / \$$ |$$ |_____
   $$ |   $$ |  $$ |$$    $$ |  $$  $$//     $$/       $$    $$/ $$ |     $$    $$ |$$    $$/ $$ |  $$ |$$ $$ $$< $$       |
   $$/    $$/   $$/  $$$$$$$/    $$$$/ $$$$$$$/         $$$$$$/  $$/       $$$$$$$/ $$$$$$$/  $$/   $$/  $$$$$$  |$$$$$$$$/
                                                                                    $$ |                     $$$/
                                                                                    $$ |
                                                                                    $$/
```
