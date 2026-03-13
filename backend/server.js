const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

// Configuración de la conexión a MySQL
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',      // Tu usuario de Workbench
    password: 'teclado',      // Tu contraseña de Workbench (si no tiene, dejalo vacío '')
    database: 'dekofacil_db'
});

// Probar conexión
db.connect((err) => {
    if (err) {
        console.error('Error conectando a la base de datos: ' + err.stack);
        return;
    }
    console.log('✅ Conectado a la base de datos de DekoFacil');
});

// Ruta básica de prueba
app.get('/', (req, res) => {
    res.send('El servidor de Gestor DekoFacil está funcionando 🚀');
});

const PORT = 3000;
app.listen(PORT, () => {
    console.log(`🚀 Servidor corriendo en http://localhost:${PORT}`);
});