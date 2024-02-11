<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>EVENTS</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f7f7f7;
      background:url(https://www1.chester.ac.uk/sites/default/files/styles/hero/public/Events%20Management%20festival%20image.jpg?itok=eJ3k-5R6);

      margin: 0;
      padding: 0;
    }

    .container {
      width: 80%;
      max-width: 400px;
      margin: 0 auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    h1 {
      text-align: center;
      color: #333;
    }

    form {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    label {
      margin-bottom: 6px;
      color: #555;
    }

    input[type="text"],
    input[type="radio"] {
      padding: 8px;
      width: 100%;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    input[type="radio"] {
      width: auto;
      margin-right: 10px;
    }

    input[type="submit"] {
      padding: 10px 20px;
      background-color: #333;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
      background-color: #555;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>EVENTS</h1>
    <form action=RegServlet method="post">
      <label for="event">Select Event:</label>
      <select id="event" name="event" required>
        <option value="event0">SELECT YOUR EVENT</option>
        <option value="event1">Birthday</option>
        <option value="event2">Marriage</option>
        <option value="event3">Bride to be</option>
      </select>
      <label for="attendees">Attendees:</label>
      <input type="text" id="attendees" name="attendees" required>
      <label>Preferred Time Slot:</label>
      <input type="radio" id="option1" name="choice" value="option1">
      <label for="option1">Morning</label>
      <input type="radio" id="option2" name="choice" value="option2">
      <label for="option2">Night</label>
      <br><br>
      <input type="submit" value="DONE">
    </form>
  </div>
</body>
</html>
