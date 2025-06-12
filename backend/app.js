const express = require('express');
const cors = require('cors');
const app = express();
const userRoutes = require('./routes/user-account');
const majorRoutes = require('./routes/major');
const forumRoutes = require('./routes/forum');

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
  res.send('API is running');
});

app.use('/api/user', userRoutes);
app.use('/api/major', majorRoutes);
app.use('/api/forum', forumRoutes);

app.listen(3000, () => console.log('Server running on http://localhost:3000'));