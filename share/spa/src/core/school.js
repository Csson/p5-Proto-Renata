import { Organisation } from './organisation.js';
import { User } from './user.js';

export class School {
    constructor(params = {}) {
        this.schoolId = params.school_id || -1;
        this.name = params.name || '';
        this.url = '#journal/school/' + this.schoolId;
        this.organisation = new Organisation(params.organisation || {});

        
    }
}
