# Career Clinic

SEI-20-Project 3: Career Clinic

By: Kelly, Maria and Daniel
Check out our full app here: https://career-clinic.herokuapp.com/

## About the App 

We want to build a future where everyone finds true meaning in their work.

We want to connect everyone’s sense of purpose with their interests and talents, by increasing  their opportunities to try different paths.

For example; Upon graduation, people may not know what they would want to work as. This app will allow users (also known as Explorers) to register their interests and work for a company for a stipulated time and have a taste if the roles are suitable for them.


## Statement 

We make dreams come true for those seeking a career they are passionate about, while giving companies valuable assets who would like to explore themselves in the industry. 


## Technologies used

- Ruby on Rails, Javascript, jQuery, PostgreSQL

## Approach Taken

Firstly, we drew our ERD diagram as well as our Wireframes to have a sketch on how our app would look like and the features we would like to include. We then build tables based on our ERD and find the linkage between each feature. We had a good communication and delegation of tasks. We also made sure that everyone is on the same page. We made it a point to commit and pull origin master so that our work is always in sync with each other. 

## Installation Instructions

1. Install all the ruby gems of the project is using
`
bundle install
`

2. Create the Postgres db for running on local
`
rails db:create
`
3. Create the tables neccessary to run this project
`
rails db:migrate
`
4. Seed dummy data
`rails db:seed
`

## Functions of the App

Explorer: Explorers can see which listings are available and are able to search by 5 different functions - Industry, Personality Type, Working Environment, Advanced Search and Simple Search. on the "Explore Roles" page, Explorers can see available listings posted by Employers. They can click to see more on the description and details and can also click "Register Interest". On their dashboard, they can see the listings that they have registered interest in. If the Employer has clicked "Connect" on their end, Explorers can see that Employers have indicated their interest, which they would wait for an email from the Employer.

Employer: Employers can post a job listing and specify what Industry, Personality Type, Working Environment that they are looking for. They can also see on each listing the applicants that have applied for the job. They can choose to click on the email which would open and send the email directly, or they can click "Connect" which would be shown on the Explorers dashboard that the Employers themselves have indicated interest.