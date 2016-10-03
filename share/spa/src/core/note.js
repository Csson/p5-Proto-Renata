import { User } from './user.js';

export class Note {
    constructor(params = {}) {
        this.noteId = params.note_id;
        this.createdDate = params.created_date;
        this.contactType = params.contact_type;
        this.note = params.note;
        this.user = new User(params.user);
    }
}
