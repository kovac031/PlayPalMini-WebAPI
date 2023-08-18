# PlayPalMini-WebAPI
- C#, SQL
- ASP.NET Web API
- .NET Framework 4.7.2
- Autofac, Autofac.WebApi2
- System.IdentityModel.Tokens.Jwt

> A WebAPI app, direct connection to SQL database, use with Postman.

> PlayPalMini is a mini version of a group task which was the final exam of an intensive 255-hour beginner back-end dev course. The original was a 4 man project called PlayPal, an MVC application where the database theme was about renting board games. PlayPalMini is a simplified version of that, but intended to cover all the same features.

> I did it as WebAPI to learn how to do it this way as well.

# Features, challenges and learning points
- multilayer architecture - controller, service, repository layer
- dependency injection, Autofac
- full CRUD for board games, reviews and users
- tuples in C#, neat way to pass custom error/exception messages
- resolving version conflicts, Web.config
- direct connection to database, SqlConnection
- paging, sorting, filtering of lists
- token based user authentication and role based authorization, System.IdentityModel.Tokens.Jwt
- retrieving authenticated user data to dynamically map username, role, Id if/where needed (e.g. UpdatedBy)
- working in Postman

# Some screenshots from Postman
Retrieving a token:
![scr1](https://github.com/kovac031/PlayPalMini-WebAPI/blob/main/postman1.png)

List parameters:
![scr2](https://github.com/kovac031/PlayPalMini-WebAPI/blob/main/postman2.png)

A custom error message due to accessing a method with the wrong user:
![scr3](https://github.com/kovac031/PlayPalMini-WebAPI/blob/main/postman3.png)
