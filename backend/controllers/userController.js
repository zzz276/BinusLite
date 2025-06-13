const db = require('../database');
const bcrypt = require('bcrypt');

const signup = async (req, res) => {
  const { username, displayname, user_email, user_password } = req.body;

  const checkQuery = 'SELECT * FROM User_Account WHERE username = ? OR user_email = ?';
  db.query(checkQuery, [username, user_email], async (err, results) => {
    if (err) return res.status(500).json({ message: 'Database error' });

    if (results.length > 0) {
      const existing = results[0];
      if (existing.username === username) {
        return res.status(409).json({ message: 'Username already taken' });
      }
      if (existing.user_email === user_email) {
        return res.status(409).json({ message: 'Email already registered' });
      }
    }

    try {
      const hashedPassword = await bcrypt.hash(user_password, 10);
      const insertQuery = 'INSERT INTO User_Account (username, displayname, user_email, user_password) VALUES (?, ?, ?, ?)';
      db.query(insertQuery, [username, displayname, user_email, hashedPassword], (err, result) => {
        if (err) return res.status(500).json({ message: 'Insert failed' });

        res.status(201).json({ message: 'User registered successfully', userId: result.insertId });
      });
    } catch (err) {
      res.status(500).json({ message: 'Password encryption failed' });
    }
  });
};

const login = (req, res) => {
  const { user_email, user_password } = req.body;
  const query = 'SELECT * FROM User_Account WHERE user_email = ?';
  db.query(query, [user_email], async (err, results) => {
    if (err) return res.status(500).json({ message: 'Database error' });

    if (results.length === 0) {
      return res.status(401).json({ message: 'Email not found' });
    }

    const user = results[0];
    const isMatch = await bcrypt.compare(user_password, user.user_password);

    if (!isMatch) {
      return res.status(401).json({ message: 'Invalid password' });
    }

    res.status(200).json({
      message: 'Login successful',
      userId: user.user_id,
      username: user.username,
      displayname: user.displayname
    });
  });
};

const getUserProfile = (req, res) => {
  const { user_id } = req.params;
  const query = 'SELECT user_id, username, displayname, user_email, picture FROM User_Account WHERE user_id = ?';

  db.query(query, [user_id], (err, results) => {
    if (err) return res.status(500).json({ message: 'Database error' });
    if (results.length === 0) return res.status(404).json({ message: 'User not found' });

    res.status(200).json(results[0]);
  });
};

const updateUserProfile = (req, res) => {
  const { user_id } = req.params;
  const { displayname, picture } = req.body;

  const query = 'UPDATE User_Account SET displayname = ?, picture = ? WHERE user_id = ?';
  db.query(query, [displayname, picture, user_id], (err, result) => {
    if (err) return res.status(500).json({ message: 'Update failed' });

    res.status(200).json({ message: 'Profile updated successfully' });
  });
};

const updatePassword = async (req, res) => {
  const userId = req.params.user_id;
  const { old_password, new_password } = req.body;

  if (!old_password || !new_password) {
    return res.status(400).json({ message: 'Old and new password are required' });
  }

  const query = 'SELECT * FROM User_Account WHERE user_id = ?';
  db.query(query, [userId], async (err, results) => {
    if (err) return res.status(500).json({ message: 'Database error' });
    if (results.length === 0) return res.status(404).json({ message: 'User not found' });

    const user = results[0];

    const isMatch = await bcrypt.compare(old_password, user.user_password);
    if (!isMatch) return res.status(401).json({ message: 'Old password is incorrect' });

    const hashedPassword = await bcrypt.hash(new_password, 10);
    const updateQuery = 'UPDATE User_Account SET user_password = ? WHERE user_id = ?';
    db.query(updateQuery, [hashedPassword, userId], (err) => {
      if (err) return res.status(500).json({ message: 'Failed to update password' });

      res.status(200).json({ message: 'Password updated successfully' });
    });
  });
};

module.exports = {
  signup,
  login,
  getUserProfile,
  updateUserProfile,
  updatePassword
};
