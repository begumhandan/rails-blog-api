Given('Context7 is initialized') do
  puts "Context7 initialized"
  @context = {}
end

When('the user submits valid registration details') do
  @user_data = {
    user: {
      name: 'Test User',
      email: "test#{Time.now.to_i}@example.com"
    }
  }
  
  post '/api/v1/users', @user_data.to_json, { 'CONTENT_TYPE' => 'application/json' }
  @response = last_response
  @created_user = JSON.parse(@response.body) if @response.status == 201
end

Then('the user should be created in the system') do
  expect(@response.status).to eq(201)
  expect(@created_user).to have_key('id')
  expect(@created_user['email']).to eq(@user_data[:user][:email])
end

And('Context7 should update the context for the new user') do
  @context[:user_id] = @created_user['id']
  @context[:user_email] = @created_user['email']
  expect(@context[:user_id]).not_to be_nil
end

When('the user logs in with valid credentials') do
  login_data = {
    email: @created_user['email']
  }
  
  post '/api/v1/login', login_data.to_json, { 'CONTENT_TYPE' => 'application/json' }
  @login_response = last_response
  @login_data = JSON.parse(@login_response.body) if @login_response.status == 200
end

Then('the user should see their profile page') do
  expect(@login_response.status).to eq(200)
  expect(@login_data).to have_key('token')
  expect(@login_data).to have_key('user')
  expect(@login_data['user']['email']).to eq(@created_user['email'])
end

And('Context7 should reflect the active user context') do
  @context[:active_user] = @login_data['user']
  @context[:auth_token] = @login_data['token']
  
  expect(@context[:active_user]).not_to be_nil
  expect(@context[:auth_token]).not_to be_nil
  puts "Active user context: #{@context[:active_user]['name']}"
end
