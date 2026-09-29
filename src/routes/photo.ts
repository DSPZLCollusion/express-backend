import { Router } from 'express';
import { uploadPhoto } from '../controllers/photo.js';

const router = Router();

router.post('/photo/upload_image', uploadPhoto);

export default router;