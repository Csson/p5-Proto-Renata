export class User {
    constructor(params = {}) {
        this.userId = params.user_id || '';
        this.firstName = params.first_name || '';
        this.lastName = params.last_name || '';
        this.fullName = this.firstName + ' ' + this.lastName;
    }
}
