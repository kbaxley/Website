import mysql from 'mysql2';
import dotenv from 'dotenv';

dotenv.config()

const pool = mysql.createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE
}).promise()

function isValidPhoneNumber(phoneNumber) {
    const phoneRegex = /^[0-9]{10}$/; // Example: Validating US phone numbers
    return phoneRegex.test(phoneNumber);
}

export async function createAccount(name, email, password, phoneNumber) {
    if (!isValidPhoneNumber(phoneNumber)) {
        throw new Error("Invalid phone number format");
    }

    try {
        const hashedPassword = await bcrypt.hash(password, 10);
        
        await pool.query(`
            INSERT INTO userAccount (Name, Password, Email, PhoneNumber)
            VALUES (?, ?, ?, ?)
        `, [name, hashedPassword, email, phoneNumber]);
        
        console.log("Account created for:", name);
    } catch (error) {
        console.error("Error creating account:", error);
        throw error;
    }
}




const password = document.getElementById("enterPassword");

function setFormMessage(formElement, type, message) {
    const messageElement = formElement.querySelector(".form__message");

    messageElement.textContent = message;
    messageElement.classList.remove("form__message--success", "form__message--error");
    messageElement.classList.add(`form__message--${type}`);
}

function setInputError(inputElement, message){
    inputElement.classList.add("form__input--error");
    inputElement.parentElement.querySelector(".form__input-error-message").textContent = message;
}

function clearInputError(inputElement) {
    inputElement.classList.remove("form__input--error");
    inputElement.parentElement.querySelector(".form__input-error-message").textContent = "";
}

// setFormMessage(loginForm, "success", "You're logged in!");

document.addEventListener("DOMContentLoaded", () =>{
    const loginForm = document.querySelector("#login");
    const createAccountForm = document.querySelector("#createAccount");

    document.querySelector("#linkCreateAccount").addEventListener("click", e => {
        e.preventDefault();
        loginForm.classList.add("form--hidden");
        createAccountForm.classList.remove("form--hidden");

    })

    document.querySelector("#linkLogin").addEventListener("click", e => {
        e.preventDefault();
        loginForm.classList.remove("form--hidden");
        createAccountForm.classList.add("form--hidden");

    })

    loginForm.addEventListener("submit", e => {
        e.preventDefault();

        // Perform AJAX/Fetch login here

        setFormMessage(loginForm, "error", "Invalid email/password comnbination");
    })

    document.querySelectorAll(".form__input").forEach(inputElement =>{

        inputElement.addEventListener("blur", e =>{
            if (e.target.id === "signupUsername" && e.target.value.length > 0 && e.target.value.length < 6){
                setInputError(inputElement, "Username must be at least 6 characters in length");
            }
        });

        inputElement.addEventListener("blur", e => {
            if(e.target.id === "emailAddress" && !e.target.value.includes("@")){
                setInputError(inputElement, "Enter a valid email");
            }
        })

        inputElement.addEventListener("blur", e => {
            if(e.target.id === "enterPassword") {
                const password = e.target.value;
                const minLength = 8;
                const hasNumber = /\d/;
                const hasSpecialChar = /[!@#$%^&*()<>,.?":{}|]/;
                const hasCapitalLetter = /[A-Z]/;

                if (password.length >= minLength &&
                    hasNumber.test(password) &&
                    hasCapitalLetter.test(password)&&
                    hasSpecialChar.test(password)) {
                        console.log("Password is valid!")
                    } else {
                        setInputError(inputElement, "Password must have a capital letter, special character and a number");
                    }
            }
        })

        inputElement.addEventListener("blur", e => {
            if (e.target.id === "confirmPassword"){
                if(e.target.value !== password.value)
                    setInputError(inputElement, "Password does not match");
            }
        })

        inputElement.addEventListener("input", e => {
            clearInputError(inputElement);
        })
    });
});
