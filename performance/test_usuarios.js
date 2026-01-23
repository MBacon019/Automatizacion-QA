import http from 'k6/http';
import { check, sleep } from 'k6';

export default function () {
    const url = 'http://localhost:3000';
    const login = http.post(`${url}/auth/login`, JSON.stringify({correo: "mateoalba1234@gmail.com", contrasena: "mateo123"}), { headers: { 'Content-Type': 'application/json' } });
    const token = login.json('access_token');
    const params = { headers: { 'Authorization': `Bearer ${token}`, 'Content-Type': 'application/json' } };

    const rolRes = http.get(`${url}/rol`, params);
    const rolId = rolRes.json('0.id_rol') || rolRes.json('0.id');
    
    // Identificador único extremo
    const uniqueId = Math.random().toString(36).substring(2, 10);
    const email = `ultra_perf_${uniqueId}@pixel.com`;

    const res = http.post(`${url}/usuario`, JSON.stringify({
        nombre: "K6_User",
        apellido: "Final_Test",
        correo: email,
        contrasena: "Pass123!",
        telefono: "999999",
        direccion: "Local_Test",
        rol_id: rolId
    }), params);

    check(res, { 'Usuario Creado (201)': (r) => r.status === 201 });
    sleep(1); 
}