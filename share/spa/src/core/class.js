import { School } from './school.js';

export class Class {
    constructor(params = {}) {
        this.classId = params.classId;
        this.name = params.name;
        this.school = new School(params.school || {});
    }
}
