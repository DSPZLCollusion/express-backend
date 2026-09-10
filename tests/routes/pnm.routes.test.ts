import request from 'supertest';
import app from '../../src/app.js';

jest.mock('../models/user.model');

describe('GET /')