import { Organisation } from './organisation.js';

export class School {
    constructor(params = {}) {
        this.schoolId = params.school_id || '';
        this.name = params.name || '';
        this.url = '#school/' + this.schoolId;
        this.organisation = new Organisation(params.organisation || {});
    }
}
