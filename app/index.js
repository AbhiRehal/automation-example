import express from 'express';
// const express = require('express');

const app = express()

app.get('/', (req, res) => {
  res.send('Hellooooo World!')
})

if (process.env.NODE_ENV !== 'test') {
  const port = 3000;
  app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
  });
}

export default app;
