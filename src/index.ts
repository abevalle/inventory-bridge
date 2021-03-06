import { express } from 'express';
const app = express();

app.get('/api', function(req, res) {
    res.send('it works!')
});

app.listen(3000);