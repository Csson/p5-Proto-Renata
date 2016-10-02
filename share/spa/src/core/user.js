export class User {
    constructor(params = {}) {
        this.firstName = params.first_name || '';
        this.lastName = params.last_name || '';
    }
}
