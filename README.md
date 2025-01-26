# CraveX - E-Commerce Cake Shop

CraveX is an e-commerce web application designed for a cake shop, providing two main portals: Admin and User. The platform allows admins to manage the shop's products, view orders, and maintain a list of users, while users can browse offers, view the menu, and place orders. Password protection is implemented using BCrypt and regular expressions to ensure secure user authentication.

---

## Features

### Admin Portal
- **Admin Login/Sign Up**: Admins can create an account and log in to the portal.
- **Order Management**: View all orders placed by users.
- **Product Management**: Add, update, and delete products from the menu.
- **User Management**: View and manage all followers and admins.
- **Dashboard**: Get an overview of the latest orders, users, and product updates.

### User Portal
- **User Registration/Login**: Users can register and log in to place orders.
- **Menu Browsing**: View a list of available cakes, along with detailed descriptions and prices.
- **Offers**: Browse ongoing special offers and promotions.
- **Order Placement**: Place orders for cakes and checkout.

### Security Features
- **Password Protection**: BCrypt is used for secure password hashing.
- **Regex Validation**: Validations are applied on user input fields (e.g., email, password) to ensure the correct format.

---

## Installation

To run the project locally:

1. **Clone the repository:**
    ```bash
    https://github.com/Warushika-Wijayarathna/cake-shop.git
    ```
2. **Set up the MySQL database**:
    - Create a database named `CraveX`.
    - Update the `jdbc/pool` configuration in the `context.xml` with your MySQL username and password.
3. **Run the application**:
    - You can deploy the application using a servlet container like Apache Tomcat.
    - The `persistence.xml` configuration for Hibernate should automatically set up the database schema.

---

## Technologies Used
- **Backend**: Java, Jakarta EE, JPA (Hibernate), JDBC
- **Frontend**: HTML, CSS, JavaScript (with AOS animations)
- **Database**: MySQL
- **Security**: BCrypt for password hashing, Regex for input validation

---

## License

This project is licensed under the MIT License.

---

## YouTube Video Explanation

To see a full demonstration of how the platform works, check out the YouTube video here:

[CraveX E-Commerce Cake Shop - Demo Video](https://youtu.be/j4vjyADUXn0)

