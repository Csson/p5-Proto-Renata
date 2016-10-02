export class Organisation {
    constructor(params = {}) {
        let self = this;
        self.organisationId = params.organisation_id;
        self.name = params.name;
    }
}
