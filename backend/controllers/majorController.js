const db = require('../database');

const createMajor = (req, res) => {
  const {
    name, faculty, title, overview, career, region, videoLink,
    catalogueLink, foundedYear, duration, isWatched
  } = req.body;

  const query = `INSERT INTO Major (name, faculty, title, overview, career, region, videoLink,
    catalogueLink, foundedYear, duration, isWatched)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;

  db.query(query, [
    name, faculty, title, overview, career, region,
    videoLink, catalogueLink, foundedYear, duration, isWatched
  ], (err, result) => {
    if (err) return res.status(500).json({ message: 'Failed to insert major' });
    res.status(201).json({ message: 'Major inserted', majorId: result.insertId });
  });
};

const getAllMajors = (req, res) => {
  const query = 'SELECT * FROM Major';
  db.query(query, (err, results) => {
    if (err) return res.status(500).json({ message: 'Failed to fetch majors' });
    res.status(200).json(results);
  });
};

module.exports = {
  createMajor,
  getAllMajors
};
