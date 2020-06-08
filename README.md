# Save Your Ocean - ReadMe

## About

Save Your Ocean is an environmentally friendly project aimed at reducing single use plastics. 

We have built an application that allows users to browse nearby locations where you can fill up your bottle. 

### Features
- Track amount of plastic waste reduced
- Earn achievements and share them on social media
- Get coupons/vouchers for your activity
- Add your business
- Comment on refill stations/businesses
- Share your stats on social media
- Browse user and station profiles
- See where you rank on the leaderboards

So, what are you waiting for? [Join](https://saveyourocean.com/users/register) Save Your Ocean and become an *Ocean Hero* today!

## Install
Clone this repository.

Enter the application directory: `cd /application`

Install the required gems: `bundle install`

Setup the database: `rake db:migrate`

Start the shotgun server: `shotgun`

Register an account then to set it as admin do:

```
rake console

u = User.find(id=1)
u.role_id = 1
u.password = "your password"
u.save
```
Now this account can approve or deny new locations.


## Team
- Huong Hoang - CEO
- Nolan Mayersky - Software Engineer (@nolyoi)

## Meta

*Visit our website at:* https://saveyourocean.com/

*Like us on Facebook:* https://facebook.com/saveyourocean

<contact@saveyourocean.com>