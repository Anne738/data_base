const express = require('express');
const router = express.Router();
const Dinosaur = require('../models/dino');
const { ObjectId } = require('mongodb');

// router.get('/', function(req, res){
//     res.send('api works');
// });


const mongoose = require('mongoose')

const db = "mongodb://localhost:27017/jurassic_world";
mongoose.Promise = global.Promise;


mongoose
  .connect(db)
  .then(() => {
    console.log("Connected to MongoDB");
  })
  .catch((err) => {
    console.error("Connection error: ", err);
  });

router.get('/Dinosaurs', async (req, res) => {
    try {
      console.log('Get request for all Dinosaurs');
      const dinosaurs = await Dinosaur.find({}).exec();
      res.json(dinosaurs);
    } catch (err) {
      console.error("Error retrieving Dinosaurs: ", err);
      res.status(500).send("Error retrieving Dinosaurs");
    }
});

router.get('/Dinosaurs/:id', async (req, res) => {
    const dinoId = req.params.id;
    try {
        console.log(`Get request for dino with ID: ${dinoId}`);
        const dino = await Dinosaur.findById(dinoId).exec();
        if (dino) {
            res.json(dino);
        } else {
            res.status(404).send("dino not found");
        }
    } catch (err) {
        console.error("Error retrieving dino: ", err);
        res.status(500).send("Error retrieving dino");
    }
});

router.post('/Dinosaurs', async (req, res) => {
    const newDino = new Dinosaur({
        name: req.body.name,
        type: req.body.type,
        age: req.body.age,
    });

    try {
        console.log('Post a new dino');
        const insertedDino = await newDino.save();
        insertedDino.__v = undefined;
        res.json(insertedDino);
    } catch (err) {
        console.error("Error posting dino: ", err);
        res.status(500).send("Error posting dino");
    }
});

router.put('/Dinosaurs/:id', async (req, res) => {
    console.log('Update a dino');
    const dinoId = req.params.id;
    

    try {
        const updatedDino = await Dinosaur.findByIdAndUpdate(
            new ObjectId(dinoId),
            {
                $set: {
                    name: req.body.name,
                    type: req.body.type,
                    age: req.body.age,
                }
            },
            {
                new: true,
            }
        );

        if (!updatedDino) {
            return res.status(404).json({ error: 'Dino not found' });
        }

        res.json(updatedDino);
    } catch (err) {
        console.error("Error updating dino:", err);
        res.status(500).json({ error: "Error updating dino" });
    }
});


router.delete('/Dinosaurs/:id', async (req, res) => {
    console.log('Deleting a dino');
    const movieId = req.params.id;

    try {
        const deletedDino = await Dinosaur.findByIdAndDelete(movieId);

        if (!deletedDino) {
            return res.status(404).json({ error: 'Dino not found' });
        }

        res.status(200).json({ message: 'Dino deleted successfully', dino: deletedDino});
    } catch (err) {
        console.error("Error deleting dino:", err);
        res.status(500).json({ error: "Error deleting dino" });
    }
});




module.exports = router;