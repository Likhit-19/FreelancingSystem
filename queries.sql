
-- Jobs Management
-- Get all jobs
SELECT * FROM JOBS WHERE STATUS="Open";
-- Get all jobs posted by a particular client
-- ID = GIVEN BY USER
SELECT * FROM JOBS WHERE client_id = ID;
-- Get job by ID (detailed view)
SELECT * FROM JOBS WHRE job_id = ID;
-- Update job details
-- DATA WILL BE GIVEN FROM USERS 
UPDATE JOBS SET title = NEW_TITLE, description = NEW_DESC, budget = NEW_BUDGET WHERE job_id = ID;
-- Delete job
DELETE FROM JOBS WHERE job_id = ID;
-- Close job (stop accepting bids)
UPDATE FROM JOBS SET STATUS="In Progress" WHERE job_id = ID ;

-- Bids Management

-- Get all bids for a job
SELECT * FROM Bids WHERE job_id = ID;
-- Get all bids placed by a freelancer      
SELECT * FROM Bids WHERE freelancer_id=ID;
-- Filter bids by:
-- Pay (min/max budget)
SELECT * FROM Bids ORDER BY bid_amount DESC;
SELECT * FROM Bids ORDER BY bid_amount ASC;
-- Freelancer rating
create view FreelancerDashboard as
    SELECT f.freelancer_id ,
        f.hourly_rate ,
        f.total_earned,
        avg(r.rating) as avg_rating
        from Reviews as r join Freelancers as f on f.freelancer_id=r.reviewee_id group by f.freelancer_id;
 
--ammount is given by user to make sure the output only includes only those freelancers that have rating more than or equal to give number and hourly rate less than or equal to given number
SELECT  b.bid_id , 
    b.job_id, 
    b.freelancer_id, 
    b.bid_amount ,b.status,f.avg_rating FROM Bids AS b JOIN FreelancerDashboard AS f ON b.freelancer_id=f.freelancer_id WHERE f.avg_rating >= RATING ORDER BY f.avg_rating DESC;

CREATE VIEW ClientDashboard AS
    SELECT c.client_id ,
        c.company_name ,
        c.total_spent,
        avg(r.rating) as avg_rating
        from Reviews as r join Client as c on c.client_id=r.reviewee_id group by c.client_id;

    SELECT * FROM Bids WHERE 
-- Sort bids by:
-- Lowest price

-- Highest rating
-- Top 3 bids (greedy selection)
-- → Based on best combination of low pay + high rating


