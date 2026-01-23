import http from 'k6/http';
import { check, sleep } from 'k6';

export default function () {
    const res = http.post('http://localhost:3000/auth/login', JSON.stringify({
        correo: "mateoalba1234@gmail.com",
        contrasena: "mateo123"
    }), { headers: { 'Content-Type': 'application/json' } });

    check(res, { 'Auth OK': (r) => r.status === 201 || r.status === 200 });
    sleep(1);
}