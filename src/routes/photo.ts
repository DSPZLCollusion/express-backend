import { Router } from 'express';
import { uploadPhoto } from '../controllers/photo.js';

const router = Router();

router.post('/upload_image', uploadPhoto);

export default router;