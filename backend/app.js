const express = require('express');
const cors = require('cors');
const app = express();
const userRoutes = require('./routes/user-account');
const majorRoutes = require('./routes/major');
const forumRoutes = require('./routes/forum');

var RateLimit = require('express-rate-limit');
var limiter = RateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // max 100 requests per windowMs
});

app.use(cors());
app.use(express.json());
app.use(limiter); // apply rate limiter to all requests

app.get('/', (req, res) => {
  res.send('API is running');
});

app.use('/api/user', userRoutes);
app.use('/api/major', majorRoutes);
app.use('/api/forum', forumRoutes);

app.listen(3000, () => console.log('Server running on http://localhost:3000'));

module.exports = app;
