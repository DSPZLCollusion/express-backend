import { Router } from 'express';

import { createEvent, getAllEvents } from '../controllers/events.js';
import { verifyRole } from '../middleware/rbac.js';

const router = Router();

router.get('/events', getAllEvents);
router.post('/events', verifyRole(['ADMIN', 'USER']), createEvent);

export default router;