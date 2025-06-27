-- Sample Data for Airbnb Clone

-- USERS
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
  ('u1', 'Alice', 'Johnson', 'alice@example.com', 'hash1', '1234567890', 'guest'),
  ('u2', 'Bob', 'Smith', 'bob@example.com', 'hash2', '2345678901', 'host'),
  ('u3', 'Clara', 'Lee', 'clara@example.com', 'hash3', '3456789012', 'admin');

-- PROPERTIES
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES 
  ('p1', 'u2', 'Cozy Apartment', 'A nice place to stay', 'Cairo, Egypt', 45.00),
  ('p2', 'u2', 'Beach House', 'Near the sea, quiet and relaxing', 'Alexandria, Egypt', 120.00);

-- BOOKINGS
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
  ('b1', 'p1', 'u1', '2025-07-01', '2025-07-05', 180.00, 'confirmed'),
  ('b2', 'p2', 'u1', '2025-08-10', '2025-08-15', 600.00, 'pending');

-- PAYMENTS
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES 
  ('pay1', 'b1', 180.00, 'credit_card'),
  ('pay2', 'b2', 600.00, 'paypal');

-- REVIEWS
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES 
  ('r1', 'p1', 'u1', 5, 'Great stay, very clean!'),
  ('r2', 'p2', 'u1', 4, 'Loved the location!');

-- MESSAGES
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES 
  ('m1', 'u1', 'u2', 'Hi, is the apartment available next week?'),
  ('m2', 'u2', 'u1', 'Yes, it is available!');
