import { Router } from 'express';

import { getAllInterests } from '../controllers/interests.js';

const router = Router();

router.get('/interests', getAllInterests);

export default router;