const express = require('express');
const router = express.Router();
const forumController = require('../controllers/forumController');

router.post('/createForum', forumController.createForumPost);
router.get('/allForum', forumController.getAllForumPosts);
router.patch('/:post_id/vote', forumController.updateVoteCount);

module.exports = router;
