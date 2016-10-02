export class Warning {
    constructor(params = {}) {
        this.type = params.type || '';
        this.info = params.info || '';
    }
}
