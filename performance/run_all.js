import { htmlReport } from "https://raw.githubusercontent.com/benc-uk/k6-reporter/main/dist/bundle.js";
import testAuth from './test_auth.js';
import testUsuarios from './test_usuarios.js';
import testRecetas from './test_recetas.js';

export const options = {
    scenarios: {
        auth_step: { executor: 'constant-vus', exec: 'runAuth', vus: 1, duration: '5s' },
        user_step: { executor: 'constant-vus', exec: 'runUsers', vus: 1, duration: '5s', startTime: '6s' },
        recipe_step: { executor: 'constant-vus', exec: 'runRecipes', vus: 1, duration: '5s', startTime: '12s' },
    },
};

export function runAuth() { testAuth(); }
export function runUsers() { testUsuarios(); }
export function runRecipes() { testRecetas(); }

export function handleSummary(data) {
    return { "performance/reports/Reporte_Final.html": htmlReport(data) };
}