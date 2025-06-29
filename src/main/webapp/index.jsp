<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vinaya Donations - Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background:linear-gradient(to right,#8360c3,#2ebf91);
            text-align: center;
            padding-top: 80px;
            margin: 0;
        }
        h1 {
            font-size: 28px;
            color: #2f2f5f;
            margin-bottom: 5px;
        }
        h2 {
            font-size: 20px;
            color: #2f2f5f;
            margin-bottom: 25px;
        }
        form {
            margin: auto;
            padding: 20px;
            max-width: 90%;
        }
        input {
            width: 90%;
            max-width: 300px;
            padding: 14px;
            margin: 8px;
            border-radius: 10px;
            border: 1px solid #ccc;
            font-size: 16px;
        }
        button {
            width: 95%;
            max-width: 320px;
            padding: 14px;
            background-color: #2f2f5f;
            color: white;
            font-size: 17px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            margin-top: 18px;
        }
        a {
            text-decoration: none;
            color: #2f2f5f;
            font-weight: bold;
            display: block;
            margin-top: 12px;
        }

        @media (max-width: 480px) {
            h1 { font-size: 24px; }
            h2 { font-size: 18px; }
            button { font-size: 16px; }
        }
    </style>

</head>
<body>
    <h1>Vinaya Donations</h1>
    <h2>Login</h2>
    <form action="LoginServlet" method="post">
        <input type="text" name="username" placeholder="Name" required /><br>
        <input type="password" name="password" placeholder="Password" required /><br>

    <% String error = (String) request.getAttribute("error");
       if (error != null) { %>
       <div style="color: red; text-align: center; margin-bottom: 10px;">
           <%= error %>
       </div>
    <% } %>
        <button type="submit">Log In</button>
    </form>
    <a href="register.jsp">Don’t have an account? Sign up</a>
</body>
</html>