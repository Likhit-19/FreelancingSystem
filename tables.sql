
--TAble : JobPosts

CREATE TABLE job_posts(
    job_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    budget DECIMAL(10, 2) NOT NULL,
    status ENUM('Open', 'In Progress', 'Complete') NOT NULL DEFAULT 'Open',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX (client_id),
	FOREIGN KEY (client_id) REFERENCES clients(client_id) ON DELETE CASCADE
);

--Table : Admin_Action

CREATE TABLE admin_actions (
    action_id INT PRIMARY KEY AUTO_INCREMENT,
    admin_id INT NOT NULL,
    action_type VARCHAR(100) NOT NULL,
    action_description TEXT,
    action_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (admin_id) REFERENCES admins(admin_id) ON DELETE CASCADE
);