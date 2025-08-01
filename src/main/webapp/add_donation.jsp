<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Donation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ff6b35 0%, #f7931e 25%, #ffffff 50%, #2c2c2c 75%, #000000 100%);
            background-size: 400% 400%;
            animation: gradientShift 8s ease infinite;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow-x: hidden;
        }

        /* Animated background pattern */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: 
                linear-gradient(45deg, rgba(255,107,53,0.1) 25%, transparent 25%),
                linear-gradient(-45deg, rgba(255,107,53,0.1) 25%, transparent 25%),
                linear-gradient(45deg, transparent 75%, rgba(44,44,44,0.1) 75%),
                linear-gradient(-45deg, transparent 75%, rgba(44,44,44,0.1) 75%);
            background-size: 60px 60px;
            background-position: 0 0, 0 30px, 30px -30px, -30px 0px;
            animation: patternMove 20s linear infinite;
            z-index: -1;
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        @keyframes patternMove {
            0% { transform: translate(0, 0); }
            100% { transform: translate(60px, 60px); }
        }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInScale {
            from {
                opacity: 0;
                transform: scale(0.9);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .container {
            width: 100%;
            max-width: 500px;
            padding: 20px;
            animation: slideInUp 0.8s ease-out;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #2c2c2c;
            font-size: clamp(1.8rem, 4vw, 2.5rem);
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
            animation: fadeInScale 1s ease-out 0.3s both;
            position: relative;
        }

        h2::before {
            content: '';
            position: absolute;
            left: -40px;
            top: 50%;
            transform: translateY(-50%);
            width: 24px;
            height: 24px;
            background: linear-gradient(45deg, #ff6b35, #f7931e);
            clip-path: polygon(50% 0%, 83% 12%, 100% 43%, 94% 78%, 68% 100%, 32% 100%, 6% 78%, 0% 43%, 17% 12%);
        }

        .form-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: clamp(20px, 5vw, 40px);
            box-shadow: 
                0 20px 40px rgba(0,0,0,0.15),
                0 0 0 1px rgba(255,107,53,0.1),
                inset 0 1px 0 rgba(255,255,255,0.2);
            border: 2px solid rgba(255,107,53,0.2);
            animation: fadeInScale 1s ease-out 0.5s both;
            position: relative;
            overflow: hidden;
        }

        .form-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,107,53,0.1), transparent);
            transition: left 0.6s;
        }

        .form-container:hover::before {
            left: 100%;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
            animation: slideInUp 0.6s ease-out var(--delay) both;
        }

        .form-group:nth-child(1) { --delay: 0.7s; }
        .form-group:nth-child(2) { --delay: 0.8s; }
        .form-group:nth-child(3) { --delay: 0.9s; }
        .form-group:nth-child(4) { --delay: 1.0s; }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2c2c2c;
            font-size: clamp(0.9rem, 2.5vw, 1rem);
            transition: color 0.3s ease;
            position: relative;
            padding-left: 30px;
        }

        /* CSS Icons for labels */
        .user-icon::before {
            content: '';
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            width: 20px;
            height: 20px;
            background: #ff6b35;
            border-radius: 50% 50% 50% 50% / 60% 60% 40% 40%;
        }

        .user-icon::after {
            content: '';
            position: absolute;
            left: 6px;
            top: 60%;
            transform: translateY(-50%);
            width: 8px;
            height: 8px;
            background: #fff;
            border-radius: 50%;
        }

        .phone-icon::before {
            content: '';
            position: absolute;
            left: 2px;
            top: 50%;
            transform: translateY(-50%);
            width: 16px;
            height: 16px;
            background: #ff6b35;
            border-radius: 3px;
            border: 2px solid #ff6b35;
        }

        .phone-icon::after {
            content: '';
            position: absolute;
            left: 5px;
            top: 50%;
            transform: translateY(-50%);
            width: 10px;
            height: 10px;
            background: #fff;
            border-radius: 1px;
        }

        .money-icon::before {
            content: '';
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            width: 20px;
            height: 20px;
            background: #ff6b35;
            border-radius: 50%;
        }

        .money-icon::after {
            content: '$';
            position: absolute;
            left: 6px;
            top: 50%;
            transform: translateY(-50%);
            color: #fff;
            font-weight: bold;
            font-size: 12px;
        }

        .status-icon::before {
            content: '';
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            width: 20px;
            height: 16px;
            background: #ff6b35;
            clip-path: polygon(0 0, 100% 0, 100% 70%, 90% 100%, 10% 100%, 0 70%);
        }

        .status-icon::after {
            content: '';
            position: absolute;
            left: 4px;
            top: 45%;
            transform: translateY(-50%);
            width: 12px;
            height: 1px;
            background: #fff;
            box-shadow: 
                0 3px 0 #fff,
                0 6px 0 #fff;
        }

        input, select {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid rgba(255,107,53,0.3);
            border-radius: 12px;
            font-size: clamp(14px, 3vw, 16px);
            background: rgba(255,255,255,0.9);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            z-index: 1;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #ff6b35;
            box-shadow: 
                0 0 0 3px rgba(255,107,53,0.2),
                0 8px 25px rgba(255,107,53,0.15);
            transform: translateY(-2px);
            background: rgba(255,255,255,1);
        }

        input:hover, select:hover {
            border-color: rgba(255,107,53,0.5);
            transform: translateY(-1px);
        }

        .submit-btn {
            width: 100%;
            padding: 18px 24px;
            background: linear-gradient(135deg, #ff6b35 0%, #f7931e 100%);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: clamp(16px, 3.5vw, 18px);
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 8px 25px rgba(255,107,53,0.3);
            animation: slideInUp 0.6s ease-out 1.1s both;
            padding-left: 50px;
        }

        .submit-btn::before {
            content: '';
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            width: 0;
            height: 0;
            border-left: 10px solid #fff;
            border-top: 6px solid transparent;
            border-bottom: 6px solid transparent;
        }

        .submit-btn::after {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.6s;
        }

        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 35px rgba(255,107,53,0.4);
            animation: pulse 2s infinite;
        }

        .submit-btn:hover::after {
            left: 100%;
        }

        .submit-btn:active {
            transform: translateY(-1px);
            box-shadow: 0 5px 15px rgba(255,107,53,0.3);
        }

        /* Input validation states */
        input:valid {
            border-color: #28a745;
        }

        input:invalid:not(:placeholder-shown) {
            border-color: #dc3545;
        }

        /* Mobile optimizations */
        @media (max-width: 768px) {
            .container {
                padding: 15px;
                margin: 0 10px;
            }
            
            .form-container {
                padding: 25px 20px;
                border-radius: 16px;
            }
            
            h2 {
                margin-bottom: 25px;
            }
            
            h2::before {
                left: -30px;
                width: 20px;
                height: 20px;
            }
            
            .form-group {
                margin-bottom: 20px;
            }
            
            input, select {
                padding: 12px 16px;
            }
            
            .submit-btn {
                padding: 16px 20px;
                padding-left: 45px;
            }
        }

        @media (max-width: 480px) {
            body::before {
                background-size: 40px 40px;
            }
            
            .form-container {
                padding: 20px 15px;
                margin: 10px;
            }
            
            input, select {
                padding: 10px 14px;
            }
        }

        /* High contrast mode support */
        @media (prefers-contrast: high) {
            .form-container {
                background: white;
                border: 3px solid #000;
            }
            
            input, select {
                border: 2px solid #000;
            }
        }

        /* Reduced motion support */
        @media (prefers-reduced-motion: reduce) {
            * {
                animation-duration: 0.01ms !important;
                animation-iteration-count: 1 !important;
                transition-duration: 0.01ms !important;
            }
            
            body::before {
                animation: none;
            }
        }

        /* Loading state for submit button */
        .submit-btn.loading {
            pointer-events: none;
            opacity: 0.7;
        }

        .submit-btn.loading::before {
            content: '';
            position: absolute;
            width: 20px;
            height: 20px;
            border: 2px solid transparent;
            border-top: 2px solid white;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            top: 50%;
            left: 18px;
            transform: translateY(-50%);
        }

        @keyframes spin {
            0% { transform: translateY(-50%) rotate(0deg); }
            100% { transform: translateY(-50%) rotate(360deg); }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add Donation</h2>
        
        <div class="form-container">
            <form action="save_donation.jsp" method="post" id="donationForm">
                <div class="form-group">
                    <label for="name" class="user-icon">Full Name</label>
                    <input type="text" id="name" name="name" placeholder="Enter your full name" required>
                </div>

                <div class="form-group">
                    <label for="phone" class="phone-icon">Phone Number</label>
                    <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" placeholder="Enter 10-digit phone number" required>
                </div>

                <div class="form-group">
                    <label for="amount" class="money-icon">Donation Amount</label>
                    <input type="number" id="amount" name="amount" min="1" step="0.01" placeholder="Enter amount (₹)" required>
                </div>

                <div class="form-group">
                    <label for="status" class="status-icon">Status</label>
                    <select id="status" name="status" required>
                        <option value="">Select status</option>
                        <option value="approved">Approved</option>
                        <option value="pending">Pending</option>
                    </select>
                </div>

                <button type="submit" class="submit-btn">
                    Submit Donation
                </button>
            </form>
        </div>
    </div>

    <script>
        // Enhanced form interactions
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('donationForm');
            const submitBtn = document.querySelector('.submit-btn');
            const inputs = document.querySelectorAll('input, select');

            // Add loading state on form submission
            form.addEventListener('submit', function(e) {
                submitBtn.classList.add('loading');
                submitBtn.innerHTML = 'Processing...';
            });

            // Enhanced input interactions
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.querySelector('label').style.color = '#ff6b35';
                });

                input.addEventListener('blur', function() {
                    this.parentElement.querySelector('label').style.color = '#2c2c2c';
                });

                // Real-time validation feedback
                input.addEventListener('input', function() {
                    if (this.checkValidity()) {
                        this.style.borderColor = '#28a745';
                    } else {
                        this.style.borderColor = '#dc3545';
                    }
                });
            });

            // Phone number formatting
            const phoneInput = document.getElementById('phone');
            phoneInput.addEventListener('input', function(e) {
                let value = e.target.value.replace(/\D/g, '');
                if (value.length <= 10) {
                    e.target.value = value;
                }
            });
        });
    </script>
</body>
</html>
