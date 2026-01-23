import http from 'k6/http';
import { check, sleep } from 'k6';

export default function () {
    const url = 'http://localhost:3000';
    const login = http.post(`${url}/auth/login`, JSON.stringify({correo: "mateoalba1234@gmail.com", contrasena: "mateo123"}), { headers: { 'Content-Type': 'application/json' } });
    const token = login.json('access_token');
    const params = { headers: { 'Authorization': `Bearer ${token}`, 'Content-Type': 'application/json' } };

    const platoRes = http.get(`${url}/platos`, params);
    const ingRes = http.get(`${url}/ingrediente`, params);

    const plato = platoRes.json('0');
    const ing = ingRes.json('0');

    // Solo ejecuta si existen datos previos para evitar errores de integridad
    if (plato && ing) {
        const res = http.post(`${url}/recetas`, JSON.stringify({
            id_plato: plato.id_plato || plato.id,
            id_ingrediente: ing.id_ingrediente || ing.id,
            cantidad: 10
        }), params);
        check(res, { 'Receta Creada (201)': (r) => r.status === 201 });
    }
    sleep(1);
}