CREATE DATABASE IF NOT EXISTS furreverHomeDB;
USE furreverHomeDB;
CREATE TABLE IF NOT EXISTS User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,   -- Unique identifier for the user
    Name VARCHAR(100) NOT NULL,              -- Name of the user
    Password VARCHAR(255) NOT NULL,          -- User's password (hashed)
    Email VARCHAR(255) NOT NULL UNIQUE,      -- User's email
    PhoneNumber VARCHAR(20)                  -- User's phone number
);
CREATE TABLE IF NOT EXISTS Adopter (
    AdopterID INT AUTO_INCREMENT PRIMARY KEY,    -- Unique identifier for each adopter
    UserID INT,                                  -- Reference to the user table (foreign key)
    Zipcode VARCHAR(10),                         -- Adopter's ZIP code
    FOREIGN KEY (UserID) REFERENCES User(UserID) -- Enforces relationship with User table
);
CREATE TABLE IF NOT EXISTS Admin (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,      -- Unique identifier for each admin
    UserID INT,                                  -- Reference to the user table (foreign key)
    Permissions TEXT,                            -- Permissions (Plaint text for now, can use JSON later)
    FOREIGN KEY (UserID) REFERENCES User(UserID) -- Enforces relationship with User table
);
DROP TABLE IF EXISTS Pet;
DROP TABLE IF EXISTS Shelter;
CREATE TABLE IF NOT EXISTS Shelter (
    ShelterID INT AUTO_INCREMENT PRIMARY KEY,    -- Unique identifier for each shelter
    Name VARCHAR(255) NOT NULL,                  -- Shelter name
    Address VARCHAR(255),                        -- Street address of the shelter
    Zipcode VARCHAR(10),                         -- ZIP code of the shelter
    Description TEXT,                            -- Description of the shelter
    Logo VARCHAR(255),                           -- Logo of the shelter
    WebsiteLink VARCHAR(255),                    -- Link to the shelter's website
    HoursOfOperation VARCHAR(255)                -- Hours of operation for the shelter
);
CREATE TABLE IF NOT EXISTS Pet (
    PetID INT AUTO_INCREMENT PRIMARY KEY,       -- Unique identifier for each pet
    ShelterID INT,                              -- Reference to the shelter table (foreign key)
    Name VARCHAR(100) NOT NULL,                 -- Pet's name
    Description TEXT,                           -- Description of the pet
    Image VARCHAR(255),                         -- Pet's image 
    Breed VARCHAR(100),                         -- Pet's breed
    Species VARCHAR(50),                        -- Species of the pet (e.g., dog, cat)
    Gender ENUM('Male', 'Female') NOT NULL,     -- Pet's gender
    Age INT,                                    -- Pet's age in years
    Size VARCHAR(50),                           -- Pet's size (e.g., small, medium, large)
    DateOfArrival DATE,                         -- Date the pet arrived at the shelter
    AvailabilityStatus ENUM('Available', 'Adopted', 'Processing') NOT NULL DEFAULT 'Processing', -- Availability status
    FOREIGN KEY (ShelterID) REFERENCES Shelter(ShelterID) -- Enforces relationship with Shelter table
);
INSERT INTO Shelter (Name, Address, Zipcode, Description, WebsiteLink, HoursOfOperation)
VALUES ('Second Chance Pet Rescue', '6767 Clarcona Ocoee Rd', '32810', 'Animal Rescue and Sanctuary', 'https://www.secondchanceanimalrescueandsanctuary.org/', 'Mon-Sun 10am-5pm');
INSERT INTO Pet (ShelterID, Name, Description, Image, Breed, Species, Gender, Age, Size, DateOfArrival, AvailabilityStatus)
VALUES (1, 'Buddy', 'A friendly golden retriever.', 'https://drive.google.com/file/d/1ne5lh_fCkLxeywEBvTFbl_roYiB8jm0h/view?usp=drive_link', 'Golden Retriever', 'Dog', 'Male', 3, 'Large', '2023-01-15', 'Available');
SELECT * FROM Shelter;
SELECT * FROM Pet;
