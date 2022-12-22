-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
Select  backers_count,cf_id, outcome
From campaign
	Where campaign.outcome = 'live'
ORDER BY backers_count
DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
Select * from backers;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT campaign.cf_id, campaign.outcome, campaign.goal- campaign.pledged as remaining_goal_amount, backers.first_name, backers.last_name, backers.email
into email_contacts_remaining_goal_amount
FROM campaign 
JOIN backers 
ON campaign.cf_id = backers.cf_id
Where campaign.outcome = 'live'
ORDER BY "remaining_goal_amount"
DESC;


-- Check the table
select * from "email_contacts_remaining_goal_amount"

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
Select email_contacts_remaining_goal_amount.email, email_contacts_remaining_goal_amount.first_name, email_contacts_remaining_goal_amount.last_name, email_contacts_remaining_goal_amount.remaining_goal_amount, email_contacts_remaining_goal_amount.cf_id, campaign.company_name, campaign.description, campaign.end_date
Into email_backers_remaining_goal_amount
From email_contacts_remaining_goal_amount
JOIN campaign
ON email_contacts_remaining_goal_amount.cf_id = campaign.cf_id
ORDER BY "email"
DESC;

-- Check the table
select* from email_backers_remaining_goal_amount