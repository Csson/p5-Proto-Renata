export class Guardian {
    constructor(params = {}) {
        this.guardianId = params.guardian_id;
        this.name = params.name;
        this.postAddress = params.post_address;
        this.phone = params.phone;
        this.workPhone = params.work_phone;
        this.email = params.email;
    }
}
