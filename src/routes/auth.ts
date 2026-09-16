import { Router } from 'express';
import { checkToken, login, register } from '../controllers/auth.js';
import { verifyToken } from '../middleware/auth.js';
import { verifyRole } from '../middleware/rbac.js';

const router = Router();

router.post("/auth/login", login);
router.post("/auth/register", verifyToken, verifyRole(['ADMIN', 'DIC']), register);
router.post("/auth/verify-token", verifyToken, checkToken);

export default router;