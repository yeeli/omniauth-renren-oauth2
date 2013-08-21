# Omniauth Renren Oauth 2

Renren oauth2 stragy form omniauth 1.0

Read Renren Oauth2 docs form more details: [http://wiki.dev.renren.com/wiki](http://wiki.dev.renren.com/wiki)

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-renren-oauth2'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-renren-oauth2

## Usage

OmniAuth::Strategies::RenRen is simply a Rack middleware. Read the OmniAuth 1.0 docs for details instructions: [https://github.com/intridea/omniauth](https://github.com/intridea/omniauth)

Here's a quick example, adding the middleware to Rails app in config/initializers/omniauth.rb


```ruby   
Rails.application.config.middleware.use OmniAuth::Builder do
       provider :renren, ENV['RENREN_KEY'], ENV['RENREN_SECRET']
end
```

## Configuring
* `scope`:  comma-separated list of permissions you want to request from the user. See the Renren docs for a full list for available permissions: [http://wiki.dev.renren.com/wiki/%E6%9D%83%E9%99%90%E5%88%97%E8%A1%A8](http://wiki.dev.renren.com/wiki/%E6%9D%83%E9%99%90%E5%88%97%E8%A1%A8)

```ruby   
Rails.application.config.middleware.use OmniAuth::Builder do
       provider :renren, ENV['RENREN_KEY'], ENV['RENREN_SECRET'], :scope => 'read_user_feed read_user_status publish_feed publish_share' 
end
```



## Auth Hash
Here's an example Auth Hash available in `request.env['omniauth.auth']`
  
```ruby

{"provider"=>"renren",
 "uid"=> "123456789", 
 "info"=> { 
           "name"=>"test", 
           "nickname" => "test",
           "image"=>"http://hdn.xnimg.cn/photos/1.jpg", 
           "urls"=>{"Renren"=>"http://www.renren.com/222159293/profile"}},
            "credentials"=>{"token"=>"230086|32csdfg435...",
            "refresh_token"=>"230086|32csdfg435...", 
            "expires_at"=>1366628401, 
            "expires"=>true
            }, 
  "extra"=>{
     "raw_info"=>{
            "uid"=> "123456789", 
            "avatar" => [{"size" => "TINY", "url" => "http://hdn.xnimg.cn/photos/1.jpg"}]
            "name"=>"test", 
            "star"=>0, 
            "basicInformation" => { "sex" => "MALE", "birthday" => "1900-0-0"}
             }
         }
 }

```

The precise information available may depend on the permissions which you request.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
