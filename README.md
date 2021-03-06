# User stories
```
Show a list of bookmarks
As a user
to be able to access my bookmarked sites
I want to see a list of saved bookmarks

Add new bookmarks
As a user
to be able to build up my bookmark list over time
I want to save new URLs

Delete bookmarks
As a user
to keep my list up to date
I want to delete old unused bookmarks

Update bookmarks
As a user
to keep my list up to date
I want to update existing bookmarks

Comment on bookmarks
As a user
to be able to remember about the bookmarked sites
I want to be able to attach comments to them


Tag bookmarks into categories
As a user
to easily search for my bookmarked sites
I want to be able to tag them into categories

Filter bookmarks by tag
As a user
to easily search for my bookmarked sites
I want to be able to search for them by tags

Users manage their bookmarks
As an administrator
to allow several users using the app
I want them to be able to access their own list
```
# Domain model
```
┌──────┐            ┌──────────┐                   ┌─────┐                       ┌────────┐          ┌────┐
│Client│            │Controller│                   │Model│                       │Database│          │View│
└──┬───┘            └────┬─────┘                   └──┬──┘                       └───┬────┘          └─┬──┘
   │ Sends a get request │                            │                              │                 │   
   │ ────────────────────>                            │                              │                 │   
   │                     │                            │                              │                 │   
   │                     │ Requests values from Model │                              │                 │   
   │                     │ ───────────────────────────>                              │                 │   
   │                     │                            │                              │                 │   
   │                     │                            │ Queries for saved information│                 │   
   │                     │                            │ ─────────────────────────────>                 │   
   │                     │                            │                              │                 │   
   │                     │                            │   Returns saved information  │                 │   
   │                     │                            │ <─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─                 │   
   │                     │                            │                              │                 │   
   │                     │ Returns the reauired values│                              │                 │   
   │                     │ <─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─                              │                 │   
   │                     │                            │                              │                 │   
   │                     │                            Sends and HTTP message         │                 │   
   │                     │ ────────────────────────────────────────────────────────────────────────────>   
   │                     │                            │                              │                 │   
   │                     │                            Returns the html code          │                 │   
   │                     │ <─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─    
   │                     │                            │                              │                 │   
   │ Return the html code│                            │                              │                 │   
   │ <─ ─ ─ ─ ─ ─ ─ ─ ─ ─                             │                              │                 │   
┌──┴───┐            ┌────┴─────┐                   ┌──┴──┐                       ┌───┴────┐          ┌─┴──┐
│Client│            │Controller│                   │Model│                       │Database│          │View│
└──────┘            └──────────┘                   └─────┘                       └────────┘          └────┘
```

# Database
```
To create the database:
- Connect to psql
- Create the database using the psql command CREATE DATABASE bookmark_manager;
- Connect to the database using the pqsl command \c bookmark_manager;
- Run the query saved in the file 01_create_bookmarks_table.sql to create the required table
- To be able to connect our code to the database we need to install gem pg, which is now in our Gemfile.
- Create a new database just for testing 'bookmark_manager_test' purposes and create the same table 'bookmarks'.
- Created a button in the main index to take the user to managing their database.
- 
```
