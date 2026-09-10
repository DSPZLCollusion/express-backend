export interface CreatePnmBody {
    info: CreatePnm;
    on_campus: OnCampusHousing | null;
    off_campus: OffCampusHousing | null;
    interests: string[] | null;
}

export interface OnCampusHousing {
    dorm: Dorm;
    room_number: string;
}

export interface OffCampusHousing {
    street_address: string;
    city: string;
    state: string;
    zip_code: string;
}

export interface PnmDetails {
    id: number;
    first_name: string;
    last_name: string;
    class_year: ClassYear;
    status_type?: StatusType;
    email: string;
    phone_number: string;
    photo_url?: string;
    dorm?: Dorm;
    room_number?: string;
    street_address?: string;
    city?: string;
    state?: string;
    zip_code?: string;
    interests: string[];
}

export interface Pnm {
    id: number;
    first_name: string;
    last_name: string;
    class_year: ClassYear;
    status_type?: StatusType;
    email: string;
    phone_number: string;
    photo_url?: string;
}

export type CreatePnm = Omit<Pnm, 'id'>;

export type ClassYear  = 'FRESHMAN' | 'SOPHOMORE' | 'JUNIOR' | 'SENIOR' | 'SUPER_SENIOR';
export type StatusType = 'DELTA' | 'SIGMA' | 'PHI';
export type Dorm       = 'SPEED' | 'BSB' | 'BLUMBERG' | 'MEES' | 'DEMING' |
                         'SCHARPENBERG' | 'LAKESIDE' | 'PERCOPO' |
                         'APARTMENTS WEST' | 'APARTMENTS EAST' | 'TBA';

export function parseSql(req: PnmDetails): CreatePnmBody {
    const info: CreatePnm = {
        first_name:   req.first_name,
        last_name:    req.last_name,
        class_year:   req.class_year,
        email:        req.email,
        phone_number: req.phone_number,
        ...(req.status_type !== undefined && { status_type: req.status_type }),
        ...(req.photo_url   !== undefined && { photo_url:   req.photo_url }),
    };

    const on_campus: OnCampusHousing | null =
        req.dorm && req.room_number
            ? { dorm: req.dorm, room_number: req.room_number }
            : null;

    const off_campus: OffCampusHousing | null =
        req.street_address && req.city && req.state && req.zip_code
            ? {
                  street_address: req.street_address,
                  city:           req.city,
                  state:          req.state,
                  zip_code:       req.zip_code,
              }
            : null;

    return {
        info,
        on_campus,
        off_campus,
        interests: req.interests.length ? req.interests : null,
    };
}
