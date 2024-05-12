const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const dinoSchema = new Schema({
    name: String,
    type: String,
    age: Number
});

module.exports = mongoose.model('dino', dinoSchema, 'Dinosaurs');