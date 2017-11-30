1. Start a new Rails project

  rails new name --database-postgresql

  edit Gemfile, then bundle install
    gem 'pry-rails'
    gem 'better_errors'
    gem 'binding_of_caller'
    gem 'bcrypt'
    gem 'annotate'

  start Rails server

  create a database
    db:
      create
      drop
      migrate
      seed
      schema:load
      setup - create + schema:load + seed
      reset - drop + setup

2. Migration
  rails g model ModelName col1:type col2:type ... (default type: string)
    generate model & migration

    migration methods
      add_index :tablename, :columnname
      add_column :tablename, :columnname, :type
      remove_column :tablename, :columnname
      add_timestamps - will create both created_at & updated_at columns

    migration options
      unqiue
      null
      default
      index
      limit

3. Model
  add needed validations (validates vs validate)
    presence
    uniqueness
    inclusion, exclusion => inclusion: {in: [list]}   ##[list] %w(item1 item2 ...)
    length => length: {minimun: ,maximum: }
    allow_nil

  associations
    belongs_to, has_many, has_one, has_many(through)
    *DO NOT forget the COMMAS*

  User For Authentication
    ::generate_session_token
      SecureRandom.urlsafe_base64 (default length: 16bytes)

    #reset_session_token!
      assign a session token to the user
      save the user & return the session_token

    #ensure_session_token
      lazy assignment of a session token to the user
      *after_initialize*

    #password=(password)
      create an instance variable to validate the password
      converts the password into a hash (password_digest)
        BCrypt::Password.create

    #is_password?(password)
      compares the password with the stored password_digest
        BCrypt::Password.new

    ::find_by_credentials(username, password)
      search user with username
        *find_by_colname*
      return user if the user exists and the password matches else nil


4. Controller
  rails g controller controller_names action
    generates the controller and the view folder

  Users
    new
      render the new template
    create
      *user_params*
      create a new user
      if save, login and redirect
      else, error and back to create
    show
      render the show template

  Sessions
    new
      render the new template
    create
      find the user using the credentials
      if found, login and redirect
      else, error and back to login
    destory
      reset the current_user's session_token
      delete the session_token in the cookie
      redirect to login

  ApplicationController
    Helper Method For Views
      #current_user
      current user is the user with the matching session_token

      #login!(user)
      sets the session's session_token as the user's session_token

      #logged_in?
      checks if current_user exists

5. Routes
  resources vs. resource
  rails routes

6. Views
  form
    *url_helpers are ruby methods! use ERB*
    hidden input for authenticity_token
    input type password

  User
    new - create new user page
    show - user specific page

  Session
    new - login page

  application.html.erb
    header - name of the website

  #########################################

5. Controller
  index
    find all the bands in DB
    render index page

  new
    render new page

  create
    logic for adding a new data

  show
    render show page

  update
    logic for editing an existing data

  destroy
    logic for deleting an existing data

  names_params

  6. Views
    index.html.erb
    new.html.erb
    show.html.erb



  redirect_to vs render
  redirect_to will send you to the specified url
  render will render the template on the current url

  auth token
  any request other than get request, which has to go through the form, will need an auth token = all form tag needs an auth token
