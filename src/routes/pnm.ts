import { Router } from 'express';

import { getAllPnms, getPnm, createPnm, updatePnm, deletePnm, } from '../controllers/pnm.js';
import { searchPnmsAnd, searchPnmsOr } from '../controllers/searchPnm.js';

const router = Router();

router.get('/pnm', getAllPnms);
router.get('/pnm/searchAnd', searchPnmsAnd);
router.get('/pnm/searchOr', searchPnmsOr);
router.get('/pnm/:pnmId', getPnm);
router.post('/pnm', createPnm);
router.put('/pnm/:pnmId', updatePnm);
router.delete('/pnm/:pnmId', deletePnm);


export default router;
