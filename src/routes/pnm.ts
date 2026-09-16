import { Router } from 'express';

import { getAllPnms, getPnm, createPnm, updatePnm, deletePnm, updatePnmContacted, } from '../controllers/pnm.js';
import { searchPnmsAnd, searchPnmsOr } from '../controllers/searchPnm.js';
import { verifyRole } from '../middleware/rbac.js';

const router = Router();

router.get('/pnm', verifyRole(['ADMIN', 'USER']), getAllPnms);
router.get('/pnm/searchAnd', verifyRole(['ADMIN', 'USER']), searchPnmsAnd);
router.get('/pnm/searchOr', verifyRole(['ADMIN', 'USER']), searchPnmsOr);
router.patch('/pnm/:pnmId/last_contact', verifyRole(['ADMIN']), updatePnmContacted);
router.get('/pnm/:pnmId', verifyRole(['ADMIN', 'USER']), getPnm);
router.post('/pnm', verifyRole(['ADMIN', 'USER']), createPnm);
router.put('/pnm/:pnmId', verifyRole(['ADMIN', 'USER']), updatePnm);
router.delete('/pnm/:pnmId', verifyRole(['ADMIN']), deletePnm);



export default router;
