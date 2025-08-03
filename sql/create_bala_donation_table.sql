CREATE TABLE bala_donations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    donor_name VARCHAR(100) NOT NULL,
    donation_amount DECIMAL(10, 2) NOT NULL,
    donation_date DATE NOT NULL,
    purpose VARCHAR(255)
);