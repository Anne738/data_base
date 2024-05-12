from flask import Flask, request, jsonify
import psycopg2

app = Flask(__name__)

# Connect to PostgreSQL
conn = psycopg2.connect(
    dbname="jurassic_world",
    user="postgres",
    password="admin",
    host="localhost"
)
cur = conn.cursor()

# Створення нового запису
@app.route('/dinosaur', methods=['POST'])
def create_dinosaur():
    data = request.json
    name = data['name']
    id_type = data['id_type']
    age = data['age']
    cur.execute("INSERT INTO dinosaurs (name, id_type, age) VALUES (%s, %s, %s)", (name, id_type, age))
    conn.commit()
    return jsonify({"message": "Dinosaur created successfully"}), 201


# Отримання інформації про всіх динозаврів
@app.route('/dinosaur', methods=['GET'])
def get_all_dinosaurs():
    cur.execute("SELECT * FROM dinosaurs")
    dinosaurs = cur.fetchall()
    return jsonify(dinosaurs)

# Отримання інформації про конкретного динозавра за його ідентифікатором
@app.route('/dinosaur/<int:dino_id>', methods=['GET'])
def get_dinosaur_by_id(dino_id):
    cur.execute("SELECT * FROM dinosaurs WHERE id_dino = %s", (dino_id,))
    dinosaur = cur.fetchone()
    if dinosaur:
        return jsonify(dinosaur)
    else:
        return jsonify({"message": "Dinosaur not found"}), 404

# Оновлення інформації про динозавра
@app.route('/dinosaur/<int:dino_id>', methods=['PUT'])
def update_dinosaur(dino_id):
    data = request.json
    name = data['name']
    id_type = data['id_type']
    age = data['age']
    cur.execute("UPDATE dinosaurs SET name = %s, id_type = %s, age = %s WHERE id_dino = %s", (name, id_type, age, dino_id))
    conn.commit()
    return jsonify({"message": "Dinosaur updated successfully"})

# Видалення динозавра за його ідентифікатором
@app.route('/dinosaur/<int:dino_id>', methods=['DELETE'])
def delete_dinosaur(dino_id):
    cur.execute("DELETE FROM dinosaurs WHERE id_dino = %s", (dino_id,))
    conn.commit()
    return jsonify({"message": "Dinosaur deleted successfully"})

if __name__ == '__main__':
    app.run(debug=True)
