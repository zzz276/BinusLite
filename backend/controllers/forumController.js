const db = require('../database');

const createForumPost = (req, res) => {
  const { question, description, user_id } = req.body;

  const insertQuery = `
    INSERT INTO ForumPost (question, description, user_id)
    VALUES (?, ?, ?)
  `;

  db.query(insertQuery, [question, description, user_id], (err, result) => {
    if (err) {
      console.error('Error inserting forum post:', err);
      return res.status(500).json({ message: 'Failed to create post' });
    }

    res.status(201).json({ message: 'Post created successfully', postId: result.insertId });
  });
};

const getAllForumPosts = (req, res) => {
  const query = `
    SELECT f.post_id, f.question, f.description, f.voteCount, u.username
    FROM ForumPost f
    JOIN User_Account u ON f.user_id = u.user_id
    ORDER BY f.post_id DESC
  `;

  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching forum posts:', err);
      return res.status(500).json({ message: 'Failed to retrieve posts' });
    }

    res.status(200).json(results);
  });
};

const updateVoteCount = (req, res) => {
  const { post_id } = req.params;
  const { delta } = req.body; // delta bisa +1 (upvote) atau -1 (downvote)

  const updateQuery = `
    UPDATE ForumPost SET voteCount = voteCount + ?
    WHERE post_id = ?
  `;

  db.query(updateQuery, [delta, post_id], (err, result) => {
    if (err) {
      console.error('Error updating vote count:', err);
      return res.status(500).json({ message: 'Failed to update vote count' });
    }

    res.status(200).json({ message: 'Vote updated successfully' });
  });
};

module.exports = {
  createForumPost,
  getAllForumPosts,
  updateVoteCount
};
