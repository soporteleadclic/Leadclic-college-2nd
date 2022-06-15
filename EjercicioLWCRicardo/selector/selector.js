import { LightningElement } from 'lwc';

export default class Selector extends LightningElement {
    selectedProducttitle;

    handleProductSelected(evt) {
        this.selectedProducttitle = evt.detail;
    }
}
