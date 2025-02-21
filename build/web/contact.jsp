<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="my.career.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="my.career.model.Application" %>
<%@ page import="my.career.model.Program" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Career Path</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: #f4f4f9;
            color: #333;
        }
        header {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #fff;
            padding: 20px;
            text-align: center;
        }
        header h1 {
            margin: 0;
            font-size: 2rem;
        }
        header p {
            margin: 5px 0 20px;
            font-size: 1.2rem;
        }
        .contact-container {
            padding: 40px 20px;
            max-width: 1200px;
            margin: auto;
        }
        .contact-section {
            background: #fff;
            padding: 20px;
            margin: 20px 0;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .contact-section h2 {
            margin-top: 0;
            color: #2575fc;
        }
        .contact-section p {
            line-height: 1.6;
            margin: 10px 0;
        }
        .contact-form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-top: 20px;
        }
        .contact-form input, .contact-form textarea {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        .contact-form button {
            background: #2575fc;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
        }
        .contact-form button:hover {
            background: #6a11cb;
        }
        .contact-info {
            display: flex;
            justify-content: space-between;
            margin-top: 40px;
        }
        .contact-info div {
            width: 48%;
        }
        .map-container {
            margin-top: 40px;
        }
        iframe {
            width: 100%;
            height: 400px;
            border: none;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Contact Us</h1>
        <p>We would love to hear from you! Please reach out with any questions or feedback.</p>
    </header>

    <div class="contact-container">
        <div class="contact-section">
            <h2>Get in Touch</h2>
            <p>If you have any inquiries or would like to discuss partnership opportunities, please fill out the form below, and we will get back to you as soon as possible.</p>

            <!-- Contact Form -->
            <form class="contact-form">
                <div>
                    <input type="text" id="name" placeholder="Your Name" required>
                </div>
                <div>
                    <input type="email" id="email" placeholder="Your Email" required>
                </div>
                <div>
                    <input type="tel" id="phone" placeholder="Your Phone (optional)">
                </div>
                <div>
                    <textarea id="message" placeholder="Your Message" rows="6" required></textarea>
                </div>
                <div>
                    <button type="submit">Send Message</button>
                </div>
            </form>
        </div>

        <div class="contact-info">
            <!-- Business Information -->
            <div>
                <h3>Our Location</h3>
                <p>Aras 1, FAKULTI SAINS KOMPUTER DAN MATEMATIK, BANGUNAN AL-KHAWARIZMI, UNIVERSITI TEKNOLOGI MARA, 40450 SHAH ALAM SELANGOR.</p>
                <p>Email: info@careerpath.com</p>
                <p>Phone: (+6) 012-3457894</p>
            </div>
            <!-- Social Media or Other Contact Info -->
            <div>
                <h3>Follow Us</h3>
                <p>Stay connected with us on social media for updates and career tips:</p>
                <p>Facebook | Twitter | LinkedIn | Instagram</p>
            </div>
        </div>

        <!-- Embedded Google Map -->
        <div class="map-container">
            <h2>Find Us on the Map</h2>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d126073.61625413965!2d101.97917516464278!3d3.108207269429993!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da396ed8be8873%3A0x76c19b720ba2ff26!2sTaman%20Universiti%2C%20Parit%20Raja%2C%2064000%20Johor!5e0!3m2!1sen!2smy!4v1676696960935!5m2!1sen!2smy" allowfullscreen=""></iframe>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Career Path. All rights reserved.</p>
    </footer>

    <script>
        // Contact form validation (for example purposes)
        document.querySelector(".contact-form").addEventListener("submit", function(event) {
            event.preventDefault();
            alert("Thank you for your message! We will get back to you soon.");
        });
    </script>
</body>
</html>
